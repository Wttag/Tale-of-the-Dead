extends Control

@onready var animator: AnimationPlayer = $Overlay/AnimationPlayer
	
	

func unpause():
	animator.play("Unpause")
	get_tree().paused = false

func pause():
	animator.play("Pause")
	get_tree().paused = true
