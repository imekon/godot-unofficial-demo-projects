extends PanelContainer

func _ready():
	pass

func on_male():
	Globals.set("PLAYER_CHARACTER", "male")
	get_node("/root/globals").setScene("res://main.tscn")

func on_female():
	Globals.set("PLAYER_CHARACTER", "female")
	get_node("/root/globals").setScene("res://main.tscn")
	