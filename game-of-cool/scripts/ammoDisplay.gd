extends Label

@onready var eW = $"../../Player/equippedWeapon" #eW is short for 'equippedWeapon'. It was too long and annoying to read so i shortened it.

func _ready() -> void:
	print("Weapon node: ", eW)

func _process(delta: float) -> void:
	if eW.canShoot:
		text = str(eW.bulletsLeft) + "/" + str(eW.spareBullets) + "\n" + str(eW.equippedGunName)
	else:
		text = "Reloading... \n" + str(eW.equippedGunName)
