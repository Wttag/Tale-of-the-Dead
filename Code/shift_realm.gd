extends Node 

var shift: bool = true
signal realm_shifted
	

func set_toggle():
	shift = !shift
	realm_shifted.emit()

#pause
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		$pause_menu.pause()




