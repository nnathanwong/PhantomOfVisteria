extends Node2D

@onready var instance = preload("res://globals/attackStats.gd")

func _ready():
	var attack = instance.Attacks.strength()
	print(attack)
