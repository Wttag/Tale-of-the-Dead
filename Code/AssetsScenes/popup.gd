extends Control

@export_enum("HomeScene", "LevelScene") var type: String
@onready var title = $"VBoxContainer/Quit Game"
@onready var description = $VBoxContainer/text

func _ready():
	set_text()

func set_text():
	match type:
		"HomeScene":
			title.text = "Quit Game"
			description.text = "Are you sure you want to quit 
								the game? Your progress will 
								be lost."
			pass
		"LevelScene":
			title.text = "Quit Level"
			description.text = "If you quit all current progress will be lost forever. Are you sure you want to quit?"
			pass
	
	pass

func _on_back_pressed():
	match type:
		"HomeScene":
			get_tree().quit()
			pass
		"LevelScene":
			get_tree().change_scene_to_file("res://Code/main_menu.tscn")
			pass
	pass # Replace with function body.


func _on_quit_pressed():
	hide()
	pass # Replace with function body.
