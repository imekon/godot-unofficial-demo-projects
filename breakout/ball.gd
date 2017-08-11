extends RigidBody2D

var ball

func _ready():
	var n = randf() * PI / 2
	ball = get_node(".")
	compute_velocity()
	set_fixed_process(true)

func compute_velocity():
	var n = randf() * PI / 2
	var velocity = Vector2(sin(n), -cos(n))
	ball.set_linear_velocity(velocity * 200)
		
func _fixed_process(delta):
	var pos = ball.get_pos()
	if pos.y > 650:
		ball.set_pos(Vector2(512, 400))
		compute_velocity()

