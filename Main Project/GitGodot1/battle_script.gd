extends Node2D

func _ready():
	$battle_map/Slime.play("idle")
	$battle_map/AnimatedSprite2D.play("Side Idle")
