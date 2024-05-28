extends Button

func _on_skills_pressed():
	# Ancel
	if BattleInstance.current_turn == 0:
		text = ""
	# Lorane
	elif BattleInstance.current_turn == 1:
		text = "Blizzard"
	# Raflahn
	elif BattleInstance.current_turn == 2:
		text = ""
	# Younn
	elif BattleInstance.current_turn == 3:
		text = ""
