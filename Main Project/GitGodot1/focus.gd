extends CharacterBody2D

@onready var cursor = $cursor
@onready var button = self.get_child(0).get_child(1)


func _ready():
	var enemyNode = self.name
	var childNode = self.get_child(0)
	print(button)
	childNode.play("idle")

func focus():
	cursor.show()
	button.grab_focus()
	button.show()
	
func unfocus():
	cursor.hide()
	button.hide()
