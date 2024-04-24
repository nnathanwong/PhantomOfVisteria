extends Node2D

#Title: Battle Position Source Code
#Author: 16BitDev
#Date: 2023
#Availability: https://www.youtube.com/watch?v=HEexLmt7enc&t=437s

var partyMembers : Array = []

func _ready():
	partyMembers = get_children()
	for i in partyMembers.size():
		partyMembers[i].position = Vector2(0,i*32)

# Added by Nathan on 4/24/2024
class Commands:
	'''
	Purpose: Store commands given to characters and allow for command execution
	'''
	# Initializes variables to use/modify in class
	var ancel_command
	var ancel_select
	var lorane_command
	var lorane_select
	var raflahn_command
	var raflahn_select
	var younn_command
	var younn_select
	var command : String = ""
	var select : int = 0
	var attack = attackStats.new()
	func store_command(name, command, select):
		'''
		Purpose: Store commands given to characters
		Parameters: The character index of a party member and what command they were given
		Return value: None
		Sample call: commands.store_command(1, "fire")
		'''
		if name == 0:
			ancel_command = command
			ancel_select = select
		if name == 1:
			lorane_command = command
			lorane_select = select
		if name == 2:
			raflahn_command = command
			raflahn_select = select
		if name == 3:
			younn_command = command
			younn_select = select
	func execute(name):
		'''
		Purpose: Execute a character's given command
		Parameters: Character index value
		Return value: None
		Sample call: commands.execute(2) - Executes Raflahn's command
		'''
		if name == 0:
			if ancel_command == "attack":
				var inflict_damage = attack.strength(0)
				ancel_select.HP -= inflict_damage
		elif name == 1:
			if lorane_command == "attack":
				var inflict_damage = attack.strength(1)
				lorane_select.HP -= inflict_damage
		elif name == 2:
			if raflahn_command == "attack":
				var inflict_damage = attack.strength(2)
				raflahn_select.HP -= inflict_damage
		elif name == 3:
			if younn_command == "attack":
				var inflict_damage = attack.strength(3)
				younn_select.HP -= inflict_damage
