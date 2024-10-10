extends StaticBody3D
var health = 25






func _ready():
	add_to_group("targets")





func take_damage(amount: int):
	health -= amount
	if health <= 0:
		health = 0
		queue_free()
