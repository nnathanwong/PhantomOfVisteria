extends CharacterBody2D

var HP
var physical_defense
var magic_defense
var damage_taken
var damage
@onready var hurt = self.get_child(0).get_child(2)
@onready var damaged = self.get_child(0).get_child(3)
var current_turn : int = 0
var command_given = ""
var stats = preload("res://globals/partyStats.gd")
var execute = preload("res://globals/battle_instance.gd").new()
# Added by Nathan, 4/17/2024
# Line below adds the nodes of "battle_party" into the tree WHEN the battleParty.tscn scene loads
var player_party = preload("res://BattleParty/battleParty.tscn").instantiate()


#Modded by Nathan, 4/17/2024
#Transferred Dewei's slime.gd code to focus.gd
func _init(): #slime's stats
	HP = 120
	physical_defense = 5
	magic_defense = 5
	damage = 5

# FOCUS FUNCTIONS FOR CURSOR AND BUTTONS
# Added by Nathan 4/17/2024

@onready var cursor = self.get_child(1)
# Line below gets slimeBattle, then Slime, and finally selection
@onready var button = self.get_child(0).get_child(1)

func _ready():
	var enemyNode = self.name
	var childNode = self.get_child(0) # Gets CharacterBody2D then AnimatedSprite2D
	childNode.play("idle")
	var enemy_turn = get_node("endTurn")
	#signals.end_turn.connect(self, "new_turn") #error here! Signal not being referenced

func _process(delta):
	signals.input_command.connect(store_command)
	
func store_command(command, turn):
	command_given = command
	current_turn = turn
	#if turn == 0:
	#	current_turn = "Ancel"

#New functions made by DEWEI
#main use is for declaring enemy targets and enemy attacks
func enemy_one(target):
	var current_position = self.global_position
	var direction = (player_party[target].global_position - self.global_position).normalized()
	var velocity = direction * 10 #walk to target's location
	self.get_child(0).play("walk")
	#stats.Ancel.takeDamage(self, damage_done) #not declared for now!
	var direction_back = (current_position - self.global_position).normalized()
	velocity = direction_back * 10 #walks back to starting position
	$Slime.play("walk")
	move_and_slide()

func focus():
	cursor.show()
	button.grab_focus()
	button.show()
	
func unfocus():
	cursor.hide()
	if button != null:
		button.hide()

func _on_enemies_f_1g_1_new_turn(enemy_turn):
	print('New Turn!')
	
	while enemy_turn:
		var target = randi_range(0, player_party.partyMembers.size())
		enemy_one(target)
		enemy_turn = false


func _on_selection_pressed():
	if command_given == "attack":
		execute.attack_enemy(current_turn, command_given)
	hurt.play("hurt_animation")
	damaged.start()
	await damaged.timeout
	hurt.play("RESET")

	#healthbar.value = HP
	signals.nextTurn.emit()
