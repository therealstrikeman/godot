extends StaticBody3D
 
signal hit

var health = 25


func _ready():
	add_to_group("targets")





func take_damage(amount: int):
	health -= amount
	if health <= 0:
		health = 0
		emit_signal("hit")
		queue_free()

func _on_death(): 
	print(_on_death())
	
	
	
	
