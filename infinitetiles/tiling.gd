extends Node2D

var seamless = load("res://seamless.png")

var x = 0
var y = 0
var w = 0
var h = 0
var w2 = 0
var h2 = 0

func _ready():
	w = seamless.get_width()
	h = seamless.get_height()
	w2 = w / 2
	h2 = h / 2
	set_process(true)
	
func _process(delta):
	update()
	
func _draw():
	draw_texture(seamless, Vector2(x, y))
	
	draw_texture(seamless, Vector2(x + w, y))
	draw_texture(seamless, Vector2(x,     y + h))
	draw_texture(seamless, Vector2(x + w, y + h))
	draw_texture(seamless, Vector2(x + w, y - h))

	draw_texture(seamless, Vector2(x - w, y))
	draw_texture(seamless, Vector2(x,     y - h))
	draw_texture(seamless, Vector2(x - w, y - h))
	draw_texture(seamless, Vector2(x - w, y + h))
	
func setLocation(playerX, playerY):
	x = int((playerX - w2) / w) * w
	y = int((playerY - h2) / h) * h
