extends Button

func _on_skills_pressed():
	# Ancel
	if BattleInstance.current_turn == 0:
		print("From skill_1.gd: Ancel's skill")
		text = "Hard \nSlash"
	# Lorane
	elif BattleInstance.current_turn == 1:
		print("From skill_1.gd: Lorane's skill")
		text = "Thunder"
	# Raflahn
	elif BattleInstance.current_turn == 2:
		print("From skill_1.gd: Raflahn's skill")
		text = "Dark"
	# Younn
	elif BattleInstance.current_turn == 3:
		print("From skill_1.gd: Younn's skill")
		text = "Spinning \nEdge"
