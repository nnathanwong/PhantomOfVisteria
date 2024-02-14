extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$MarginContainer/VBoxContainer/attack.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func color():
	if mouse_entered:
		print("Hi")


func _on_skills_pressed():
	get_node("skills/skills_window").visible = true
	get_node("MarginContainer/VBoxContainer").visible = false
	$skills/skills_window/row_1/VBoxContainer/skill_1.grab_focus()


func _on_items_pressed():
	get_node("items/items_window").visible = true
	get_node("MarginContainer/VBoxContainer").visible = false
	$items/items_window/row_1/VBoxContainer/item_1.grab_focus()
