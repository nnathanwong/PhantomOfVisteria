extends AnimatedSprite2D

var maxHP
var HP
var physical_defense
var magic_defense
var damage_taken
var damage
var weaknesses
var poison 
var	bleed 
var	burn 
var	confuse 
var	fear

var stats = preload("res://globals/partyStats.gd")
# Line below commented out by Aaron because of error
#var skills = preload("res://globals/skillStats.gd") #make script for skill stats
# Line below commented out by Aaron because of error
#var skills = preload("res://globals/attackStats.gd") #make script for skill stats

@onready var hurt = $hurteffect
@onready var damaged = $damage_timer 
@onready var cursor = $"../cursor"
@onready var player = get_node("../../players/ancel")
@onready var hpBar = $hp1
var current_position = self.global_position

func _ready():
	self.play("idle")

func _init(): #slime's stats
	maxHP = 240
	HP = 240
	physical_defense = 5
	magic_defense = 5
	damage = 5
	# Weaknesses added by Nathan on 5/28/2024
	weaknesses = ["Fire", "Blizzard"]
	poison = false
	bleed = false
	burn = false
	confuse = false
	fear = false

func _process(delta): 
	hpBar.value = HP
	if HP <= 0:
		self.get_parent().queue_free()
