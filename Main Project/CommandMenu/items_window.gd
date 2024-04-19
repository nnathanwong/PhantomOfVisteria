extends Sprite2D

var items = preload("res://globals/itemStats.gd")
# Called when the node enters the scene tree for the first time.

func _ready():
	self.visible = false

# Each button corresponds to an item through a signal
func _on_item_1_pressed():
	items.Items.lh_potion("Ancel")

func _on_item_2_pressed():
	items.Items.gh_potion("Ancel")

func _on_item_3_pressed():
	items.Items.le_potion("Ancel")

func _on_item_4_pressed():
	items.Items.ge_potion("Ancel")

func _on_item_5_pressed():
	items.Items.bandages("Ancel")

func _on_item_6_pressed():
	items.Items.antidote("Ancel")

func _on_item_7_pressed():
	items.Items.aloe_vera("Ancel")
	
func _on_item_8_pressed():
	items.Items.liq_power("Ancel")
	
func _on_item_9_pressed():
	items.Items.liq_armor("Ancel")
