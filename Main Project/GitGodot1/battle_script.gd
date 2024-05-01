extends Node2D

@onready var hpbar1 = $battle_map/Party1Healthbar # Player 1 (Ancel's) Health bar
@onready var hpbar2 = $battle_map/Party2Healthbar # Player 1 (Ancel's) Health bar
@onready var hpbar3 = $battle_map/Party3Healthbar # Player 1 (Ancel's) Health bar
@onready var hpbar4 = $battle_map/Party4Healthbar # Player 1 (Ancel's) Health bar

# Added by Nathan on 4/26/2024
const Commands = preload("res://globals/battle_instance.gd")
var command = Commands.new()

var battle_state
#FIXME: Temp comment out by Nathan as line below impeded with debugging/caused error
#var party_members = get_node("battleParty").get_children()

func _ready():
	$command_menu/command_ui/HBoxContainer/VBoxContainer/attack.grab_focus()
	#print(hp1)

func _process(delta):
	signals.selectionState.connect(select)
	signals.nextTurn.connect(next)
	
func select(count=0):
	# Temp comment out by Nathan for debug.
	'''
	hpbar1.value = hp1
	hpbar2.value = hp2
	hpbar3.value = hp3
	hpbar4.value = hp4
	$battle_map/enemies/Slime/selection.visible = true
	$battle_map/enemies/Slime/selection.grab_focus()
	'''
	#$battle_map/enemies/SlimeBody/Slime/selection.visible = true
	#$battle_map/enemies/SlimeBody/Slime/selection.grab_focus()
	
func next():
	command.issuer += 1


