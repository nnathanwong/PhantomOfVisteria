extends AnimatedSprite2D

var HP
var physical_defense
var magic_defense
var damage_taken
var damage = 5
var stats = preload("res://globals/partyStats.gd")
var skills = preload("res://globals/attackStats.gd") #make script for skill stats

@onready var hurt = $hurteffect
@onready var damaged = $damage_timer
@onready var cursor = $"../cursor"
@onready var player = $battle_map/players/ancel
var enemy_turn = false

func _ready():
	$Slime.play("idle")

func _init():
	HP = 120
	physical_defense = 5
	magic_defense = 5

#moved to _on_selection_pressed(), will keep if anyone wants to view it first
func _process(delta):
	#velocity = Vector2.ZERO
	var damage_done = damage
	var curr_position = self.global_position
	var direction = (player.global_position - curr_position).normalized()
	if enemy_turn:
		velocity = direction * 10
		$Slime.play("walk")
		stats.Ancel.takeDamage(self, damage_done)
		velocity = curr_position
		enemy_turn = false
	else:
		var direction_back = (curr_position - self.global_position).normalized()
		velocity = direction_back * 10
		$Slime.play("walk")
	move_and_slide()


func _on_selection_pressed():
	$selection.visible = false #using Ancel as a test
	#var total_damage = skills.attacks.strength()
	var total_damage = 10
	damage_taken = (total_damage * randi_range(2,10)) - (total_damage * physical_defense / 100)
	$selection.visible = false
	enemy_turn = true
	#cursor.hide()
	
	var damage_taken = 5 * randi_range(2,10)
	print(damage_taken)
	HP -= damage_taken
	hurt.play("hurt_animation")
	damaged.start()
	await damaged.timeout
	hurt.play("RESET")
		
	
	signals.nextTurn.emit()
