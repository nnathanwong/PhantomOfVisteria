extends CharacterBody2D

var speed = 90
var detection = false
@onready var playerpos = get_node("../player")

func _physics_process(delta):
	#velocity = Vector2.ZERO
	if detection:
		var direction = (playerpos.global_position - self.global_position).normalized()
		velocity = direction * speed
		$Slime.play("walk")
		if (playerpos.position.x - position.x) < 0:
			$Slime.flip_h = true
		else:
			$Slime.flip_h = false
	else:
		velocity = Vector2.ZERO
		$Slime.play("idle")
	move_and_slide()

func _on_detection_body_entered(body):
	if body.name == "player":
		detection = true

func _on_detection_body_exited(body):
	if body.name == "player":
		detection = false

func _on_collision_body_entered(body):
	if body.name == "player":
		get_tree().change_scene_to_file("res://GitGodot1/BattleScene.tscn")
