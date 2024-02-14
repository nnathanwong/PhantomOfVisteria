extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite2D/MarginContainer/VBoxContainer/attack.grab_focus()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func color():
	if mouse_entered:
		print("Hi")


func _on_skills_pressed():
	get_node("skills/skills_window").visible = true
	$skills/skills_window/HBoxContainer/VBoxContainer/skill_1.grab_focus()
