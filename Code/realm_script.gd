extends TileMap

class_name InterdimensionalTileMap
var color: Color = Color.BLACK
var layer_definitions = [RealmDefinition.new(),RealmDefinition.new()]


func _ready():
	
	var level = get_node("/root/Tutorial")
	
	level.realm_shifted.connect(_on_toggle_changed)
	_on_toggle_changed()
	

func _on_toggle_changed():

	var global_toggle = get_node("/root/Tutorial").shift
	

	for i in get_layers_count():
	
		var modulate_color = get_layer_modulate(i)
		print('layer',i)
		var existsInTheLight = layer_definitions[i].existsInTheLight
		var existsInTheDark = layer_definitions[i].existsInTheDark
		
  
		if global_toggle:
			set_layer_enabled(i,existsInTheLight)	
			#modulate_color = Color.GHOST_WHITE
			
		else:
			set_layer_enabled(i,existsInTheDark)
			#modulate_color = color
			
		
		set_layer_modulate(i, modulate_color)
		
class RealmDefinition:
	var existsInTheDark: bool
	var existsInTheLight: bool
	func _init(dark = true,light = true):
		existsInTheDark = dark
		existsInTheLight = light
		
		
