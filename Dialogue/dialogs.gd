extends Node2D

@onready var dark = $Black
@onready var light = $White

func set_shift(condition):
	dark.visible = condition
	light.visible = !condition
