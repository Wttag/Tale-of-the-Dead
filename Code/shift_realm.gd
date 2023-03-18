extends Node 

var shift: bool = true
signal realm_shifted
	

func set_toggle():
	shift = !shift
	realm_shifted.emit()

