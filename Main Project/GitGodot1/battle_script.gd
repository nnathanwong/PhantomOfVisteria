extends Node2D

'''
@onready var ancel = get_node("battle_map/VBoxContainer/Player")
@onready var lorane = get_node("battle_map/VBoxContainer/lorane")
@onready var raflahn = get_node("battle_map/VBoxContainer/raflahn")
@onready var younn = get_node("battle_map/VBoxContainer/younn")
@onready var command_input = get_node("command_menu")
'''

var battle_state
var character_turn
var count : int = 0

func _ready():
	#$battle_map/Slime.play("idle")
	#$battle_map/VBoxContainer/AnimatedSprite2D.play("Side Idle")
	#$battle_map/enemies/Slime.play("idle")
	$command_menu/command_ui/HBoxContainer/VBoxContainer/attack.grab_focus()

func _process(delta):
	#character_turn = ancel
	signals.selectionState.connect(select)
	
func select():
	count += 1
	if count >= 4:
		$command_menu.visible = false
	
