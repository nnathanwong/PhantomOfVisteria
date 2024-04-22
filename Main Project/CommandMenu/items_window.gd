extends Sprite2D

var items = preload("res://globals/itemStats.gd")
var party = preload("res://BattleParty/battleParty.gd")
# Called when the node enters the scene tree for the first time.

func _ready():
	self.visible = false

func playerSelect():
	var partyList : Array = ["Ancel", "Lorane", "Raflahn", "Younn"]
	party.partyMembers[0].partyFocus()
	var index : int = 0
	while not Input.is_action_just_pressed("ui_enter"):
		if Input.is_action_just_pressed("ui_up"):
			if index > 0:
				index -= 1
				switchFocus(index, index+1)
		elif Input.is_action_just_pressed("ui_down"):
			if index < party.partyMembers.size() - 1:
				index +=1
				switchFocus(index, index-1)
	var selected_player = partyList[index]
	return selected_player

func switchFocus(new, old):
	party.partyMembers[new].partyFocus()
	party.partyMembers[old].partyUnfocus()
	
# Each button corresponds to an item through a signal
func _on_item_1_pressed():
	var selected_player = playerSelect()
	items.Items.lh_potion(selected_player)

func _on_item_2_pressed():
	var selected_player = playerSelect()
	items.Items.gh_potion(selected_player)

func _on_item_3_pressed():
	var selected_player = playerSelect()
	items.Items.le_potion(selected_player)

func _on_item_4_pressed():
	var selected_player = playerSelect()
	items.Items.ge_potion(selected_player)

func _on_item_5_pressed():
	var selected_player = playerSelect()
	items.Items.bandages(selected_player)

func _on_item_6_pressed():
	var selected_player = playerSelect()
	items.Items.antidote(selected_player)

func _on_item_7_pressed():
	var selected_player = playerSelect()
	items.Items.aloe_vera(selected_player)
	
func _on_item_8_pressed():
	var selected_player = playerSelect()
	items.Items.liq_power(selected_player)
	
func _on_item_9_pressed():
	var selected_player = playerSelect()
	items.Items.liq_armor(selected_player)
