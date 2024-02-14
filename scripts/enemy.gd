extends CharacterBody3D

@export var movement_speed: float = 4.0

@export var movement_taget: CharacterBody3D
@onready var navigation_agent = $NavigationAgent3D




func _physics_process(_delta):
	call_deferred("actor_setup")
	
	
func actor_setup():
	await get_tree().physics_frame
	set_movement_target(movement_taget.position)

func set_movement_target(target_point: Vector3):
	navigation_agent.target_position = target_point
	navigation_agent.path_desired_distance = 50
	navigation_agent.target_desired_distance = 10
	
	var current_agent_position: Vector3 = global_position
	var next_path_position: Vector3 = navigation_agent.get_next_path_position()

	var  new_velocity: Vector3 = next_path_position - current_agent_position
	new_velocity = new_velocity.normalized()
	new_velocity = new_velocity * movement_speed
	
	velocity = new_velocity 
	move_and_slide()


func _on_navigation_agent_3d_navigation_finished():
	if navigation_agent.is_navigation_finished():
				return 


func _on_navigation_agent_3d_path_changed():
	return
