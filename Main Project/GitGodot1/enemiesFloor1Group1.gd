extends Node2D

#Title: Enemy Positioning Source Code
#Author: 16BitDev
#Date: 2023
#Availability: https://www.youtube.com/watch?v=HEexLmt7enc&t=437s

var enemies: Array = []
var index: int = 0
var selectionState : bool = false
signal new_turn(enemy_turn)

func _ready():
	enemies = get_children()
	for i in enemies.size():
		enemies[i].position = Vector2(0, i*50)

func initialFocus():
	enemies[0].focus()
	selectionState = true

func _process(delta):
	# Note to self: I'm trying to get all the slime's HP in here and 
	# self queue free them here when HP is below 0 
	signals.selectionState.connect(initialFocus)
	#for i in enemies.size():
	
	#FIXME: THIS SHOWS NO MATTER WHAT
	if selectionState == true:
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


func _on_end_turn_pressed():
	print('Ended Turn!')
	var enemy_turn = true
	emit_signal("new_turn", enemy_turn)
