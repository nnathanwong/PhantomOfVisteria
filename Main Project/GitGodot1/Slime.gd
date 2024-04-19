extends AnimatedSprite2D

var HP
var physical_defense
var magic_defense
var damage_taken
var damage
var stats = preload("res://globals/partyStats.gd")
# Line below commented out by Aaron because of error
#var skills = preload("res://globals/skillStats.gd") #make script for skill stats
@onready var healthbar = $slimeHealth
# Line below commented out by Aaron because of error
#var skills = preload("res://globals/attackStats.gd") #make script for skill stats

@onready var hurt = $hurteffect
@onready var damaged = $damage_timer 
@onready var cursor = $"../cursor"
@onready var player = get_node("../../players/ancel")
var enemy_turn = false
var current_position = self.global_position


func _init(): #slime's stats
	HP = 120
	physical_defense = 5
	magic_defense = 5
	damage = 5

<<<<<<< Updated upstream
=======
func _process(delta): 
	#velocity = Vector2.ZERO
	var damage_done = damage #slime's damage
	var direction = (player.global_position - self.global_position).normalized() #Target's position - slime's position = path towards player
	if enemy_turn: #slime's turn to fight
		velocity = direction * 10 #walk to target's location
		$Slime.play("walk")
		stats.Ancel.takeDamage(self, damage_done) #deals damage to Ancel
		enemy_turn = false
		var direction_back = (current_position - self.global_position).normalized()
		velocity = direction_back * 10 #walks back to starting position
		$Slime.play("walk")
	move_and_slide()
>>>>>>> Stashed changes


func _on_selection_pressed():
	$selection.visible = false #using Ancel as a test
	#var total_damage = skills.attacks.strength()
	var total_damage = 10
	damage_taken = (total_damage * randi_range(2,10)) - (total_damage * physical_defense / 100)
	$selection.visible = false

	# cursor.hide() # Hidden by Aaron because of error
	enemy_turn = true
	#cursor.hide()
	
	var damage_taken = 5 * randi_range(2,10)
	print(damage_taken)
	HP -= damage_taken
	hurt.play("hurt_animation")
	damaged.start()
	await damaged.timeout
	hurt.play("RESET")

	healthbar.value = HP
	
	if HP <= 0:
		self.queue_free()
		$"../../../command_menu".queue_free()

	
	signals.nextTurn.emit()
