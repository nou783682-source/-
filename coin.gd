extends Area2D

func _ready() -> void:
    body_entered.connect(_on_body_entered)

func _process(delta: float) -> void:
    rotation += delta * 3.5

func _on_body_entered(body: Node) -> void:
    if body.has_method("add_coin"):
        body.add_coin()
        queue_free()
