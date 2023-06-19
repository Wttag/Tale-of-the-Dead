extends Area2D

@export var dialouge_resource: DialogueResource
@export var dialog_start: String = "start"

@onready var dialog = $Dialogs
@onready var anim = $AnimationPlayer

var entered = false

func action():
	entered = true
	dialog.play()
	anim.play("fade-in")
	pass
#	DialogueManager.show_example_dialogue_balloon(dialouge_resource, dialog_start)

func _on_area_entered(area):
	if area.get_groups().has("player"):
		if entered:
			anim.play("fade-in")
		else:
			entered = true
			dialog.play()
			anim.play("fade-in")
		pass
	pass # Replace with function body.


func _on_area_exited(area):
	if area.get_groups().has("player") and entered:
		anim.play_backwards("fade-in")
		pass
	pass # Replace with function body.
