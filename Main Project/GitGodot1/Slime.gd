extends AnimatedSprite2D

var HP
var physical_defense
var magic_defense
var damage_taken
var stats = preload("res://globals/partyStats.gd")
var skills = preload("res://globals/skillStats.gd") #make script for skill stats
@onready var hurt = $hurteffect
@onready var damaged = $damage_timer

func _ready():
	play("idle")

func _init():
	HP = 30
	physical_defense = 5
	magic_defense = 5
	
func _process(delta):
	if HP <= 0:
		damaged.start()
		hurt.play("hurt_animation")
		await(hurt)
		self.queue_free()
		$"../../../command_menu".queue_free()


func _on_selection_pressed():
	$selection.visible = false #using Ancel as a test
	#var total_damage = skills.attacks.strength()
	var total_damage = 10
	damage_taken = (total_damage * randi_range(2,10)) - (total_damage * physical_defense / 100)
	print(damage_taken)
	HP -= damage_taken
	hurt.play("hurt_animation")
	damaged.start()
	await damaged.timeout
	hurt.play("RESET")
	
	signals.nextTurn.emit()
