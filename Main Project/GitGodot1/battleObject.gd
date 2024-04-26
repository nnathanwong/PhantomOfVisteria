extends CharacterBody2D
var HP
var physical_defense
var magic_defense
var damage_taken
var damage
var stats = preload("res://globals/partyStats.gd")
var current_position = self.global_position
# Added by Nathan, 4/17/2024
# Line below adds the nodes of "battle_party" into the tree WHEN the battleParty.tscn scene loads
@onready var players = get_tree().get_nodes_in_group("battle_party")
@onready var hpBar1 = $slimeBattle/hp1


#Modded by Nathan, 4/17/2024
#Transferred Dewei's slime.gd code to focus.gd
func _init(): #slime's stats
	HP = 120
	physical_defense = 5
	magic_defense = 5
	damage = 5

'''
func _process(delta): 
	#velocity = Vector2.ZERO
	var damage_done = damage #slime's damage
	var direction = (players[0].global_position - self.global_position).normalized() #Target's position - slime's position = path towards player
	if enemy_turn: #slime's turn to fight
		var velocity = direction * 10 #walk to target's location
		self.get_child(0).play("walk")
		stats.Ancel.takeDamage(self, damage_done) #deals damage to Ancel
		enemy_turn = false
		var direction_back = (current_position - self.global_position).normalized()
		velocity = direction_back * 10 #walks back to starting position
		$Slime.play("walk")
	move_and_slide()
	'''

# FOCUS FUNCTIONS FOR CURSOR AND BUTTONS
# Added by Nathan 4/17/2024

@onready var cursor = self.get_child(1)
# Line below gets slimeBattle, then Slime, and finally selection
@onready var button = self.get_child(0).get_child(1)

func _ready():
	var enemyNode = self.name
	var childNode = self.get_child(0) # Gets slimeBattle then Slime
	print(button)
	childNode.play("idle")
	var enemy_turn = get_node("endTurn")
	#signals.end_turn.connect(self, "new_turn") #error here! Signal not being referenced

#New functions made by DEWEI
#main use is for declaring enemy targets and enemy attacks

	
func enemy_one():
	var target = randi_range(0,3)
	var direction = (players[target].global_position - self.global_position).normalized()
	var velocity = direction * 10 #walk to target's location
	self.get_child(0).play("walk")
	#stats.Ancel.takeDamage(self, damage_done) #not declared for now!
	var direction_back = (current_position - self.global_position).normalized()
	velocity = direction_back * 10 #walks back to starting position
	$Slime.play("walk")
	move_and_slide()
	
func enemy_two():
	var target = randi_range(0,3)
	var direction = (players[target].global_position - self.global_position).normalized()
	var velocity = direction * 10 #walk to target's location
	self.get_child(0).play("walk")
	#stats.Ancel.takeDamage(self, damage_done) #not declared for now!
	var direction_back = (current_position - self.global_position).normalized()
	velocity = direction_back * 10 #walks back to starting position
	$Slime.play("walk")
	move_and_slide()
	
func enemy_three():
	var target = randi_range(0,3)
	var direction = (players[target].global_position - self.global_position).normalized()
	var velocity = direction * 10 #walk to target's location
	self.get_child(0).play("walk")
	#stats.Ancel.takeDamage(self, damage_done) #not declared for now!
	var direction_back = (current_position - self.global_position).normalized()
	velocity = direction_back * 10 #walks back to starting position
	$Slime.play("walk")
	move_and_slide()

func enemy_four():
	var target = randi_range(0,3)
	var direction = (players[target].global_position - self.global_position).normalized()
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
		enemy_one()
		enemy_two()
		enemy_three()
		enemy_four()
		enemy_turn = false
