extends Node

var postPoints = []
var player
var printed = false

const MAX_DIST = 100

func _ready():
	player = get_node("PlayerBody")
	postPoints.append(get_node("OriginalLampPost").translation)
	print("0 " + String(postPoints[0]))

func _process(delta):
	player_pos_reset()

func player_pos_reset():
	var closeEnough = false
	for post in postPoints:
		var postDist = player.translation.distance_to(post)
		if postDist < MAX_DIST:
			closeEnough = true
	
	if !closeEnough:
			player.translation = Vector3(85,0,0-15)
