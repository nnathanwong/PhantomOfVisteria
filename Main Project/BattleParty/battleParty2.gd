extends Node2D

#Title: Battle Position Source Code
#Author: 16BitDev
#Date: 2023
#Availability: https://www.youtube.com/watch?v=HEexLmt7enc&t=437s]
var object = load("res://GitGodot1/battleObject.gd")
var partyMembers : Array = []
var status = false
var ancel_indicator
var lorane_indicator
var raflahn_indicator
var younn_indicator = null
signal detection(status)

func _ready():
	partyMembers = get_children()
	for i in range(partyMembers.size()):
		partyMembers[i].position = Vector2(0,i*32)
	var ancel_indicator = self.get_child(0).get_child(2)
	var lorane_indicator = self.get_child(1).get_child(2)
	var raflahn_indicator = self.get_child(2).get_child(2)
	var younn_indicator = self.get_child(3).get_child(2)


func _process(delta):
	if BattleInstance.current_turn == 0:
		ancel_indicator.visible = true
		lorane_indicator.visible = false
		raflahn_indicator.visible = false
		younn_indicator.visible = false
	elif BattleInstance.current_turn == 1:
		ancel_indicator.visible = false
		lorane_indicator.visible = true
		raflahn_indicator.visible = false
		younn_indicator.visible = false
	elif BattleInstance.current_turn == 2:
		ancel_indicator.visible = false
		lorane_indicator.visible = false
		raflahn_indicator.visible = true
		younn_indicator.visible = false
	elif BattleInstance.current_turn == 3:
		ancel_indicator.visible = false
		lorane_indicator.visible = false
		raflahn_indicator.visible = false
		younn_indicator.visible = true
	'''
	partyMembers = get_children()
	var enemy_turn = await object._on_selection_pressed()
	var indicator = partyMembers[0].get_child(2)
	while enemy_turn == false:
		if BattleInstance.current_turn == 1:
			partyMembers[0].get_child(2).show()
		else:
			partyMembers[BattleInstance.current_turn - 1].get_child(2).show()
			partyMembers[BattleInstance.current_turn].get_child(2).hide()
	partyMembers[3].get_child(2).hide()
	'''

func _on_ancel_area_body_entered(body):
	if body.get_parent().name == "slimeBattle":
		status = true
		emit_signal("detection", status)

func _on_lorane_area_body_entered(body):
	if body.get_parent().name == "slimeBattle":
		status = true
		emit_signal("detection", status)


func _on_raflahn_area_body_entered(body):
	if body.get_parent().name == "enemiesF1G1":
		status = true
		emit_signal("detection", status)


func _on_younn_area_body_entered(body):
	if body.get_parent().name == "enemiesF1G1":
		status = true
		emit_signal("detection", status)
