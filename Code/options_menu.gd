extends Control


func _on_back_pressed():
	get_tree().change_scene_to_file("res://Code/main_menu.tscn")
		
	


func _on_full_screen_toggled(button_pressed):
	pass #OS.wndow_fullscreen = button_pressed
	
func _on_borderless_toggled(button_pressed):
	pass #OS.wndow_borderless = button_pressed

func _on_v_sync_toggled(button_pressed):
	pass #OS.vsync_enabled = button_pressed
	


func _on_master_value_changed(value):
	volume(0, value)
		
func volume(bus_index, value):
	AudioServer.set_bus_volume_db(bus_index,value)
	

func _on_music_value_changed(value):
	volume(1, value)
	
	
func _on_sound_fx_value_changed(value):
	volume(2, value)
