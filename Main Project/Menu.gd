extends Control
'''This script is to change the scenes depending on what button has been clicked'''
#Dewei 5/5/2023
#const dungeon1 = preload("res://Dungeon/DungeonRoom1.tscn")

#Button Font used: https://fonts.google.com/specimen/Pixelify+Sans?query=pixel;
func _on_start_pressed(): #start game, change scene to tile_map
	#var dungeon1_instance = dungeon1.instantiate()
	#self.add_child(dungeon1_instance)
	get_tree().change_scene_to_file("res://Dungeon/DungeonRoom1.tscn")


func _on_credits_pressed(): #show credits
	pass # Replace with function body.


func _on_quit_pressed(): #quit game window
	get_tree().quit()
