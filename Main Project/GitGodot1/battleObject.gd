extends CharacterBody2D

var maxHP
var HP
var enemy
var physical_defense
var magic_defense
var damage_taken
var damage
var poison 
var	bleed 
var	burn 
var	confuse 
var	freeze

@onready var hurt = self.get_child(0).get_child(2)
@onready var damaged = self.get_child(0).get_child(3)
var current_turn : int = 0
var command_given = ""
#var stats = preload("res://globals/partyStats.gd")
var execute = preload("res://globals/battle_instance.gd").new()
# Added by Nathan, 4/17/2024
# Line below adds the nodes of "battle_party" into the tree WHEN the battleParty.tscn scene loads
@onready var players = get_tree().get_nodes_in_group("battle_party")
var enemies: Array = []
@onready var hpBar1 = $slimeBattle/hp1
# FOCUS FUNCTIONS FOR CURSOR AND BUTTONS
# Added by Nathan 4/17/2024

@onready var cursor = self.get_child(1)
# Line below gets slimeBattle, then Slime, and finally selection
@onready var button = self.get_child(0).get_child(1)
@onready var indicator = get_node("indicator")

func _ready():
	var enemyNode = self.name
	var childNode = self.get_child(0) # Gets CharacterBody2D then AnimatedSprite2D
	childNode.play("idle")
	var enemy_turn = get_node("endTurn")
	#signals.end_turn.connect(self, "new_turn") #error here! Signal not being referenced

func _process(delta):
	signals.input_command.connect(store_command)
	
func check_for_poison():
	for i in enemies:
		if i.poison == true:
			get_child(0).HP -= ceil(get_child(0).maxHP * 0.0625)
			physical_defense = 2.5
		else:
			physical_defense = 5
			
func check_for_burn():
	for i in enemies:
		if i.burn == true:
			get_child(0).HP -= ceil(get_child(0).maxHP * 0.0625)
			magic_defense = 2.5
		else:
			magic_defense = 5
			
func check_for_bleed():
	for i in enemies:
		if i.burn == true:
			get_child(0).HP -= ceil(get_child(0).maxHP * 0.125)
			
func check_for_confusion():
	for i in enemies:
		if i.confuse == true:
			var confused = randi_range(0,2)
			if confused == 0:
				pass
			else:
				pass

func check_for_freeze():
	for i in enemies:
		if i.freeze == true:
			var dethaw = randi_range(0,3)
			if dethaw == 0:
				i.freeze = false
			else:
				pass


func store_command(command, turn):
	command_given = command
	current_turn = turn

#New functions made by DEWEI
#main use is for declaring enemy targets and enemy attacks
func enemy_attack(target, enemy):
	$Slime.play("walk")
	var direction = (target.global_position - enemy.global_position).normalized()
	var velocity = direction * 10 #walk to target's location
	enemy.global_position += velocity #does not update all at once

func focus():
	cursor.show()
	button.show()
	button.grab_focus()
	
func unfocus():
	cursor.hide()
	if button != null:
		button.hide()

func _on_enemies_f_1g_1_new_turn(enemy_turn):
	while enemy_turn:
		#indicator.hide()
		enemies = $"..".get_children()
		#Written by Dewei, trying to get all enemies to attack at the same time instead of only one being able to
		for i in range(enemies.size()):
			var enemy = $".."
			var player = players[i]
			enemy_attack(player, enemy.get_child(i))
		enemy_turn = false

func update_turn_indicator():
	indicator = Vector2(0, BattleInstance.current_turn * 32)

func _on_selection_pressed():
	var enemy = get_child(0)
	var physical_calculation = round( (execute.attack_enemy(current_turn)) * (float(100 - enemy.physical_defense)/100) )
	var magic_calculation = round( (execute.magic_attack(current_turn)) * (float(100 - enemy.magic_defense)/100) )
	var character_sp = PartyMemberStats.turn_character_sp(current_turn)
	button.hide()
	signals.nextTurn.emit()
	# Processing battle commands
	if command_given == "attack":
		# Second part of expression below computes percentage value to multiply the inflicted_damage amount with. 
		# This decreases inflicted_damage by computed percentage
		signals.change_batlog.emit("Attack")
		enemy.HP -= physical_calculation * (randi_range(1,3))
	# Skills
	elif command_given == "Hard \nSlash":
		signals.change_batlog.emit("Hard Slash")
		character_sp -= PartyMemberStats.sp_cost[command_given]
		signals.update_sp.emit(character_sp)
		enemy.HP -= physical_calculation * (randi_range(4,5))
	elif command_given in PartyMemberStats.magic_attacks:
		signals.change_batlog.emit(command_given)
		character_sp -= PartyMemberStats.sp_cost[command_given]
		signals.update_sp.emit(character_sp)
		if command_given in enemy.weaknesses:
			enemy.HP -= magic_calculation * (randi_range(5,6))
		else:
			enemy.HP -= magic_calculation * (randi_range(1,3))
	update_turn_indicator()
	if BattleInstance.current_turn >= 3:
		BattleInstance.current_turn = 0
		_on_enemies_f_1g_1_new_turn(true)
	else:
		BattleInstance.current_turn += 1
	hurt.play("hurt_animation")
	damaged.start()
	await damaged.timeout
	hurt.play("RESET")
	#healthbar.value = HP
