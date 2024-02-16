extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$command_ui/HBoxContainer/VBoxContainer/attack.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_attack_pressed():
	#FIXME: This is temporary. Make a script to access character stats
	# dictionary.
	var character_strength = 5
	var attack = character_strength * randi_range(6,10)


func _on_skills_pressed():
	$skills_window.visible = true
	$command_ui.visible = false
	$skills_window/HBoxContainer/column_1/skill_1.grab_focus()
	


func _on_items_pressed():
	$items_window.visible = true
	$command_ui.visible = false
	$items_window/HBoxContainer/column_1/item_1.grab_focus()
