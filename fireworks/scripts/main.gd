extends Node2D

onready var explosion1 = get_node("explosion1")
onready var explosion2 = get_node("explosion2")
onready var explosion3 = get_node("explosion3")

onready var _rocket = load("res://scenes/rocket.tscn")
onready var _credits = load("res://scenes/credits.tscn")

onready var label = get_node("Label")

var chorus = [
		"For auld lang syne, my dear,",
		"For auld lang syne.",
		"We'll tak a cup o' kindness yet,",
		"For auld lang syne."
	]
	
var verses = [
		[
			"Should auld acquaintance be forgot,",
			"And never brought to mind?",
			"Should auld acquaintance be forgot,",
			"And auld lang syne!"
		],
		[
			"And surely ye'll be your pint stowp!",
			"And surely I'll be mine!",
			"And we'll tak a cup o'kindness yet,",
			"For auld lang syne."
		],
		[
			"We twa hae run about the braes,",
			"And pou'd the gowans fine;",
			"But we've wander'd mony a weary fit,",
			"Sin' auld lang syne."
		],
		[
			"We twa hae paidl'd in the burn,",
			"Frae morning sun till dine;",
			"But seas between us braid hae roar'd",
			"Sin' auld lang syne."
		],
		[
			"And there's a hand, my trusty fere!",
			"And gie's a hand o' thine!",
			"And we'll tak a right gude-willie waught,",
			"For auld lang syne."
		]
	]
	
var currentVerse = 0
var currentLine = 0
var inChorus = false

func _ready():
	randomize()
	explosion1.set_emitting(true)

func _onTimer1Fire():
	explosion1.set_emitting(true)

func _on_Timer2Fire():
	explosion2.set_emitting(true)

func _on_Timer3Fire():
	explosion3.set_emitting(true)

func _on_RocketTimerFire():
	var rocket = _rocket.instance()
	var angle = -45 + randf() * 90
	rocket.set_pos(Vector2(512, 500))
	rocket.set_rot(deg2rad(angle))
	rocket.apply_impulse(Vector2(), Vector2(0, -400).rotated(rocket.get_rot()))
	add_child(rocket)

func _on_TextTimerTick():
	var line = ""
	
	if inChorus:
		line = chorus[currentLine]
		label.set_text(line)
	else:
		var chunk = verses[currentVerse]
		line = chunk[currentLine]
		label.set_text(line)
		
	currentLine += 1
	
	if currentLine >= 4:
		currentLine = 0
		inChorus = not inChorus
		if not inChorus:
			currentVerse += 1
			if currentVerse >= 5:
				currentVerse = 0

func _on_CreditsDisplay():
	var credits = _credits.instance()
	add_child(credits)
