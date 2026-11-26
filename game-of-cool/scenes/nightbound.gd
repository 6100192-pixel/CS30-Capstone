extends CharacterBody2D

@onready var player: CharacterBody2D = $"../Player"
@onready var equipped_weapon: Raycast2D = $"Player/equippedWeapon"


var maxHealth = 50
var health = maxHealth


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if equipped_weapon.get_collider() == self:
		health -= equipped_weapon.damage
		if health < 0:
			visible = false
