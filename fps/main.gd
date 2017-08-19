extends Spatial

onready var fpsLabel = get_node("CanvasLayer/FPS")

func _ready():
	set_fixed_process(true)
	
func _fixed_process(delta):
	fpsLabel.set_text("FPS: " + str(OS.get_frames_per_second()))
	