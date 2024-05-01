class_name Commands
# Purpose: Store commands given to characters and allow for command execution

var command_given : String
var selected_enemy : int
var issuer : int = 0
var attack = attackStats.new()

# Added by Nathan on 4/26/2024

func attack_enemy(issuer, selected_enemy):
	# Purpose: Attack an enemy
	# Parameters: Character index value
	# Return value: None
	# Sample call: 
	# Ancel
	if issuer == 0:
		var inflict_damage = attack.strength(0)
		selected_enemy.HP -= inflict_damage
	elif issuer == 1:
		var inflict_damage = attack.strength(1)
		selected_enemy.HP -= inflict_damage
	elif issuer == 2:
		var inflict_damage = attack.strength(2)
		selected_enemy.HP -= inflict_damage
	elif issuer == 3:
		var inflict_damage = attack.strength(3)
		selected_enemy.HP -= inflict_damage
