extends Node

var locum
var stats

var energy = 100
var shields = 100
var lasers = 100

func _ready():
	pass
	
func setLocum(value):
	locum = value
	
func setStats(value):
	stats = value

func setLocumPosition(pos):
	if locum != null:
		locum.glideToPos(pos)
		
func getEnergy():
	return energy
	
func getShields():
	return shields
	
func getLasers():
	return lasers
		
func setEnergy(value):
	energy = value
	stats.setEnergy(value)
	
func setShields(value):
	shields = value
	stats.setShields(value)
	
func setLasers(value):
	lasers = value
	stats.setLasers(value)