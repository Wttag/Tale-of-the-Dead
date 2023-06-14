extends Node 
@onready var player = $CharacterBody2D
@onready var camera = $Camera2D
@onready var lightmode = $"Light Mode"
@onready var darkmode = $DarkMode
@onready var pause_menu = $"CanvasLayer/Options Menu"


var shift: bool = true
signal realm_shifted

func _ready():
	camera.position_smoothing_enabled = false
	set_character_position()
	set_checkpoint_position(player.global_position)
	await get_tree().create_timer(1).timeout
	camera.position_smoothing_enabled = true
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
	lightmode.visible = !shift
	darkmode.visible = shift
	player.set_shift(shift)
	
	for axe in get_tree().get_nodes_in_group("axe"):
		axe.set_shift(shift)
	




