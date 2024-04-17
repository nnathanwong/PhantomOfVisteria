extends CharacterBody2D

var HP
var physical_defense
var magic_defense
var damage_taken
var damage
var stats = preload("res://globals/partyStats.gd")

@onready var cursor = $cursor
@onready var button = self.get_child(0).get_child(1)
var enemy_turn = false
var current_position = self.global_position

#Modded by Nathan, 4/17/2024
#Transferred Dewei's slime.gd code to focus.gd
func _init(): #slime's stats
	HP = 120
	physical_defense = 5
	magic_defense = 5
	damage = 5

func _ready():
	var enemyNode = self.name
	var childNode = self.get_child(0)
	print(button)
	childNode.play("idle")

func focus():
	cursor.show()
	button.grab_focus()
	button.show()
	
func unfocus():
	cursor.hide()
	button.hide()

func _process(delta): 
	var player = battleParty.get_node("ancel")
	#velocity = Vector2.ZERO
	var damage_done = damage #slime's damage
	var direction = (player.get_parent().global_position - self.global_position).normalized() #Target's position - slime's position = path towards player
	if enemy_turn: #slime's turn to fight
		var velocity = direction * 10 #walk to target's location
		self.get_child(0).play("walk")
		stats.Ancel.takeDamage(self, damage_done) #deals damage to Ancel
		enemy_turn = false
		var direction_back = (current_position - self.global_position).normalized()
		velocity = direction_back * 10 #walks back to starting position
		$Slime.play("walk")
	move_and_slide()

