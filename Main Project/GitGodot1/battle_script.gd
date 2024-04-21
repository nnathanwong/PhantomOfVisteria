extends Node2D

'''
@onready var ancel = get_node("battle_map/VBoxContainer/Player")
@onready var lorane = get_node("battle_map/VBoxContainer/lorane")
@onready var raflahn = get_node("battle_map/VBoxContainer/raflahn")
@onready var younn = get_node("battle_map/VBoxContainer/younn")
@onready var command_input = get_node("command_menu")
'''

@onready var hpbar1 = $battle_map/Party1Healthbar # Player 1 (Ancel's) Health bar
@onready var hpbar2 = $battle_map/Party2Healthbar # Player 1 (Ancel's) Health bar
@onready var hpbar3 = $battle_map/Party3Healthbar # Player 1 (Ancel's) Health bar
@onready var hpbar4 = $battle_map/Party4Healthbar # Player 1 (Ancel's) Health bar

# HP Added by Aaron on 4/10/24
var ancel1 = PartyStats.Ancel.new() # Partystat Ancel class
var hp1 = ancel1.returnHP() # Returns the hp from the ancel class
var lorane1 = PartyStats.Lorane.new()
var hp2 = lorane1.returnHP()
var raflahn1 = PartyStats.Raflahn.new() 
var hp3 = raflahn1.returnHP()
var younn1 = PartyStats.Younn.new() 
var hp4 = younn1.returnHP()

var battle_state
var character_turn

var count : int = 0

func _ready():
	#$battle_map/Slime.play("idle")
	#$battle_map/VBoxContainer/AnimatedSprite2D.play("Side Idle")
	#$battle_map/enemies/Slime.play("idle")
	$command_menu/command_ui/HBoxContainer/VBoxContainer/attack.grab_focus()
	print(hp1)
	
func _process(delta):
	#character_turn = ancel
	signals.selectionState.connect(select)
	
func select():
	# Temp comment out by Nathan for debug.
	'''
	hpbar1.value = hp1
	hpbar2.value = hp2
	hpbar3.value = hp3
	hpbar4.value = hp4
<<<<<<< Updated upstream
	$battle_map/enemies/Slime/selection.visible = true
	$battle_map/enemies/Slime/selection.grab_focus()
	'''
	#$battle_map/enemies/SlimeBody/Slime/selection.visible = true
	#$battle_map/enemies/SlimeBody/Slime/selection.grab_focus()

	# MAKE A COUNT THAT GOES UP TO 4 TO EXECUTE COMMANDS
	count += 1
	if count >= 4:
		$command_menu.visible = false
