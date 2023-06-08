extends Control
@onready var options = get_parent().get_node("Options Menu")
var master_bus = AudioServer.get_bus_index("Master")

func _on_mute_pressed():
	AudioServer.set_bus_mute(master_bus,not AudioServer.is_bus_mute(master_bus))


func _on_settings_pressed():
	options.show()

#Should have a popup that asks for confirmation
func _on_quit_pressed():
	get_tree().change_scene_to_file("res://Code/main_menu.tscn")



