extends "res://scripts/game.gd"


# Declare member variables here. Examples:
func 

# Called when the node enters the scene tree for the first time.
func _ready():
	server = false
	
	get_tree().connect("network_peer_connected", self, "_player_connected")
	get_tree().connect("network_peer_disconnected", self, "_player_disconnected")
	get_tree().connect("connected_to_server", self, "_connected_ok")
	get_tree().connect("connection_failed", self, "_connected_fail")
	get_tree().connect("server_disconnected", self, "_server_disconnected")
	
	var peer = NetworkedMultiplayerENet.new()
	peer.create_client("127.0.0.1", 8081)
	get_tree().network_peer = peer

remote func pre_configure_game(player_info):
	var selfPeerID = get_tree().get_network_unique_id()

	# Load world
	var world = load("res://scenes/game.tscn").instance()
	get_node("/root").add_child(world)

	# Load my player
	var my_player = preload("res://scenes/player.tscn").instance()
	my_player.set_name(str(selfPeerID))
	my_player.set_network_master(selfPeerID) # Will be explained later
	get_node("/root/world/players").add_child(my_player)

	# Load other players
	for p in player_info:
		var player = preload("res://scenes/player.tscn").instance()
		player.set_name(str(p))
		player.set_network_master(p) # Will be explained later
		get_node("/root/world/players").add_child(player)

	# Tell server (remember, server is always ID=1) that this peer is done pre-configuring.
	rpc_id(1, "done_preconfiguring", selfPeerID)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

