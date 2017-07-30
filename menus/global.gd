extends Node

var currentScene = null

func _ready():
	currentScene = get_tree().get_root().get_child(get_tree().get_root().get_child_count() - 1)
	Globals.set("PLAYER_CHARACTER", "male")
	
func setScene(scene):
	currentScene.queue_free()
	var sceneResource = ResourceLoader.load(scene)
	currentScene = sceneResource.instance()
	get_tree().get_root().add_child(currentScene)
	