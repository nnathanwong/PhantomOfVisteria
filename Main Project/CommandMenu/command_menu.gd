extends Control

var items_inventory = {
	item_1 = 12,
	item_2 = 7,
	item_3 = 2,
	item_4 = 17,
	item_5 = 6,
	item_6 = 9,
	item_7 = 14,
	item_8 = 30,
	item_9 = 10,
}

# Called when the node enters the scene tree for the first time.
func _ready():
	$command_ui/HBoxContainer/VBoxContainer/attack.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_BACKSPACE:
			if $skills_window.visible == true:
				$skills_window.visible = false
				$command_ui.visible = true
				$command_ui/HBoxContainer/VBoxContainer/attack.grab_focus()
			elif $items_window.visible == true:
				$items_window.visible = false
				$command_ui.visible = true
				$command_ui/HBoxContainer/VBoxContainer/attack.grab_focus()

func _on_attack_pressed():
	#FIXME: This is temporary. Make a script to access character stats
	# dictionary.
	var character_strength = 5
	var attack = character_strength * randi_range(6,10)
	var next_turn = true
	


func _on_skills_pressed():
	$skills_window.visible = true
	$command_ui.visible = false
	$skills_window/HBoxContainer/column_1/skill_1.grab_focus()
	


func _on_items_pressed():
	$items_window.visible = true
	$command_ui.visible = false
	$items_window/HBoxContainer/column_1/item_1.grab_focus()
