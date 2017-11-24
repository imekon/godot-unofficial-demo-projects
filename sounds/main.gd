extends PanelContainer

onready var samplePlayer = get_node("SamplePlayer")
onready var thrustTween = get_node("ThrustTween")

var engine
var blackHole

func _ready():
	thrustTween.interpolate_method(self, "setEnginedB", 0.0, -60.0, 5.0, Tween.TRANS_QUAD, Tween.EASE_OUT)

func _onThrust():
	engine = samplePlayer.play("engine")
	thrustTween.reset(self, "setEnginedB")

func _onBlackHole():
	blackHole = samplePlayer.play("artic drone")

func _onStopThrust():
	thrustTween.start()

func _onStopBlackHole():
	samplePlayer.stop(blackHole)

func setEnginedB(db):
	samplePlayer.set_volume_db(db)

func _onThrustTweenComplete( object, key ):
	samplePlayer.stop(engine)
