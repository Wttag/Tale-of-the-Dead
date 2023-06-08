extends Control

@onready var options = $"Options Menu"

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Level/tutorial.tscn")

func _on_options_pressed():
	options.show()

func _on_quit_pressed():
	get_tree().quit()
