extends Button

func _on_skills_pressed():
	# Ancel
	if BattleInstance.current_turn == 0:
		text = "Wave \n Slash"
	# Lorane
	elif BattleInstance.current_turn == 1:
		text = "Fire"
	# Raflahn
	elif BattleInstance.current_turn == 2:
		text = ""
	# Younn
	elif BattleInstance.current_turn == 3:
		text = ""
