extends AnimatedSprite2D

var HP
var physical_defense
var magic_defense
var damage_taken
var stats = preload("res://globals/partyStats.gd")
var skills = preload("res://globals/skillStats.gd") #make script for skill stats
@onready var hurt = $hurteffect
@onready var damaged = $damage_timer
@onready var cursor = $"../cursor"

func _ready():
	play("idle")

func _init():
	HP = 30
	physical_defense = 5
	magic_defense = 5

#moved to _on_selection_pressed(), will keep if anyone wants to view it first
'''func _process(delta):
	if HP <= 0:
		damaged.start()
		hurt.play("hurt_animation")
		await damaged.timeout
		hurt.play("RESET")
	if hurt.current_animation == "RESET":
		self.queue_free()
		$"../../../command_menu".queue_free() '''


func _on_selection_pressed():
	$selection.visible = false #using Ancel as a test
	#var total_damage = skills.attacks.strength()
	var total_damage = 10
	damage_taken = (total_damage * randi_range(2,10)) - (total_damage * physical_defense / 100)
	$selection.visible = false
	cursor.hide()
	
	var damage_taken = 5 * randi_range(2,10)
	print(damage_taken)
	HP -= damage_taken
	hurt.play("hurt_animation")
	damaged.start()
	await damaged.timeout
	hurt.play("RESET")
	if HP <= 0:
		self.queue_free()
		$"../../../command_menu".queue_free()
	
	signals.nextTurn.emit()
