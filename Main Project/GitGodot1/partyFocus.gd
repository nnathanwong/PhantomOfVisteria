extends Sprite2D

# Modified by Aidan Winters, 4/21/24
# Inspired by code for focus.gd without button commands
@onready var cursor = self

var current_position = self.global_position

func _ready():
	var partyNode = self.name
	var childNode = partyNode.get_child(0) # Gets slimeBattle then Slime
	childNode.play("idle")

func partyFocus():
	cursor.show()
	
func partyUnfocus():
	cursor.hide()
