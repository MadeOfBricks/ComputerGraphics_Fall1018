extends Path

const X_RANGE = 50


func _ready():
	randomize()
	var X = 0;
	var Z = 0;
	for i in range(10):
		X = rand_range(-1 * X_RANGE,X_RANGE)
		Z += 100
		curve.add_point(Vector3(X,0,Z))
	
		print("Point at" + String(curve.get_baked_points()))