extends Control

func _on_start_pressed():
	get_tree().change_scene_to_file("res://Level/tutorial.tscn")
	

func _on_book_of_yokai_pressed():
	pass # Replace with function body.


func _on_map_of_yoni_pressed():
	get_tree().change_scene_to_file("res://Code/levels_menu.tscn")


func _on_options_pressed():
	get_tree().change_scene_to_file("res://Code/options_menu.tscn")


func _on_quit_pressed():
	get_tree().quit()
