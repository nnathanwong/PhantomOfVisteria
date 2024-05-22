extends Node2D

#Title: Battle Position Source Code
#Author: 16BitDev
#Date: 2023
#Availability: https://www.youtube.com/watch?v=HEexLmt7enc&t=437s

var partyMembers : Array = []
var status = false
signal detection(status)

func _ready():
	partyMembers = get_children()
	for i in range(partyMembers.size()):
		partyMembers[i].position = Vector2(0,i*32)

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
