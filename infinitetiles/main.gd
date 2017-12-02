extends Node2D

onready var player = get_node("player")
onready var tiling = get_node("tiling")
onready var posLabel = get_node("HUD/PosLabel")

func _ready():
	set_process(true)
	
func _process(delta):
	var pos = player.get_pos()
	posLabel.set_text("Player: " + str(pos.x) + ", " + str(pos.y))
	tiling.setLocation(pos.x, pos.y)