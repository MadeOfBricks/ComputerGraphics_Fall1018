extends Spatial

const RANGE = 500
const POST = preload("res://LampPost.tscn")
var pos = Vector2(0,0)


var posts = []

func _ready():
	randomize()
	var randX = rand_range(RANGE * -1, RANGE) 
	var randZ = rand_range(RANGE * -1, RANGE)
	var randRot = rand_range(0,359)
	for i in range(10):
		var thisPost = POST.instance()
		thisPost.translation = Vector3(randX,0,randZ)
		thisPost.rotation = Vector3(0,randRot,0)
		add_child(thisPost)
		randX = rand_range(RANGE * -1, RANGE) 
		randZ = rand_range(RANGE * -1, RANGE)
		randRot = rand_range(0,359)
		
		#if i < 13:
		#	thisPost.get_node("LampPost/OmniLight").visible = false
		

