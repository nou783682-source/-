extends CharacterBody2D

@export var speed: float = 95.0
@export var gravity: float = 1450.0
@export var left_limit: float = -90.0
@export var right_limit: float = 90.0

var direction: int = -1
var start_x: float

func _ready() -> void:
    start_x = global_position.x

func _physics_process(delta: float) -> void:
    if not is_on_floor():
        velocity.y += gravity * delta

    if global_position.x < start_x + left_limit:
        direction = 1
    elif global_position.x > start_x + right_limit:
        direction = -1

    velocity.x = direction * speed
    move_and_slide()

func _on_hurt_area_body_entered(body: Node) -> void:
    if body.has_method("die"):
        body.die()
