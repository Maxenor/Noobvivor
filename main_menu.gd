extends CanvasLayer

@export var ControlsLabel: Label

func _ready() -> void:
	$Play.pressed.connect(_on_play_pressed)
	$Controls.pressed.connect(_on_controls_pressed)
	$Quit.pressed.connect(_on_quit_pressed)

func _on_play_pressed():
	get_tree().change_scene_to_file("res://assets/level/level_1.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_controls_pressed():
	if ControlsLabel.visible :
		ControlsLabel.visible = false
	else: 
		ControlsLabel.visible = true
