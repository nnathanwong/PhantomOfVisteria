extends Label

@onready var first = get_node("../../../First/HBoxContainer/first_chosen")
@onready var third = get_node("../../../Third/HBoxContainer/third_chosen")
@onready var fourth = get_node("../../../Fourth/HBoxContainer/fourth_chosen")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# ANCEL
	if first.text == "Ancel" or third.text == "Ancel" or fourth.text == "Ancel":
		$"../ancel".visible = false
		if self.text == "Ancel":
			text = ""
	else:
		$"../ancel".visible = true
	
	#LORANE
	if first.text == "Lorane" or third.text == "Lorane" or fourth.text == "Lorane":
		$"../lorane".visible = false
		if self.text == "Lorane":
			text = ""
	else:
		$"../lorane".visible = true
	
	#RAFLAHN
	if first.text == "Raflahn" or third.text == "Raflahn" or fourth.text == "Raflahn":
		$"../raflahn".visible = false
		if self.text == "Raflahn":
			text = ""
	else:
		$"../raflahn".visible = true
		
	#YOUNN
	if first.text == "Younn" or third.text == "Younn" or fourth.text == "Younn":
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
