extends CharacterBody2D

@onready var cursor = $cursor
@onready var button =  $Slime/selection

func focus():
	cursor.show()
	button.grab_focus()
	button.show()
	
func unfocus():
	cursor.hide()
	button.hide()
