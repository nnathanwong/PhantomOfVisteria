extends Sprite2D

# Modified by Nathan, 4/17/2024
@onready var cursor = self
# Line below gets slimeBattle, then Slime, and finally selection
@onready var button = self.get_child(0).get_child(1)
var enemy_turn = false
var current_position = self.global_position


func _ready():
	var enemyNode = self.name
	var childNode = .get_child(0) # Gets slimeBattle then Slime
	print(button)
	childNode.play("idle")

func focus():
	cursor.show()
	button.grab_focus()
	button.show()
	
func unfocus():
	cursor.hide()
	button.hide()
