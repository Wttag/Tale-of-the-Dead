extends Area2D

@export var rotating = false
@onready var anim = $AnimationPlayer


func _ready():
	if rotating:
		anim.play("swing")
	pass
	
func _on_body_entered(body):
	if body.get_groups().has("player"):
		get_tree().change_scene_to_file("res://Level/tutorial.tscn")
		$Sound_Death.play()
