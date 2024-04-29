extends AnimatedSprite2D

var HP
var physical_defense
var magic_defense
var damage_taken
var damage
var stats = preload("res://globals/partyStats.gd")
# Line below commented out by Aaron because of error
#var skills = preload("res://globals/skillStats.gd") #make script for skill stats
# Line below commented out by Aaron because of error
#var skills = preload("res://globals/attackStats.gd") #make script for skill stats

@onready var hurt = $hurteffect
@onready var damaged = $damage_timer 
@onready var cursor = $"../cursor"
@onready var player = get_node("../../players/ancel")
@onready var hpBar = $hp1
var current_position = self.global_position

func _ready():
	self.play("idle")
func _init(): #slime's stats
	HP = 120
	physical_defense = 5
	magic_defense = 5
	damage = 5

func _process(delta): 
	hpBar.value = HP
	if HP <= 0:
		self.queue_free()
'''
func _on_selection_pressed():
	
	$selection.visible = false #using Ancel as a test
	#var total_damage = skills.attacks.strength()
	var total_damage = 10
	damage_taken = (total_damage * randi_range(2,10)) - (total_damage * physical_defense / 100)
	$selection.visible = false
	
	var damage_taken = 5 * randi_range(2,10)
	print(damage_taken)
	HP -= damage_taken
	hurt.play("hurt_animation")
	damaged.start()
	await damaged.timeout
	hurt.play("RESET")

	#healthbar.value = HP
	signals.nextTurn.emit()
'''
