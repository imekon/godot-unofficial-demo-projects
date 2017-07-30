extends KinematicBody2D

const WALK_SPEED = 200

var velocity = Vector2()

func _ready():
	set_fixed_process(true)
	compute_direction()

func _fixed_process(delta):
	var motion = velocity * delta
	motion = move(motion)
	
	if (is_colliding()):
		#var n = get_collision_normal()
		#motion = n.slide(motion)
		#velocity = n.slide(velocity)
		#move(motion)
		compute_direction()

func compute_direction():
	var x = 0.5 - randf()
	var y = 0.5 - randf()
	velocity = Vector2(x * WALK_SPEED, y * WALK_SPEED)