extends Node2D

#Title: Battle Position Source Code
#Author: 16BitDev
#Date: 2023
#Availability: https://www.youtube.com/watch?v=HEexLmt7enc&t=437s

var partyMembers : Array = []

func _ready():
	partyMembers = get_children()
	for i in range(partyMembers.size()):
		partyMembers[i].position = Vector2(0,i*32)
