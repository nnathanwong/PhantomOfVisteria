# Purpose: The purpose of this script is to store map information such as what was the scene the 
# player started with before entering the battle scene and what position the player was at before 
# initiating the battle scene. It also stores what mob enemy the player collided with.
extends Node

var current_scene = null
var position = null
var mob_collided = null
