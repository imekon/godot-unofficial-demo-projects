extends KinematicBody2D

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	# Get the x position of the mouse
	var x = get_viewport().get_mouse_pos().x
	
	# Get the current y position to keep bat at same vertical level
	var y = get_pos().y
	
	# Set the bat position
	# If you use move, I found the ball can actually 'push' the bat
	# out the way!
	set_pos(Vector2(x, y))
