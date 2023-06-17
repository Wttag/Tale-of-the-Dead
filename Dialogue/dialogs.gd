extends Node2D

@onready var dark = $Black
@onready var light = $White
@onready var anim = $AnimationPlayer
@onready var dark_label = $Black/Text/Label
@onready var light_label = $White/Text/Label

var dark_index = 0
var light_index = 0


var dark_dialog = [
	"Ahh, another one",
	"Spare me with the questioning",
	"You are now dead and locked up here for eternity, that's it.",
	"Now move along, I have better things to do!",
]

var dark_died_dialog = [
	"Haha! You just died and the first thing you do is die again?",
	"The dead can’t die twice, you fool.",
	"No use trying a weak soul like you could never get out!",
]

var light_dialog = [
	"Ah, yeah you must be new here! ",
	"Well, you are dead now I’m afraid so. Do not be scared we all are, this is the Land of the Dead after all",
	"You are safe here but be careful this place is dangerous for such a small soul like you!",
]

var light_died_dialog = [
	"Haha! I see you have not listened.",
	"No worries, you will be back at the gates every time you fail...",
	"The gates are what bind the lost souls to this place, so they shall never leave.",
	"Many tried but aloof them have failed."
]

func _ready():
	if Global.has_died:
		dark_index = 0
		light_index = 0
		pass

func play():
	if Global.has_died:
		if dark.visible:
			dark_label.text = str(dark_died_dialog[dark_index])
			if dark_index < dark_died_dialog.size() - 1:
				dark_index += 1
		else:
			light_label.text = str(light_died_dialog[light_index])
			if light_index < light_died_dialog.size() - 1:
				light_index += 1
	else:
		if dark.visible:
			dark_label.text = str(dark_dialog[dark_index])
			if dark_index < dark_dialog.size() - 1:
				dark_index += 1
		else:
			light_label.text = str(light_dialog[light_index])
			if light_index < light_dialog.size() - 1:
				light_index += 1
				
	anim.play("speak")
	pass

func set_shift(condition):
	dark.visible = condition
	light.visible = !condition
#	play()
