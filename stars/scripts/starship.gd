extends RigidBody2D

const ROTATE_SPEED = 3
const ACCELERATION = 5

func _ready():
	set_fixed_process(true)

func rotate_ship(direction):
	set_angular_velocity(direction * ROTATE_SPEED)

func _fixed_process(delta):
	if Input.is_action_pressed("ui_left"):
		rotate_ship(-1)
	elif Input.is_action_pressed("ui_right"):
		rotate_ship(1)
	else:
		rotate_ship(0)

	if Input.is_action_pressed("ui_up"):
		apply_impulse(Vector2(), Vector2(0, -ACCELERATION).rotated(get_rot()))