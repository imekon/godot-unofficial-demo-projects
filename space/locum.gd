extends Node2D

var globals

onready var tween = get_node("Tween")

func _ready():
	globals = get_node("/root/globals")
	
func glideToPos(target):
	var start = get_global_pos()
	var vec = target - start
	var dist = vec.length()
	var energyUsage = dist / 20
	var energy = globals.getEnergy()
	if energy - energyUsage > 0:
		if dist < 220:
			energy = energy - energyUsage
			globals.setEnergy(energy)
			tween.interpolate_property(self, "transform/pos", start, target, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
			tween.start()
	