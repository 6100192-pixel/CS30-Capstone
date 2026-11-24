extends CharacterBody2D

var maxHealth = 100
var currentHealth = maxHealth
var healthPercentage = remap(currentHealth, 0, maxHealth, 0, 100)
const MAX_SPEED = 300.0
const ACCEL = 40


func _physics_process(delta: float) -> void:
	# Handles movement on the X and Y, rotates player towards the cursor, and plays the animations when moving
	var directionX := Input.get_axis("move_left", "move_right")
	var directionY := Input.get_axis("move_up", "move_down")
	if directionX and directionY: # fix this later, used to normalize vectors so diagonal movement is not faster
		velocity.x = move_toward(velocity.x, MAX_SPEED * directionX, ACCEL)
		velocity.y = move_toward(velocity.y, MAX_SPEED * directionY, ACCEL)
	else:
		if directionX:
			velocity.x = move_toward(velocity.x, MAX_SPEED * directionX, ACCEL)
		else:
			velocity.x = move_toward(velocity.x, 0, ACCEL)

		if directionY:
			velocity.y = move_toward(velocity.y, MAX_SPEED * directionY, ACCEL)
		else:
			velocity.y = move_toward(velocity.y, 0, ACCEL)
	if directionX or directionY:
		$AnimatedSprite2D.animation = "walk"
	else:
		$AnimatedSprite2D.animation = "idle"
	look_at(get_global_mouse_position())
	move_and_slide()

func _process(delta:float) -> void:
	healthPercentage = remap(currentHealth, 0, maxHealth, 0, 100)
	if currentHealth < 0:
		currentHealth = 0
	if currentHealth > maxHealth:
		currentHealth = maxHealth
