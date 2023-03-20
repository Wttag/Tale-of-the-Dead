extends CharacterBody2D


const SPEED = 1000.0
const JUMP_VELOCITY = -1000.0
const DOUBLE_JUMP_VELOCITY = -800.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D

var can_double_jump = false

func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_SPACE:
			if event.is_pressed():
				get_node("/root/Tutorial").set_toggle()

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if(velocity.y <= 0):
			animated_sprite.animation = "Jump"
		else:
			animated_sprite.animation = "Fall"
	else:
		if(velocity.x == 0):
			animated_sprite.animation = "Idle"
		else:
			animated_sprite.animation = "Run"
		can_double_jump = true # reset double jump when on floor

	# Handle Jump.
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			can_double_jump = true
		elif can_double_jump:
			velocity.y = DOUBLE_JUMP_VELOCITY
			can_double_jump = false
			animated_sprite.set_animation("DoubleJump")
	
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
		if(velocity.x < 0):
			animated_sprite.flip_h = true
		
		elif(velocity.x > 0):
			animated_sprite.flip_h = false
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		

	move_and_slide()


#func fallzone_entered(_CharacterBody2D):
	#get_tree().change_scene_to_file("res://Level/tutorial.tscn")
