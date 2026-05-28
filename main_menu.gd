extends Control

func _ready() -> void:
    $CenterContainer/VBoxContainer/PlayButton.pressed.connect(_play)
    $CenterContainer/VBoxContainer/QuitButton.pressed.connect(_quit)

func _play() -> void:
    get_tree().change_scene_to_file("res://scenes/Level1.tscn")

func _quit() -> void:
    get_tree().quit()
