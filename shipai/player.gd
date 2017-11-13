extends RigidBody2D

const ROTATE_SPEED = 250
const ACCELERATION = 5
const BULLET_ACCELERATION = 400

var lastFired = 0

onready var firingPosition = get_node("FiringPos")

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if (Input.is_action_pressed("ui_spin_left")):
		rotate(deg2rad(delta * ROTATE_SPEED))
		
	if (Input.is_action_pressed("ui_spin_right")):
	 	rotate(-deg2rad(delta * ROTATE_SPEED))
	
	if (Input.is_action_pressed("ui_thrust")):
		apply_impulse(Vector2(), Vector2(0, -ACCELERATION).rotated(get_rot()))
		
	if (Input.is_action_pressed("ui_firing")):
		createFiring()

func createFiring():
	var now = OS.get_ticks_msec()
	if (now - lastFired) > 100:
		lastFired = OS.get_ticks_msec()
		var pos = firingPosition.get_global_pos()
		var bulletResource = load("res://bullet.tscn")
		var bullet = bulletResource.instance()
		bullet.set_pos(pos)
		bullet.apply_impulse(Vector2(), Vector2(0, -BULLET_ACCELERATION).rotated(get_rot()))
		get_parent().add_child(bullet)

	