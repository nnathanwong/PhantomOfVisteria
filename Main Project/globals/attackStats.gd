extends Resource

class_name attackStats

class Attacks:
	var multiplier = preload("res://globals/partyStats.gd")
	var normal_damage : int = 5
	var magic_damage : int = 5 

	func strength():
		var ancel = multiplier.Ancel.strength + normal_damage
		var lorane = multiplier.Lorane.strength + normal_damage
		var raflahn = multiplier.Raflahn.strength + normal_damage
		var younn = multiplier.Younn.strength + normal_damage

	func magic():
		var ancel = multiplier.Ancel.magic + magic_damage
		var lorane = multiplier.Lorane.magic + magic_damage
		var raflahn = multiplier.Raflahn.magic + magic_damage
		var younn = multiplier.Younn.magic + magic_damage
