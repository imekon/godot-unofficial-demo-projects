extends Node2D

func _ready():
	var locum = get_node("locum")
	get_node("/root/globals").setLocum(locum)
	var stats = get_node("HUDlayer/stats")
	get_node("/root/globals").setStats(stats)