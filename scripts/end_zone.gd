extends Area3D

signal player_entered_endzone

func _on_body_entered(body):
	print("got here")
	if body.name == "Player":
		emit_signal("player_entered_endzone")
