extends CanvasLayer

func bind_player(player: Node) -> void:
    player.stats_changed.connect(_on_stats_changed)
    _on_stats_changed(player.lives, player.coins)

func _on_stats_changed(lives: int, coins: int) -> void:
    $StatsLabel.text = "Жизни: %d   Монеты: %d" % [lives, coins]
