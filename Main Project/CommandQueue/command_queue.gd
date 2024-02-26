extends Control

@onready var first = get_node("window/VBoxContainer/First/HBoxContainer/first_chosen")
@onready var second = get_node("window/VBoxContainer/Second/HBoxContainer/second_chosen")
@onready var third = get_node("window/VBoxContainer/Third/HBoxContainer/third_chosen")
@onready var fourth = get_node("window/VBoxContainer/Fourth/HBoxContainer/fourth_chosen")



# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if fourth.text != "" and third.text != "" and second.text != "" and first.text != "":
		$window/confirm.visible = true
	else:
		$window/confirm.visible = false

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_BACKSPACE:
			$window/VBoxContainer/First/HBoxContainer/ancel.grab_focus()
			if fourth.text != "":
				fourth.text = ""
				for button in $window/VBoxContainer/Fourth/HBoxContainer.get_children():
					button.visible = true
			elif third.text != "":
				third.text = ""
				for button in $window/VBoxContainer/Third/HBoxContainer.get_children():
					button.visible = true
			elif second.text != "":
				second.text = ""
				for button in $window/VBoxContainer/Second/HBoxContainer.get_children():
					button.visible = true
			elif first.text != "":
				first.text = ""
				for button in $window/VBoxContainer/First/HBoxContainer.get_children():
					button.visible = true



func _on_confirm_pressed():
	self.visible = false
