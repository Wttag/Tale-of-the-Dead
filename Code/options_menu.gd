extends Control




#back
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Code/main_menu.tscn")
		

#Sound Setting
func _on_master_value_changed(value):
	volume(0, value)
		
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index,value)
	

func _on_music_value_changed(value):
	volume(1, value)
	
	
func _on_sound_fx_value_changed(value):
	volume(2, value)


#Video Setting
func _on_full_screen_toggled(button_pressed):
	if button_pressed == true:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	else:
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
		

func _on_1920x_1080_toggled(button_pressed):
	pass # Replace with function body.


func _on_1280x_720_toggled(button_pressed):
	pass # Replace with function body.
