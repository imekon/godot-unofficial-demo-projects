extends PanelContainer

export (NodePath) var okButtonPath
onready var okButton = get_node(okButtonPath)

func _ready():
	pass

func onOK():
	get_node("/root/globals").setScene("res://welcomePage.tscn")
