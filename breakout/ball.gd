extends RigidBody2D

var v

func _ready():
	var n = randf() * PI / 2
	v = Vector2(sin(n), -cos(n))
	var ball = get_node(".")
	ball.set_linear_velocity(v * 200)
