extends Node

onready var _rock = load("res://rock.tscn")
onready var _alien = load("res://alien.tscn")
onready var _powerup = load("res://powerup.tscn")
onready var player = get_node("player")

func _ready():
	createRocks()
	createAliens()
	createPowerups()
	set_process(true)

func getRandom(value):
	return randi() % value - value / 2
	
func createRocks():
	var a = 0
	var x = 0.0
	var y = 0.0
	
	for i in range(10):
		a = 36 * i
		x = sin(deg2rad(a)) * 600.0
		y = cos(deg2rad(a)) * 600.0
		createRock(x, y, 200)
		
func createAliens():
	var a = 0
	var x = 0.0
	var y = 0.0

	for i in range(10):
		a = 36 * i
		x = sin(deg2rad(a)) * 1200.0
		y = cos(deg2rad(a)) * 1200.0
		createAlien(x, y, 300)

func createPowerups():
	var a = 0
	var x = 0.0
	var y = 0.0

	for i in range(4):
		a = 90 * i
		x = sin(deg2rad(a)) * 1800.0
		y = cos(deg2rad(a)) * 1800.0
		createPowerup(x, y, 300)
	
func createRock(x, y, value):
	var rock = _rock.instance()
	rock.set_pos(Vector2(x + getRandom(value), y + getRandom(value)))
	add_child(rock)
	
func createAlien(x, y, value):
	var alien = _alien.instance()
	alien.set_pos(Vector2(x + getRandom(value), y + getRandom(value)))
	add_child(alien)
	
func createPowerup(x, y, value):
	var powerup = _powerup.instance()
	powerup.set_pos(Vector2(x + getRandom(value), y + getRandom(value)))
	add_child(powerup)
	
func _process(delta):
	var playerPos = player.get_pos()
	var aliens = get_tree().get_nodes_in_group("aliens")
	for alien in aliens:
		var pos = alien.get_pos()
		var dist = playerPos.distance_to(pos)
		if (dist > 300 && dist < 500):
			var vec = playerPos - pos
			alien.apply_impulse(Vector2(), vec * 0.004) 