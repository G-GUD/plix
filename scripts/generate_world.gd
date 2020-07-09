extends Node

const samedata = {
	"siblings":{
		"revy":{
			
		},
		"elayna":{
			
		}
	},
	"parents":{
		"mom":{
			
		},
		"dad":{
			
		}
	},
	"aunts and uncles":{
		"uncle michael":{
			
		},
		"uncle steve":{
			
		}
	},
	"elders":{
		"gramma pauline":{
			
		},
		"great gramma rose":{
			
		}
	}
}

func generate(worlddata):
	var ringData = []
	
	for w in worlddata:
		ringData.push_back(generateLayer(ringData, worlddata[w]))

func generateLayer(ringData, layerdata):
	if ringData.size() == 0 :
		generateCore(layerdata[0])
	var n = layerdata.size() * 2
	var theta = 360 / n
	

func generateCore(firstRing):
	pass


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func wedgeArea(theta, rin, rout):
	return theta * rout * rout - theta * rin * rin
