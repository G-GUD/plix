extends "res://scripts/game.gd"


# Declare member variables here. Examples:

# Called when the node enters the scene tree for the first time.
func _ready():
	server = true
	
	var peer = NetworkedMultiplayerENet.new()
	
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	
	peer.create_server(8081, 32)
	get_tree().network_peer = peer


func _player_connected(id, client_info):
	# Called on both clients and server when a peer connects. Send my info to it.
	player_info[id] = client_info
	rpc_id(id, "buildWorld", world_info)

func _player_disconnected(id):
	player_info.erase(id) # Erase player from info.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
