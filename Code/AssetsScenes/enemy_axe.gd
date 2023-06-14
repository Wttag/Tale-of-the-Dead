extends Area2D

	# Axe should move around a radius in a about 3/4 circle 
	# Shift function should be applied
	
# If collides with player player gets respawned to closesest checkpoint
func _on_body_entered(body):
	if body.get_groups().has("player"):
		get_tree().change_scene_to_file("res://Level/tutorial.tscn")
		$Sound_Death.play()
