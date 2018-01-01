extends RigidBody2D

func _ready():
	pass

func _on_RocketExitScreen():
	queue_free()
