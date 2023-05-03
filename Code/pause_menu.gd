extends Control

@onready var animator: AnimationPlayer = $Overlay/AnimationPlayer
@onready var play_button: Button = find_child("ResumeButton")
@onready var quit_button: Button = find_child("QuitButton")

func _ready():
	play_button.presssed.connect(unpause)
	quit_button.pressed.connect(get_tree().quit)
	

func unpause():
	animator.play("Unpause")
	get_tree().paused = false

func pause():
	animator.play("Pause")
	get_tree().paused = true
