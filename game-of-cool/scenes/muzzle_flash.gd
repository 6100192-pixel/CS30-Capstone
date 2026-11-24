extends Sprite2D

@export var raycast: Node


func _process(delta: float) -> void:
	if raycast.bulletShooted:
		visible = true
	else:
		visible = false
	print(raycast.bulletShooted)
