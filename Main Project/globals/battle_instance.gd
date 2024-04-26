extends Node

var preload_battle_instance = preload("res://BattleParty/battleParty.gd")
var battle_instance = preload_battle_instance.Commands.new()
var command_given : String = ""
var selected_enemy : int
var issuer : int = 0
