extends ProgressBar

@export var player: Node

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	value = player.healthPercentage
