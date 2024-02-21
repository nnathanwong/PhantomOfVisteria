extends CharacterBody2D

var speed = 10
var player = null
var detection = false

func _physics_process(_delta):
	if detection:
		position += (player.position - position).normalized() * speed
		$Slime.play("walk")
	else:
		$Slime.play("idle")
	
func _on_detection_body_entered(body):
	player = body
	detection = true

<<<<<<< HEAD

func _on_detection_body_exited(_body):
=======
func _on_detection_body_exited(body):
>>>>>>> 798ff615bdaf3b1ffdc7d9e6cdf85479180440f2
	player = null
	detection = false
	
	get_tree().change_scene_to_file("res://GitGodot1/BattleScene.tscn") # Switch to battle scene
