extends Node 
@onready var player = $CharacterBody2D
@onready var camera = $Camera2D
@onready var lightmode = $"Light Mode"
@onready var darkmode = $DarkMode
@onready var pause_menu = $"CanvasLayer/Options Menu"


var shift: bool = true
signal realm_shifted

#music
@onready var light_music = $Music_Light
@onready var dark_music = $Music_Dark
var light_music_position = null
var dark_music_position = null

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
	cross_fade_music(shift)
	for axe in get_tree().get_nodes_in_group("axe"):
		axe.set_shift(shift)
	for tree in get_tree().get_nodes_in_group("tree"):
		tree.set_shift(shift)

func cross_fade_music(condition):
	if condition:
		#dark
		light_music_position = light_music.get_playback_position()
		light_music.get_node("AnimationPlayer").play("fade-out")
		
		if dark_music_position: dark_music.play(dark_music_position)
		else: dark_music.play()
		dark_music.get_node("AnimationPlayer").play("fade-in")
		pass
	else:
		dark_music_position = dark_music.get_playback_position()
		dark_music.get_node("AnimationPlayer").play("fade-out")
		
		if light_music_position: 
			light_music.play(light_music_position)
		else: light_music.play()
		
		light_music.get_node("AnimationPlayer").play("fade-in")
		#light play
		pass
	pass



