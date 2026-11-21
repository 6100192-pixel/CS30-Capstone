extends Area2D

@onready var ouchypad: Area2D = $"."
@onready var player: CharacterBody2D = $"../../Player"
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if overlaps_body(player):
		player.currentHealth -= 1
		if player.currentHealth > player.maxHealth:
			player.currentHealth = player.maxHealth
