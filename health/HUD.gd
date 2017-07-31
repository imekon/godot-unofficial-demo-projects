extends Node2D

const FACE_WIDTH = 200
const FACE_HEIGHT = 80

func _ready():
	set_process(true)

func _draw():
	# We need the health of the player
	# So... "/root" is the 'root' of the scene,
	# 'main' is my name for the main node, and player
	# gets us the player node. So from here, we can get the
	# exported variable health.
	var player = get_node("/root/main/player")
	
	# Health bar
	var health = player.health
	var rect = Rect2(0, 0, health, 12)
	var color = Color(1, 0.3, 0.3, 0.7)
	draw_rect(rect, color)
	
	# Oxygen bar
	var oxygen = player.oxygen
	rect = Rect2(0, 20, oxygen, 12)
	color = Color(0.3, 0.3, 1, 0.7)
	draw_rect(rect, color)
	
	# Face
	rect = Rect2(512 - FACE_WIDTH / 2, 500, FACE_WIDTH, FACE_HEIGHT)
	color = Color(80, 80, 80, 0.7)
	draw_rect(rect, color)

func _process(delta):
	update()
