extends Node2D

func _ready():
	set_process(true)
	
func _process(delta):
	var score = get_node("/root/globals").getScore()
	get_node("scoring/ScoreLabel").set_text("Score: " + str(score))
	
	var lives = get_node("/root/globals").getLives()
	get_node("scoring/LivesLabel").set_text("Lives: " + str(lives))
