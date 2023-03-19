extends "res://Code/realm_script.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	layer_definitions = [RealmDefinition.new(true,true),RealmDefinition.new(false,true),RealmDefinition.new(true,false)]; 	
	super._ready()



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
