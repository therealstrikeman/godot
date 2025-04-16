extends Label

var score: int = 0
var time_left: int = 30
var player_win: bool = false

func _ready():
	$GameTimer.wait_time = 1.0  # 1 second intervals
	$GameTimer.timeout.connect(_on_GameTimer_timeout)
	$GameTimer.start()
	update_score_display()

func update_score_display():
	text = "Score: %d\nTime: %d" % [score, time_left]

func _on_target_hit():
	score += 1
	update_score_display()

func _on_GameTimer_timeout():
	time_left -= 1
	update_score_display()
	
	if time_left <= 0:
		$GameTimer.stop()
		text += "\nTime's up!"
