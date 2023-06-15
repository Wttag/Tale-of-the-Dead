extends Node2D
@onready var dark = $Dark
@onready var light = $Light

func set_shift(condition):
	dark.visible = condition
	light.visible = !condition
