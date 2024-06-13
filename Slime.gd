extends CharacterBody2D

@export var Slime: Node2D
@export var SmokeEffect: PackedScene
# get the player reference
@onready var target_node: CharacterBody2D = get_node("/root/Level1/Player")

var is_hurt: bool = false
var health: int = 3

func _ready() -> void:
	$Slime.play_walk_animation()

func _physics_process(delta: float) -> void:
	_update_movement(delta)

func _update_movement(delta: float) -> void:
	#move in player direction
	var direction = global_position.direction_to(target_node.global_position)
	velocity = direction * 300.0
	move_and_slide()
