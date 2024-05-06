extends Node

class_name Commands
# Purpose: Store commands given to characters and allow for command execution

var command_given : String
var selected_enemy : int
var current_turn : int = 0
var inflict_damage : int = 0
var attack = attackStats.new()

# Added by Nathan on 4/26/2024

func attack_enemy(issuer):
	# Purpose: Attack an enemy
	# Parameters: Character index value
	# Return value: None
	# Sample call: execute.attack_enemy(1)
	# Ancel
	if issuer == 0:
		inflict_damage = attack.strength(0)
		print("From battle_instance.gd: Ancel hits!")
	# Lorane
	elif issuer == 1:
		inflict_damage = attack.strength(1)
		print("From battle_instance.gd: Lorane hits!")
	# Raflahn
	elif issuer == 2:
		inflict_damage = attack.strength(2)
		print("From battle_instance.gd: Raflahn hits!")
	# Younn
	elif issuer == 3:
		inflict_damage = attack.strength(3)
		print("From battle_instance.gd: Younn hits!")
	return inflict_damage
