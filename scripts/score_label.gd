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
	var time_str = "%02d:%02d" % [minutes, seconds]
	text = "Score: %d\nTime: %s" % [score, time_str]

func _on_target_hit():
	score += 1
	update_score_display()

func _on_GameTimer_timeout():
	time_elapsed += 1
	update_score_display()
