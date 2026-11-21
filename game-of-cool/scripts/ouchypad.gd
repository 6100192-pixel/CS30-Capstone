extends Area2D

@export var player: Node


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if overlaps_body(player):
		player.currentHealth -= 1
		if player.currentHealth > player.maxHealth:
			player.currentHealth = player.maxHealth
