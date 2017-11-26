extends PanelContainer

onready var tweenOut = get_node("TweenOut")
onready var tweenIn = get_node("TweenIn")
onready var label = get_node("Panel/Label")

func _ready():
	tweenOut.interpolate_property(label, "visibility/opacity", 1.0, 0.0, 3.0, Tween.TRANS_QUAD, Tween.EASE_OUT)
	tweenIn.interpolate_property(label, "visibility/opacity", 0.0, 1.0, 3.0, Tween.TRANS_QUAD, Tween.EASE_IN)

func _onFadeOut():
	tweenOut.reset(label, "visibility/opacity")
	tweenOut.start()

func _onFadeIn():
	tweenIn.reset(label, "visibility/opacity")
	tweenIn.start()
