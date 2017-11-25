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
	var items = Array()
	scoreList.clear()
	for score in highScores:
		items.append(score)
		
	items.sort_custom(self, "sortItem")
	
	for item in items:
		scoreList.add_item(item + " - " + str(highScores[item]))
	
func sortItem(obj1, obj2):
	var score1 = highScores[obj1]
	var score2 = highScores[obj2]
	if (score1 < score2):
		return false
	return true

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

