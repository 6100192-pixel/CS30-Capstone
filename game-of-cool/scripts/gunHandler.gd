extends RayCast2D

@export var raycast: Node
@export var tracer: Node
@export var particle: Node

var bulletShooted = false
var canShoot = true
var magazineSize = 12
var bulletsLeft = magazineSize
var maxSpareBullets = 60
var spareBullets = maxSpareBullets - magazineSize
var equippedGunName = "DCS MD95 10mm Service Pistol"

func _input(event):
	# On left click, fire a bullet if the gun has one loaded, otherwise make a click
	# On key R pressed, reload the gun for 2.3 seconds, during which the player cannot shoot
	if event.is_action_pressed("fire_gun") and canShoot:
		if bulletsLeft > 0:
			bulletShooted = true

			var soundChoice = randi_range(1, 3)

			if soundChoice == 1:
				$gunFire1.play()
			elif soundChoice == 2:
				$gunFire2.play()
			else:
				$gunFire3.play()
			bulletsLeft -= 1
			print("Shot fired! You shot" + str(get_collider()))
		else:
			$gunDryfire.play()
			print("Gun is empty; Reload!")
	if event.is_action_pressed("reload_gun"):
		if bulletsLeft != magazineSize and spareBullets > 0:
			canShoot = false
			$gunReload.play()
			$reloadTimer.start()
			print("Reloading!")

func _process(delta: float) -> void:
	tracer.clear_points()

	tracer.add_point(Vector2(40, 0))

	if is_colliding():
		var collision_local = tracer.to_local(get_collision_point())
		tracer.add_point(collision_local)

	tracer.visible = bulletShooted
	bulletShooted = false

func _on_reload_timer_timeout() -> void:
	# Once the reload timer expires, let the player shoot again
	spareBullets += bulletsLeft
	if spareBullets < 12:
		bulletsLeft = spareBullets
		spareBullets = 0
	else:
		bulletsLeft = 12
		spareBullets -= 12
	canShoot = true
