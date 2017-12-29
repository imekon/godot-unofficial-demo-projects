extends Node2D

const NUMBER_STARS = 200

var stars = Array()
var sizeStarField

func _ready():
	set_process(true)
	sizeStarField = get_viewport_rect().size
	generateStars(NUMBER_STARS)
	
func _process(delta):
	update()

func generateStars(number):
	for i in range(1, number):
		var item = { x = 0, y = 0, size = 1, colour = null }

		item.x = randf() * sizeStarField.width
		item.y = randf() * sizeStarField.height
		
		var t = randf() * 100
		if t < 80:
			item.colour = Color(1.0, 1.0, 1.0)
		elif t < 90:
			item.colour = Color(1.0, 0.0, 0.0)
		else:
			item.colour = Color(0.0, 0.0, 1.0)
			
		item.size = randf() * 1.5
		
		stars.append(item)
	
func _draw():
	for item in stars:
		var rect = Rect2(item.x - item.size, item.y - item.size, item.size * 2, item.size * 2)
		draw_rect(rect, item.colour)