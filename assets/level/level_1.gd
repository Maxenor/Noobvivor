extends Node2D

func _ready() -> void:
	$Player.health_depleted.connect(_on_player_health_depleted)

func _on_player_health_depleted():
	$GameOver.visible = true
	# pause the game
	get_tree().paused = true
