extends Label
 
var score: int = 0 
var player_win:bool = false

func _ready():
	update_score_display()
	
	
func update_score_display():
	text = "Score: %d" % score


func _on_target_hit():
	score += 1
	update_score_display()
