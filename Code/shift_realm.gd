extends Node 
@onready var player = $CharacterBody2D
var shift: bool = true
signal realm_shifted

func _ready():
	set_character_position()
	set_checkpoint_position(player.global_position)
	pass

func set_character_position() -> void:
	if Global.checkpoint: player.global_position = Global.checkpoint
	pass

func set_checkpoint_position(pos: Vector2) -> void:
	Global.checkpoint = pos
	pass

func set_toggle():
	shift = !shift
	realm_shifted.emit()

#pause
func _unhandled_input(event: InputEvent):
	if event.is_action_pressed("ui_cancel"):
		$pause_menu.pause()




