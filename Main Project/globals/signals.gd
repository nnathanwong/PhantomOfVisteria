extends Node

# BATTLE SIGNALS
signal selectionState
signal nextTurn
signal decrease_turn
signal enemyDeath
signal enemy_turn
signal input_command(command, current_turn)
signal command_menu_ready
signal detection
signal mob_defeated(mob_node)
signal update_sp(character_sp)
'''
mob_defeated emits in battle_script.gd and connects in enemy.gd
'''

# UI Signals
signal change_batlog
