extends Node2D

#Title: Enemy Position Source Code
#Author: 16BitDev
#Date: 2023
#Availability: https://www.youtube.com/watch?v=HEexLmt7enc&t=437s

var enemies: Array = []
var index: int = 0


func _ready():
	enemies = get_children()
	for i in enemies.size():
		enemies[i].position = Vector2(0, i*50)

func initialFocus():
	enemies[0].focus()

func _process(delta):
	signals.selectionState.connect(initialFocus)
	if Input.is_action_just_pressed("ui_up"):
		if index > 0:
			index -= 1
			switchFocus(index, index+1)
	elif Input.is_action_just_pressed("ui_down"):
		if index < enemies.size() - 1:
			index +=1
			switchFocus(index, index-1)

func switchFocus(new, old):
	enemies[new].focus()
	enemies[old].unfocus()
