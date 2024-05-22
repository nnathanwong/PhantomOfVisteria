extends CharacterBody2D

const speed = 175
var current_dir = "none"

func _ready():
	# PlayerLocData.position begins with null. Pull from the position variable
	# when the position variable gets updated.
	if PlayerLocData.position != null:
		position = Vector2(PlayerLocData.position[0], PlayerLocData.position[1])

func _physics_process(delta):
	player_movement(delta)

func player_movement(delta):
	if Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_left"):
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	elif Input.is_action_pressed("ui_down") && Input.is_action_pressed("ui_up"):
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
	elif Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = speed / sqrt(2)
		velocity.y = speed / sqrt(2)
		# Storing current location data
		PlayerLocData.current_scene = get_tree().current_scene.scene_file_path
		PlayerLocData.position = Vector2()
	elif Input.is_action_pressed("ui_right") && Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = speed / sqrt(2)
		velocity.y = -speed / sqrt(2)
		# Storing current location data
		PlayerLocData.current_scene = get_tree().current_scene.scene_file_path
		PlayerLocData.position = Vector2()
	elif Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.x = -speed / sqrt(2)
		velocity.y = speed / sqrt(2)
		# Storing current location data
		PlayerLocData.current_scene = get_tree().current_scene.scene_file_path
		PlayerLocData.position = Vector2()
	elif Input.is_action_pressed("ui_left") && Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.x = -speed / sqrt(2)
		velocity.y = -speed / sqrt(2)
		# Storing current location data
		PlayerLocData.current_scene = get_tree().current_scene.scene_file_path
		PlayerLocData.position = Vector2()
	elif Input.is_action_pressed("ui_right"):
		current_dir = "right"
		play_anim(1)
		velocity.x = speed
		velocity.y = 0
		# Storing current location data
		PlayerLocData.current_scene = get_tree().current_scene.scene_file_path
		PlayerLocData.position = Vector2()
	elif Input.is_action_pressed("ui_left"):
		current_dir = "left"
		play_anim(1)
		velocity.x = -speed
		velocity.y = 0
		# Storing current location data
		PlayerLocData.current_scene = get_tree().current_scene.scene_file_path
		PlayerLocData.position = Vector2()
	elif Input.is_action_pressed("ui_down"):
		current_dir = "down"
		play_anim(1)
		velocity.y = speed
		velocity.x = 0
		# Storing current location data
		PlayerLocData.current_scene = get_tree().current_scene.scene_file_path
		PlayerLocData.position = Vector2()
	elif Input.is_action_pressed("ui_up"):
		current_dir = "up"
		play_anim(1)
		velocity.y = -speed
		velocity.x = 0
		# Storing current location data
		PlayerLocData.current_scene = get_tree().current_scene.scene_file_path
		PlayerLocData.position = Vector2()
	else:
		play_anim(0)
		velocity.x = 0
		velocity.y = 0
		
	move_and_slide()
	
func play_anim(movement):
	var dir = current_dir
	var anim = $AnimatedSprite2D
	
	if dir == "right":
		anim.flip_h = false
		if movement == 1:
			anim.play("Side Walk")
		elif movement == 0:
			anim.play("Side Idle")
	
	if dir == "left":
		anim.flip_h = true
		if movement == 1:
			anim.play("Side Walk")
		elif movement == 0:
			anim.play("Side Idle")
			
	if dir == "down":
		anim.flip_h = true
		if movement == 1:
			anim.play("Front Walk")
		elif movement == 0:
			anim.play("Front Idle")
			
	if dir == "up":
		anim.flip_h = true
		if movement == 1:
			anim.play("Back Walk")
		elif movement == 0:
			anim.play("Back Idle")
