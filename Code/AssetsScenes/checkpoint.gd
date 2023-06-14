extends Area2D

@onready var parent = get_parent().get_parent()
@onready var anim = $AnimationPlayer
var entered = false

func _on_body_entered(body):
	if body.get_groups().has("player") and not entered:
		anim.play("Activate")
		$Sound_Checkpoint.play()
		parent.set_checkpoint_position(global_position)
		entered = true
