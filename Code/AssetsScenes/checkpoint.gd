extends Area2D

@onready var parent = get_parent().get_parent()
@onready var anim = $AnimationPlayer

func _on_body_entered(body):
	if body.get_groups().has("player"):
		anim.play("Activate")
		$Sound_Checkpoint.play()
		print("entered")
		parent.set_checkpoint_position(global_position)
		
