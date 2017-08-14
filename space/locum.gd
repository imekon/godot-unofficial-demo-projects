extends Node2D

func _ready():
	pass
	
func glideToPos(target):
	var pos = get_global_pos()
	var vec = target - pos
	var dist = vec.length()
	if dist < 220:
		set_global_pos(target)
	