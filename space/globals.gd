extends Node

var locum

func _ready():
	pass
	
func setLocum(value):
	locum = value

func setLocumPosition(pos):
	if locum != null:
		locum.glideToPos(pos)