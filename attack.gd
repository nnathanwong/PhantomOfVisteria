extends Button

#FIXME: THIS IS TEMPORARY
var character_strength = 8

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_pressed():
	var attack = character_strength * randi_range(6,10)
	
	


func _on_collision_attack_child_entered_tree(node):
	print("Hi")
