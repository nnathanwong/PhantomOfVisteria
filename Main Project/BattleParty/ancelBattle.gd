extends CharacterBody2D

var stats = load("res://globals/partyStats.gd")
var ancelStats = stats.Ancel.new()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var maxHP = ancelStats.maxHP
	var hp = ancelStats.hp
	var maxSP = ancelStats.maxSP
	var sp = ancelStats.sp
	var defense = ancelStats.defense
	var strength = ancelStats.strength
	var magic = ancelStats.magic
	#FOR ACCEPTANCE CRITERIA TESTING PURPOSES
	print(maxHP, hp, maxSP, sp, defense, strength, magic)
