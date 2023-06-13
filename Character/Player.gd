extends CharacterBody2D

var FLAME = 0
const SPEED = 1000.0
const JUMP_VELOCITY = -1000.0
const DOUBLE_JUMP_VELOCITY = -1000.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var animated_sprite = $AnimatedSprite2D
@onready var dialogue_collision = $CollisionShape2D
@onready var animation_tree = $AnimationTree2
@onready var state = $AnimationTree2.get("parameters/playback")
@onready var image = $Image

var can_double_jump = false
var shiftColor = "Black"

func _ready():
	animation_tree.active = true
	pass


func _input(event):
	if event is InputEventKey:
		if event.keycode == KEY_SPACE:
			if event.is_pressed():
				get_node("/root/Tutorial").set_toggle()

func shift_images(state, dark):
	var formattedString = "res://Art/Character/Red/{color}{state}.png"
	var actualString = formattedString.format({"color": dark, "state": state})
	image.texture = load(actualString)
	pass

func set_shift(condition):
	if condition: shiftColor = "Black"
	else: shiftColor = "White"
	
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
		if(velocity.y <= 0):
			if (can_double_jump): 
#				shift_images("Jump", shiftColor)
				state.travel("Jump")
			else:
				shift_images("DoubleJump", shiftColor)
		else:
#			shift_images("Fall", shiftColor)
			state.travel("Fall")
	else:
		if(velocity.x == 0):
#			shift_images("Idle", shiftColor)
			state.travel("Idle")
		else:
#			shift_images("Run", shiftColor)
			state.travel("Run")
		can_double_jump = true # reset double jump when on floor

	# Handle Jump.
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = JUMP_VELOCITY
			can_double_jump = true
			$Sound_Jump.play()
		elif can_double_jump:
			velocity.y = DOUBLE_JUMP_VELOCITY
			state.travel("DoubleJump")
			can_double_jump = false
			$Sound_DoubleJump.play()
			
	
		
	# Get the input direction and handle the movement/deceleration.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
		
		if(velocity.x < 0):
			image.flip_h = true
		
		elif(velocity.x > 0):
			image.flip_h = false
			
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()

#dialog
func _unhandled_input(event: InputEvent):
	if Input.is_action_just_pressed("ui_down"):
		var Tanuki = dialogue_collision.get_overlapping_areas()
		if Tanuki.size() > 0:
			Tanuki[0].action()
			return

#deathzone 
func _on_fallzone_body_entered(_CharacterBody2D):
	get_tree().change_scene_to_file("res://Level/tutorial.tscn")
	$Sound_Death.play()
	
	
#collectibles
func add_flame():
	FLAME = FLAME + 1
	print("Flame Count:", FLAME)
