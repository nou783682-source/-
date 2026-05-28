extends Control

func _ready() -> void:
    $CenterContainer/VBoxContainer/AgainButton.pressed.connect(_again)
    $CenterContainer/VBoxContainer/MenuButton.pressed.connect(_menu)

func _again() -> void:
    get_tree().change_scene_to_file("res://scenes/Level1.tscn")

func _menu() -> void:
    get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
