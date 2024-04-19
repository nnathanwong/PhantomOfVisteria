extends Resource

class_name ItemStats

class Items:
	
	var partyScript = preload("res://globals/partyStats.gd")
	
	func lh_potion(_selected_player):
		partyScript._selected_player.restoreHP(partyScript._selected_player.hp, 25)
	func gh_potion(_selected_player):
		partyScript._selected_player.restoreHP(partyScript._selected_player.hp, 50)
	func le_potion(_selected_player):
		partyScript._selected_player.restoreSP(partyScript._selected_player.sp, 25)
	func ge_potion(_selected_player):
		partyScript._selected_player.restoreSP(partyScript._selected_player.sp, 50)
	func bandages(_selected_player):
		pass
	func antidote(_selected_player):
		pass
	func aloe_vera(_selected_player):
		pass
	func liq_power(_selected_player):
		pass
	func liq_armor(_selected_player):
		pass
