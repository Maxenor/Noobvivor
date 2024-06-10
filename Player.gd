extends CharacterBody2D

@export var speed := 460.0
@export var drag_factor := 5.0

func _process(delta):
	
	if velocity.length() > 0.0:
		$PlayerModel.play_walk_animation()
	else:
		$PlayerModel.play_idle_animation()

func _physics_process(_delta: float) -> void:
	var input_vector := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)

	var move_direction := input_vector.normalized()

	var desired_velocity := speed * move_direction
	var steering := desired_velocity - velocity
	velocity += steering / drag_factor
	set_velocity(velocity)
	move_and_slide()
	velocity = velocity
