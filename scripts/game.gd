extends "res://scripts/gameData.gd"


# Declare member variables here. Examples:
var world_info
var player_info
var server = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func buildWorld(world_info):
	spawnEntities(world_info.spawnlist)
	pass
	
func spawnEntities(spawnlist):	
	for e in spawnlist:
		var entity = entities[spawnlist[e].type].instance()	
		entity.set_name(e)
		entity.init(spawnlist[e])
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
