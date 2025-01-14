extends Node2D

@onready var ancel = self.get_child(4).get_child(0).get_child(4)
@onready var lorane = self.get_child(4).get_child(1).get_child(4)
@onready var raflahn = self.get_child(4).get_child(2).get_child(4)
@onready var younn = self.get_child(4).get_child(3).get_child(4)

# Added by Nathan on 4/26/2024
const Commands = preload("res://globals/battle_instance.gd")
var command = Commands.new()
var battle_state
var victory = null
var win_status = false
var end_game = true
#FIXME: Temp comment out by Nathan as line below impeded with debugging/caused error
#var party_members = get_node("battleParty").get_children()

func _ready():
	$command_menu/command_ui/HBoxContainer/VBoxContainer/attack.grab_focus()

func _process(delta):
	ancel.play("default")
	lorane.play("default")
	raflahn.play("default")
	younn.play("default")
	if end_game:
		if not win_status:
			signals.selectionState.connect(select)
			if battle_state == false:
				if victory == true:
					$command_menu.hide()
					await get_tree().create_timer(2.2).timeout
					signals.change_batlog.emit("Victory!")
					victory == null
					await get_tree().create_timer(2).timeout
					get_tree().change_scene_to_file("res://Dungeon/DungeonRoom1Win.tscn")
			var cur_num_enemies = len(get_child(5).get_children())
			if cur_num_enemies <= 0:
				battle_state = false
				victory = true
		if win_status:
			signals.change_batlog.emit("Defeat!")
			var members = self.get_child(4)
			members.queue_free()
			end_game = false

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

func _on_battle_party_detection(status):
	win_status = status

