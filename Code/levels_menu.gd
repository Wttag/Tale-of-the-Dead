extends Control


#Level Button
const LEVEL_BTN = preload("res://Code/lvl_button.gd")

@export_dir var dir_path

@onready var grid = $"Content/Level Buttons"

func _ready():
	get_levels(dir_path)

func get_levels(path):
	var dir = Dictionary.new()
	if dir.open(path) == OK:
		dir.list_dir_begin()
		var file_name = dir.get_next()
		while file_name != "":
			print(file_name)
			create_level_btn('%S/%S' % {dir.get_current_dir(), file_name}, file_name)
			file_name = dir.get_next()
		dir.list_dir_end()
	else:
		print('An error has occured when trying to access path')
		
func create_level_btn(lvl_path: String, lvl_name:String) -> void:
	var btn = LEVEL_BTN.instantiate()
	btn.text = lvl_name
	btn.level_path = lvl_path
	grid.add_child(btn)
	


#Back Button
func _on_back_pressed():
	get_tree().change_scene_to_file("res://Code/main_menu.tscn")
