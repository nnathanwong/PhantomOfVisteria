extends CharacterBody2D

var speed = 10
var player = null
var detection = false

func _physics_process(_delta):
	if detection:
		position += (player.position - position).normalized() * speed
		$Slime.play("Walk")
	else:
		$Slime.play("Idle")

func _on_detection_body_entered(body):
	player = body
	detection = true

func _on_detection_body_exited(_body):
	player = null
	detection = false
