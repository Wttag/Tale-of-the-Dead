extends Node 

var shift: bool = true
signal realm_shifted
	

func set_toggle():
	shift = !shift
	realm_shifted.emit()



func _on_back_pressed():
	get_tree().change_scene_to_file("res://Code/main_menu.tscn")
