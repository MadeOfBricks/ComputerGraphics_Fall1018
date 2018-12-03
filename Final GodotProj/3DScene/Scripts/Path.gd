extends Path

onready var root = get_parent().get_parent()

const X_RANGE = 50
const BUSH_RANGE = 30
const POST_COUNT = 100

var postAndBench = preload("res://PostAndBench.tscn")
var bush = preload("res://Bush.tscn")
var lastPostAndBenchX = 0

func _ready():
	randomize()
	var X = 0;
	var Z = 0;
	for i in range(POST_COUNT):
		X = rand_range(-1 * X_RANGE,X_RANGE)
		Z += 100
		curve.add_point(Vector3(X,0,Z))
		var thisInst = postAndBench.instance()
		thisInst.translation = Vector3(X,0,Z)
		
		if thisInst.translation.x > translation.x:
			thisInst.rotate_y(rad2deg(90))
		
		
		add_child(thisInst)
		root.postPoints.append(thisInst.translation)
		print(String(i+1) + " " + String(thisInst.translation))
		lastPostAndBenchX = X
		
		
		for x in range(i + 1):
			var bushInst = bush.instance()
			var bX = X + rand_range(-1 * BUSH_RANGE,BUSH_RANGE)
			var bZ = Z + rand_range(-1 * BUSH_RANGE,BUSH_RANGE)
			bushInst.translation = Vector3(bX,0,bZ)
			bushInst.rotate_y(rad2deg(rand_range(0,359)))
			add_child(bushInst)
		#print(String(i) + " bushes created")
			
		
