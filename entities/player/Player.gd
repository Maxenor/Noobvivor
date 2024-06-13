extends CharacterBody2D

@export var speed: float = 460.0
@export var drag_factor: float = 5.0
@export var HurtBox: Area2D
@export var ProgressBarHP: ProgressBar

var health: int = 100
signal health_depleted
const DAMAGE_RATE: float = 5.0

func _process(delta: float) -> void:
	_update_animation()

func _physics_process(delta: float) -> void:
	_update_velocity(delta)
	move_and_slide()
	_update_health(delta)

func _update_velocity(delta: float) -> void:
	var input_vector := Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	)
	# fix for multiple inputs
	var move_direction := input_vector.normalized()
	var desired_velocity := speed * move_direction
	var steering := desired_velocity - velocity
	velocity += steering / drag_factor

func _update_health(delta: float) -> void:
	var overlapping_mobs = HurtBox.get_overlapping_bodies()
	if overlapping_mobs.size() > 0:
		health -= DAMAGE_RATE * overlapping_mobs.size() * delta
		ProgressBarHP.value = health
		if health <= 0:
			health_depleted.emit()

func _update_animation() -> void:
	if velocity.length() > 10:
		$PlayerModel.play_walk_animation()
	else:
		$PlayerModel.play_idle_animation()
