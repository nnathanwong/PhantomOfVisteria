extends Node2D

#Title: Battle Position Source Code
#Author: 16BitDev
#Date: 2023
#Availability: https://www.youtube.com/watch?v=HEexLmt7enc&t=437s]
var object = load("res://GitGodot1/battleObject.gd")
var test = object.new()
var partyMembers : Array = []
var status = false
signal detection(status)

func _ready():
	partyMembers = get_children()
	for i in range(partyMembers.size()):
		partyMembers[i].position = Vector2(0,i*32)
		
func _process(delta):
	partyMembers = get_children()
	var enemy_turn = await test._on_selection_pressed()
	var indicator = partyMembers[0].get_child(2)
	while enemy_turn == false:
		if BattleInstance.current_turn == 1:
			partyMembers[0].get_child(2).show()
		else:
			partyMembers[BattleInstance.current_turn - 1].get_child(2).show()
			partyMembers[BattleInstance.current_turn].get_child(2).hide()
	partyMembers[3].get_child(2).hide()
	
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
