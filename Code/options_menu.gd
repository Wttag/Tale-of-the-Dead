extends Control

@onready var credits = $"CanvasLayer/Credits"

#back Button: if open from play scene should go back there if opened from menu than there
func _on_back_pressed():
	hide()
#	DisplayServer.WINDOW_EVENT_GO_BACK_REQUEST
#	print("yes going back")

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
		


func _on_button_pressed():
	print("yes")
	credits.show()
