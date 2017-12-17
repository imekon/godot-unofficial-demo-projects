extends Node2D

const ACCELERATION = 50

func _ready():
	pass

func getAsteroid(index):
	var asteroid = get_child(index).duplicate()
	var angle = randf() * 360.0
	asteroid.apply_impulse(Vector2(), Vector2(0, -ACCELERATION).rotated(deg2rad(angle)))
	return asteroid