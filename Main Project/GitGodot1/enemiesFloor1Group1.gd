extends Node2D

#Title: Enemy Positioning Source Code
#Author: 16BitDev
#Date: 2023
#Availability: https://www.youtube.com/watch?v=HEexLmt7enc&t=437s

var enemies: Array = []
var index: int = 0
var selectionState : bool = false
signal new_turn(enemy_turn)
var attack_damage = preload("res://globals/attackStats.gd")

func _ready():
	enemies = get_children()
	for i in enemies.size():
		enemies[i].position = Vector2(0, i*50)

func initialFocus():
	if enemies[0] != null:
		enemies[0].focus()
		selectionState = true

func _process(delta):
	enemies = get_children()
	signals.selectionState.connect(initialFocus)
	if selectionState == true:
		if Input.is_action_just_pressed("ui_up"):
			if index > 0:
				index -= 1
				switchFocus(index, index+1)
		elif Input.is_action_just_pressed("ui_down"):
			if index < enemies.size() - 1:
				index +=1
				switchFocus(index, index-1)
		# Added by Nathan on 4/24/2024
		elif Input.is_action_just_pressed("ui_accept"):
			selectionState = false
			enemies[index].get_child(1).hide()
			'''
			if BattleInstance != null:
				BattleInstance.selected_enemy = index
				selectionState = false
				enemies[index].unfocus()
				# Processing command given
				#if BattleInstance.command_given == "attack":
					#inflict_damage = slime - 
				signals.nextTurn.emit()
				while $"../command_menu" == null:
					if $"../command_menu" != null:
						$command_ui/HBoxContainer/VBoxContainer/attack.grab_focus()
			'''

func switchFocus(new, old):
	enemies[new].focus()
	enemies[old].unfocus()
