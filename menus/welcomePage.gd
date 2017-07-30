extends PanelContainer

export (NodePath) var startButtonPath
export (NodePath) var creditsButtonPath
onready var startButton = get_node(startButtonPath)
onready var creditsButton = get_node(creditsButtonPath)

func _ready():
	pass

func on_start():
	get_node("/root/globals").setScene("res://characterPage.tscn")

func on_credits():
	get_node("/root/globals").setScene("res://creditPage.tscn")
