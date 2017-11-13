extends RigidBody2D

var startTime = 0
var timeNow = 0

func _ready():
	startTime = OS.get_unix_time()
	set_process(true)
	set_fixed_process(true)

func _process(delta):
	timeNow = OS.get_unix_time()
	var elapsed = timeNow - startTime
	if (elapsed > 1):
		queue_free()

func _fixed_process(delta):
	var bodies = get_colliding_bodies()
	for body in bodies:
		if body.is_in_group("rocks"):
			body.queue_free()
			queue_free()
			
		if body.is_in_group("aliens"):
			body.queue_free()
			queue_free()
			