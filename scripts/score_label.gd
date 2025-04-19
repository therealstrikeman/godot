extends Label

var score: int = 0
var time_elapsed: int = 0
var player_win: bool = false

func _ready():
	$GameTimer.wait_time = 1.0  # 1 second intervals
	$GameTimer.timeout.connect(_on_GameTimer_timeout)
	$GameTimer.start()
	update_score_display()

func update_score_display():
	var minutes = time_elapsed / 60
	var seconds = time_elapsed % 60
	var time_str = "%02d:%02d" % [int(minutes), int(seconds)]
	text = "Score: %d\nTime: %s" % [score, time_str]

func _on_target_hit():
	score += 1
	update_score_display()

func _on_GameTimer_timeout():
	time_elapsed += 1
	update_score_display()

func _on_endzone_entered():
	player_win = true
	save_score()
	display_win_message()
	load_scoreboard()
	

	
func save_score():
	var data = {
		"score": score,
		"time_elapsed": time_elapsed
	}
	

	var json_string = JSON.stringify(data)

	var file = FileAccess.open("user://score.json", FileAccess.WRITE)
	if file:
		file.store_string(json_string)
		print("Score saved:\n%s" % json_string)
	else:
		print("Failed to save score.")
		
func load_scoreboard():
	var file_path = "user://score.json"

	if FileAccess.file_exists(file_path):
		var file = FileAccess.open(file_path, FileAccess.READ)
		if file:
			var content = file.get_as_text()
			var result = JSON.parse_string(content)

			if result:
				var saved_data = result
				var saved_score = saved_data.get("score", 0)
				var saved_time = saved_data.get("time_elapsed", 0)

				var minutes = floor(time_elapsed / 60)
				var seconds = int(time_elapsed) % 60

				var time_str = "%02d:%02d" % [minutes, seconds]

				var item_text = "Score: %d | Time: %s" % [saved_score, time_str]
				$ItemList.add_item(item_text)
				print("Loaded and added to list: %s" % item_text)
				$ItemList.visible = true
			else:
				print("JSON parse failed.")
		else:
			print("Couldn't open file.")
	else:
		print("No score file found.")

func display_win_message():
	text = "You win!\nFinal Score: %d" % score
