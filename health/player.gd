extends KinematicBody2D

const WALK_SPEED = 200

var velocity = Vector2()

export var health = 100

func _fixed_process(delta):
	if (Input.is_action_pressed("ui_left")):
		velocity.x = -WALK_SPEED
	elif (Input.is_action_pressed("ui_right")):
		velocity.x = WALK_SPEED
	elif (Input.is_action_pressed("ui_up")):
		velocity.y = -WALK_SPEED
	elif (Input.is_action_pressed("ui_down")):
		velocity.y = WALK_SPEED
	else:
		velocity.x = 0
		velocity.y = 0
		
	var motion = velocity * delta
	motion = move(motion)
	
	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		move(motion)
		
func _ready():
	set_fixed_process(true)
