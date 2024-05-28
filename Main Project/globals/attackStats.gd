extends Resource

class_name attackStats

var multiplier = preload("res://globals/partyStats.gd")
var normal_damage : int = 5
var magic_damage : int = 5 

func strength(name):
	# Modified by Nathan 4/24/2024
	if name == 0:
		var ancel = PartyMemberStats.ancel_strength + normal_damage
		return ancel
	elif name == 1:
		var lorane = PartyMemberStats.lorane_strength + normal_damage
		return lorane
	elif name == 2:
		var raflahn = PartyMemberStats.raflahn_strength + normal_damage
		return raflahn
	elif name == 3:
		var younn = PartyMemberStats.younn_strength + normal_damage
		return younn

# These calculations will happen in battle_instance.gd since it's confusing
# to have the battle_instance calculations in two different scripts
func magic():
	var ancel = PartyMemberStats.ancel_magic + magic_damage
	var lorane = multiplier.Lorane.magic + magic_damage
	var raflahn = multiplier.Raflahn.magic + magic_damage
	var younn = multiplier.Younn.magic + magic_damage
