extends AudioStreamPlayer

@export var player: Node

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	playing = true

func _process(delta: float) -> void:
	if player.healthPercentage < 50:
		pitch_scale = 0.7 + (player.healthPercentage / 100)
	else:
		pitch_scale = 1.2
