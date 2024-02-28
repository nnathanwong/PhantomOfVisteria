extends Node2D

@onready var ancel = get_node("battle_map/VBoxContainer/AnimatedSprite2D")
@onready var lorane = get_node("battle_map/VBoxContainer/lorane")
@onready var raflahn = get_node("battle_map/VBoxContainer/raflahn")
@onready var younn = get_node("battle_map/VBoxContainer/younn")
@onready var attack = get_node("command_menu/command_ui/HBoxContainer/VBoxContainer/attack")

var battle_state
var character_turn


func _ready():
	$battle_map/Slime.play("idle")
	$battle_map/VBoxContainer/AnimatedSprite2D.play("Side Idle")
	$command_menu/command_ui/HBoxContainer/VBoxContainer/attack.grab_focus()

func issue_commands():
	character_turn = ancel
	#await( a signal from command_menu when someone issues a command)
	
	
func _on_attack_pressed():
	$battle_map/Slime.play("walk")
	_ready()
