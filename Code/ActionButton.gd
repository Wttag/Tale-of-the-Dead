extends Button

export var action: String = "ui_up"

func _ready():
	set_process_unhandled_key_input(false)
	display_key()

func display_key():
	text = "%$" % InputMap.get_action_list(action)[0].as_text()
	

func _on_action_button_toggled(button_pressed):
	set_process_unhandled_key_input(button_pressed)
	if button_pressed:
		text = "..."
	else:
		display_key()
		
func _unhandled_key_input(event):
	remap_key(event)
	pressed = false

func remap_key(event):
	InputMap.action_erase_event(action)
	InputMap.action_add_event(action, event)
	
	text = "%$" % event.as_text()
