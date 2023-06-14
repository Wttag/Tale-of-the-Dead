extends Area2D

@export var rotating = false
@onready var anim = $AnimationPlayer
@onready var dark = $Dark
@onready var light = $Light

func _ready():
	if rotating:
		anim.play("swing")
	pass

func set_shift(condition):
	light.visible = !condition
	dark.visible = condition
	pass

func _on_body_entered(body):
	if body.get_groups().has("player"):
		get_tree().change_scene_to_file("res://Level/tutorial.tscn")
		$Sound_Death.play()
