extends AnimatedSprite2D

var HP

func _init():
	HP = 100
	
func _process(delta):
	if HP <= 0:
		self.queue_free()
		$"../../../command_menu".queue_free()


func _on_selection_pressed():
	$selection.visible = false
	
	var damage_taken = 5 * randi_range(2,10)
	print(damage_taken)
	HP -= damage_taken
	signals.nextTurn.emit()
