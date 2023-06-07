extends Area2D

@export var dialouge_resource: DialogueResource
@export var dialog_start: String = "start"

func action():
	DialogueManager.show_example_dialogue_balloon(dialouge_resource, dialog_start)
