extends Node


# Declare member variables here. Examples:
var entities = {}
var graphics = {}


func register_entity(entity, path):
	entities[entity] = load(path)
	
func register_graphic(entity, path):
	graphics[entity] = load(path)
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
