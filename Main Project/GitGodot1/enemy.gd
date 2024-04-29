extends CharacterBody2D

var speed = 90
var detection = false
@onready var playerpos = get_node("../player")

func _physics_process(delta):
	#velocity = Vector2.ZERO
	if detection:
		#slime's new direction is equal the distance between player's current position and slime's current position
		var direction = (playerpos.global_position - self.global_position).normalized()
		velocity = direction * speed
		$Slime.play("walk")
		if (playerpos.position.x - position.x) < 0: #flips sprite depending on which side player is relative to slime
			$Slime.flip_h = true
		else:
			$Slime.flip_h = false
	else: #do nothing but idle if player not detected
		velocity = Vector2.ZERO
		$Slime.play("idle")
	move_and_slide()

func _on_detection_body_entered(body):
	#checks if object enter is named 'player' or not
	if body.name == "player":
		detection = true

func _on_detection_body_exited(body):
	#checks if object exited is named 'player' or not
	if body.name == "player":
		detection = false

func _on_collision_body_entered(body):
	#checks if object enter is named 'player' or not
	if body.name == "player":
		get_tree().change_scene_to_file("res://BattleScenesFloor1/group1.tscn") #transfers scene to battle scene
