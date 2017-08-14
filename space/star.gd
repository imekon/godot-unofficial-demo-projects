extends Area2D

func _ready():
	set_process_input(true)
	
func _input_event(viewport, event, shape_idx):
	if event.type == InputEvent.MOUSE_BUTTON \
	and event.button_index == BUTTON_LEFT \
	and event.pressed:
		var pos = get_global_pos()
		get_node("/root/globals").setLocumPosition(pos)