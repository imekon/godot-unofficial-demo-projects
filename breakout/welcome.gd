extends PanelContainer

func _ready():
	pass

func onStart():
	randomize()
	get_tree().change_scene("res://level01.tscn")
