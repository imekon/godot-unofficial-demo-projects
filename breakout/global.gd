extends Node

var lives = 5
var score = 0
var level = 1

func _ready():
	pass
	
func getLives():
	return lives
	
func decLives():
	lives -= 1
	
func getScore():
	return score
	
func addScore(value):
	score += value
	
func changeLevel(value):
	level += value
	var scene = "res://level%02d.tscn" % level
	get_tree().change_scene(scene)