extends Label

@onready var first = get_node("../../../First/HBoxContainer/first_chosen")
@onready var second = get_node("../../../Second/HBoxContainer/second_chosen")
@onready var third = get_node("../../../Third/HBoxContainer/third_chosen")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# ANCEL
	if first.text == "Ancel" or second.text == "Ancel" or third.text == "Ancel":
		$"../ancel".visible = false
		if self.text == "Ancel":
			text = ""
	else:
		$"../ancel".visible = true
	
	#LORANE
	if first.text == "Lorane" or second.text == "Lorane" or third.text == "Lorane":
		$"../lorane".visible = false
		if self.text == "Lorane":
			text = ""
	else:
		$"../lorane".visible = true
	
	#RAFLAHN
	if first.text == "Raflahn" or second.text == "Raflahn" or third.text == "Raflahn":
		$"../raflahn".visible = false
		if self.text == "Raflahn":
			text = ""
	else:
		$"../raflahn".visible = true
		
	#YOUNN
	if first.text == "Younn" or second.text == "Younn" or third.text == "Younn":
		$"../younn".visible = false
		if self.text == "Younn":
			text = ""
	else:
		$"../younn".visible = true


func _on_ancel_pressed():
	text = "Ancel"
	return text


func _on_lorane_pressed():
	text = "Lorane"
	return text


func _on_raflahn_pressed():
	text = "Raflahn"
	return text


func _on_younn_pressed():
	text = "Younn"
	return text
