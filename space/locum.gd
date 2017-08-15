extends Node2D

onready var tween = get_node("Tween")

func _ready():
	pass
	
func glideToPos(target):
	var start = get_global_pos()
	var vec = target - start
	var dist = vec.length()
	if dist < 220:
		tween.interpolate_property(self, "transform/pos", start, target, 1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
		tween.start()
	