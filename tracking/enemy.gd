extends KinematicBody2D

const WALK_SPEED = 200

var velocity = Vector2()

func _ready():
	set_fixed_process(true)
	velocity = Vector2(0.1 * WALK_SPEED, 0.9 * WALK_SPEED)

func _fixed_process(delta):
	var motion = velocity * delta
	motion = move(motion)
	
	if (is_colliding()):
		var n = get_collision_normal()
		motion = n.slide(motion)
		velocity = n.slide(velocity)
		move(motion)
