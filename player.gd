extends CharacterBody2D

@export var speed: float = 260.0
@export var jump_force: float = -520.0
@export var gravity: float = 1450.0

signal stats_changed(lives: int, coins: int)
signal player_died

var lives: int = 3
var coins: int = 0
var start_position: Vector2

func _ready() -> void:
    start_position = global_position
    emit_signal("stats_changed", lives, coins)

func _physics_process(delta: float) -> void:
    var direction := Input.get_axis("move_left", "move_right")
    velocity.x = direction * speed

    if not is_on_floor():
        velocity.y += gravity * delta

    if Input.is_action_just_pressed("jump") and is_on_floor():
        velocity.y = jump_force

    move_and_slide()

    if global_position.y > 1050:
        die()

func add_coin() -> void:
    coins += 1
    emit_signal("stats_changed", lives, coins)

func die() -> void:
    lives -= 1
    emit_signal("stats_changed", lives, coins)
    if lives <= 0:
        get_tree().reload_current_scene()
        return
    global_position = start_position
    velocity = Vector2.ZERO
    emit_signal("player_died")
