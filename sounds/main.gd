extends PanelContainer

onready var samplePlayer = get_node("SamplePlayer")

var engine
var blackHole

func _ready():
	pass

func _onThrust():
	engine = samplePlayer.play("engine")

func _onBlackHole():
	blackHole = samplePlayer.play("artic drone")

func _onStopThrust():
	samplePlayer.stop(engine)

func _onStopBlackHole():
	samplePlayer.stop(blackHole)
