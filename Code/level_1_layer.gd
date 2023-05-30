extends "res://Code/realm_script.gd"


# Called when the node enters the scene tree for the first time.
func _ready():
	layer_definitions = [RealmDefinition.new(false,true),RealmDefinition.new(true,false),RealmDefinition.new(true,true),RealmDefinition.new(false,true),RealmDefinition.new(true,false)]; 	
	super._ready()


