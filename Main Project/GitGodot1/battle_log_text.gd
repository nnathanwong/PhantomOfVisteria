extends Label

func _process(delta):
	signals.change_batlog.connect(change_text)
	
func change_text(new_text):
	get_parent().visible = true
	self.text = str(new_text)
	if (new_text != "Victory!") or (new_text != "Defeat"):
		await get_tree().create_timer(1.5).timeout
		get_parent().visible = false
