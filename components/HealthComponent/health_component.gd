class_name HealthComponent
extends Node3D

@export var health : int = 10

signal hurt
signal destroyed

func take_damage(amount: int, is_critical: bool = false):
	health -= amount
	hurt.emit()
	
	PopupManager.spawn_popup(PopupManager.DAMAGE_POPUP, global_position, amount, is_critical)
	
	if health <= 0:
		destroyed.emit()
