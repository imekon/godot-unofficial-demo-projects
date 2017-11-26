extends PanelContainer

onready var tweenOut = get_node("TweenOut")
onready var tweenIn = get_node("TweenIn")
onready var label = get_node("Panel/Label")

func _ready():
	pass

func _onFadeOut():
	tweenOut.interpolate_property(label, "visibility/opacity", 1.0, 0.0, 3.0, Tween.TRANS_QUAD, Tween.EASE_OUT)
	tweenOut.start()

func _onFadeIn():
	tweenIn.interpolate_property(label, "visibility/opacity", 0.0, 1.0, 3.0, Tween.TRANS_QUAD, Tween.EASE_IN)
	tweenIn.start()
