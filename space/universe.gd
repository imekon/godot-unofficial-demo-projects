extends Node2D

func _ready():
	var locum = get_node("locum")
	get_node("/root/globals").setLocum(locum)
