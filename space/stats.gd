extends PanelContainer

onready var energySprite = get_node("Panel/Energy/Sprite")
onready var shieldsSprite = get_node("Panel/Shields/Sprite")
onready var lasersSprite = get_node("Panel/Lasers/Sprite")

func _ready():
	pass

func setEnergy(value):
	var scaling = value / 100.0
	energySprite.set_scale(Vector2(scaling, 1))
	
func setShields(value):
	var scaling = value / 100.0
	shieldsSprite.set_scale(Vector2(scaling, 1))

func setLasers(value):
	var scaling = value / 100.0
	lasersSprite.set_scale(Vector2(scaling, 1))
