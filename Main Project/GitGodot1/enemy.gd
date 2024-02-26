extends CharacterBody2D

var speed = 10
var player = null
var detection = false

func _physics_process(_delta):
	if detection:
		position += (player.position - position).normalized() * speed
		$Slime.play("walk")
		look_at(player.position)
	else:
		$Slime.play("idle")
	
func _on_detection_body_entered(body):
	player = body
	detection = true

func _on_detection_body_exited(body):
	player = null
	detection = false

func _on_collision_radius_child_entered_tree(node):
	get_tree().change_scene_to_file("res://GitGodot1/BattleScene.tscn")
