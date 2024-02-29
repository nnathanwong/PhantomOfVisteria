extends Node2D

@onready var ancel = get_node("battle_map/VBoxContainer/AnimatedSprite2D")
@onready var lorane = get_node("battle_map/VBoxContainer/lorane")
@onready var raflahn = get_node("battle_map/VBoxContainer/raflahn")
@onready var younn = get_node("battle_map/VBoxContainer/younn")
@onready var command_input = get_node("command_menu")

var battle_state
var character_turn


func _ready():
	#$battle_map/Slime.play("idle")
	#$battle_map/VBoxContainer/AnimatedSprite2D.play("Side Idle")
	$command_menu/command_ui/HBoxContainer/VBoxContainer/attack.grab_focus()

func _process(delta):
	character_turn = ancel
	signals.selectionState.connect(select)
	
func select():
	$battle_map/enemies/Slime/selection.visible = true
	$battle_map/enemies/Slime/selection.grab_focus()
	
# Comment for Dewei: Not sure why but this breaks the attack script
# I set in place to deal damage to the enemy. We can figure this out later.
'''
func _on_attack_pressed():
	$battle_map/Slime.play("walk")
	_ready()
'''
