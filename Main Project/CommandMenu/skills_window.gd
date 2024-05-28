extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_skill_1_pressed():
	signals.selectionState.emit()
	signals.input_command.emit($HBoxContainer/column_1/skill_1.text, BattleInstance.current_turn)
func _on_skill_2_pressed():
	signals.selectionState.emit()
	signals.input_command.emit($HBoxContainer/column_2/skill_2.text, BattleInstance.current_turn)
func _on_skill_3_pressed():
	signals.selectionState.emit()
	signals.input_command.emit($HBoxContainer/column_3/skill_3.text, BattleInstance.current_turn)
