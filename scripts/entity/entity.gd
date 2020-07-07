extends Spatial


# Declare member variables here. Examples:
const trees = []

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func init(data):
	if (!get_tree().get_root().server):
		if(data.style == null || trees[data.style] == null):
			preload(("res://scenes/client/tree_oak.tscn")).instance()
		else:
			pass			
	pass
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
