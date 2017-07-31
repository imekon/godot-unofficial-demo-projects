extends Node2D

func _ready():
	set_process(true)
		
func _draw():
	# We need the health of the player
	# So... "/root" is the 'root' of the scene,
	# 'main' is my name for the main node, and player
	# gets us the player node. So from here, we can get the
	# exported variable health.
	var health = get_node("/root/main/player").health
	var rect = Rect2(0, 0, health, 12)
	var color = Color(0, 0, 1, 0.7)
	draw_rect(rect, color)
	
func _process(delta):
	update()