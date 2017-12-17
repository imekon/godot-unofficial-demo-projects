extends Node2D

onready var asteroidFactory = load("res://scenes/asteroidFactory.tscn").instance()

func _ready():
	randomize()
	
	var asteroid = asteroidFactory.getAsteroid(0)
	asteroid.set_pos(Vector2(100, 100))
	add_child(asteroid)
	
	asteroid = asteroidFactory.getAsteroid(1)
	asteroid.set_pos(Vector2(800, 100))
	add_child(asteroid)

	asteroid = asteroidFactory.getAsteroid(2)
	asteroid.set_pos(Vector2(800, 500))
	add_child(asteroid)

	asteroid = asteroidFactory.getAsteroid(3)
	asteroid.set_pos(Vector2(100, 500))
	add_child(asteroid)