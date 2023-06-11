extends Area2D



func fire_on_body_entered(body):
	$AnimationPlayer.play("Bounce")
	$Sound_Collect.play()
	body.add_flame()


func _on_animation_player_animation_finished(anim_name):
	queue_free()
