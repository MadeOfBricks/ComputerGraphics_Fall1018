extends KinematicBody


onready var camera = get_node("RotationHelper/Camera")

const GRAV_ACCEL = -.8
const MAX_SLOPE_ANGLE = 40
const MAX_SPEED = 20
const ACCEL= 4.5
const DEACCEL= 16

var vel = Vector3(0,0,0)

var dir = Vector3(0,0,0)

func _ready():
	translation.y = -1
	set_process(true)


func _process(delta):
	process_input(delta)
	process_movement(delta)

func process_input(delta):
	
	dir = Vector3()
	var camTransform = camera.get_global_transform()
	var inputMovVec = Vector2(0,0)
	
	if Input.is_action_pressed('forward'):
		inputMovVec.y += 1
		print('doop')
	if Input.is_action_pressed('back'):
		inputMovVec.y -= 1
	if Input.is_action_pressed('left'):
		inputMovVec.x -= 1
	if Input.is_action_pressed('right'):
		inputMovVec.x += 1
	
	inputMovVec = inputMovVec.normalized()
	
	dir += -camTransform.basis.z.normalized() * inputMovVec.y
	dir += camTransform.basis.x.normalized() * inputMovVec.x
	
	
	

func process_movement(delta):
	dir.y = 0
	dir = dir.normalized()
	
	vel.y += delta * GRAV_ACCEL
	
	var hvel = vel
	hvel.y = 0

	var target = dir
	target *= MAX_SPEED
	
	var accel
	if dir.dot(hvel) > 0:
		accel = ACCEL
	else:
		accel = DEACCEL
	
	hvel = hvel.linear_interpolate(target, accel*delta)
	vel.x = hvel.x
	vel.z = hvel.z
	
	
	vel = move_and_slide(vel,Vector3(0,1,0), 0.05, 4, deg2rad(MAX_SLOPE_ANGLE))
	
	
	
	
	
	
	