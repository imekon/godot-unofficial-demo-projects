extends StaticBody2D

export (int) var score = 20

func _ready():
	# Ensure this is in group 'brick' so we can detect it when the ball
	# collides with it
	add_to_group("brick")
	
func getScore():
	# Get the overridden score
	return score
