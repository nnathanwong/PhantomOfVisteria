extends CharacterBody2D
var HP
var physical_defense
var magic_defense
var damage_taken
var damage
var stats = preload("res://globals/partyStats.gd")
# Added by Nathan, 4/17/2024
# Line below adds the nodes of "battle_party" into the tree WHEN the battleParty.tscn scene loads
@onready var players = get_tree().get_nodes_in_group("battle_party")
var enemies: Array = []
@onready var hpBar1 = $slimeBattle/hp1

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
# Commented out because button on slimeBattle causes issues w/ indexing in enemiesGroup1Floor1.gd
# @onready var button = self.get_child(0).get_child(1)

func _ready():
	var enemyNode = self.name
	var childNode = self.get_child(0) # Gets slimeBattle then Slime
	childNode.play("idle")
	var enemy_turn = get_node("endTurn")
	#signals.end_turn.connect(self, "new_turn") #error here! Signal not being referenced

#New functions made by DEWEI
#main use is for declaring enemy targets and enemy attacks
func enemy_attack(target, enemy):
	var current_position = enemies[enemy].global_position
	var test = $"res://BattleParty/battleParty.tscn".get_child(target)
	var direction = ($"res://BattleParty/battleParty.tscn".get_child(target).global_position - enemies[enemy].global_position).normalized()
	var velocity = direction * 10 #walk to target's location
	get_child(0).play("walk")
	#stats.Ancel.takeDamage(self, damage_done) #not declared for now!
	var direction_back = (current_position - enemies[enemy].global_position).normalized()
	velocity = direction_back * 10 #walks back to starting position
	get_child(0).play("walk")
	move_and_slide()

func focus():
	cursor.show()
	#button.grab_focus()
	#button.show()
	
func unfocus():
	cursor.hide()
	#if button != null:
	#	button.hide()

func _on_enemies_f_1g_1_new_turn(enemy_turn):
	print('New Turn!')
	while enemy_turn:
		enemies = $"..".get_children()
		#Written by Dewei, trying to get all enemies to attack at the same time instead of only one being able to
		for i in enemies.size(): 
			var target = randi_range(0, players.size())
			enemy_attack(target, i)
			enemy_turn = false
