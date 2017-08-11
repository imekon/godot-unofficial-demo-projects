extends KinematicBody2D

const WALK_SPEED = 400

var velocity = Vector2()

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	if Input.is_action_pressed("ui_left"):
		velocity.x = -WALK_SPEED
	elif Input.is_action_pressed("ui_right"):
		velocity.x = WALK_SPEED
	else:
		velocity.x = 0
		
	var motion = velocity * delta
	move(motion)
