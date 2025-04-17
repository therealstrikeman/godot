extends RayCast3D

@onready var damage:int = 25




func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		shoot()



func shoot():
	is_colliding()
	var target = get_collider()
	if target == null:
		print("hit not")
	else:
		if target.is_in_group("targets"):
			target.has_method("take_damage")
			target.take_damage(damage)
			if target != null:
				print("none")
