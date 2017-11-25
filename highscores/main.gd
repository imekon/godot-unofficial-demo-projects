extends PanelContainer

const HIGHSCORE_FILENAME = "user://highscores.dat"

var highScores = {
	"PG" : 100,
	"PG" : 100,
	"PG" : 100,
	"PG" : 100,
	"PG" : 100
}

onready var nameEdit = get_node("Panel/NameEdit")
onready var scoreEdit = get_node("Panel/ScoreEdit")
onready var scoreList = get_node("Panel/ScoreList")

func _ready():
	readHighScores()
	displayHighScores()

func _onAddButton():
	var name = nameEdit.get_text()
	var scoreText = scoreEdit.get_text()
	var score = int(scoreText)
	highScores[name] = score
	writeHighScores()
	displayHighScores()
	
func displayHighScores():
	scoreList.clear()
	for score in highScores:
		scoreList.add_item(score + " - " + str(highScores[score]))

func readHighScores():
	var file = File.new()
	if (!file.file_exists(HIGHSCORE_FILENAME)):
		return
		
	if (file.open(HIGHSCORE_FILENAME, File.READ) != 0):
		return
		
	highScores = {}
	highScores.parse_json(file.get_line())
	file.close()

func writeHighScores():
	var file = File.new()
	if (file.open(HIGHSCORE_FILENAME, File.WRITE) != 0):
		return
	
	file.store_line(highScores.to_json())
	file.close()

