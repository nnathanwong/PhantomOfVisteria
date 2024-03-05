extends CharacterBody2D

var speed = 3
var player_chase = false
var player = null
var playerpos = null

func _ready():
	playerpos = get_parent().get_node("player").get_position()

func _physics_process(delta):
	var direction = Vector2.ZERO
	if player_chase and player:
		direction = (playerpos - direction).normalized()
		position += direction * speed * delta
		$Slime.play("walk")
	
		if direction.x < 0:
			$Slime.flip_h = true
		else:
			$Slime.flip_h = false
	else:
		$Slime.play("idle")

func _on_detection_body_entered(body):
	player = body
	player_chase = true

func _on_detection_body_exited(body):
	player = null
	player_chase = null
