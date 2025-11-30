class_name AttackComponent
extends Node3D

var damage : int = 1
var crit_chance : float = 0.0
var crit_multiplier : float = 2.5

func attack():
	var amount: int = damage
	var is_critical: bool = false
	
	if randf_range(0, 100) <= crit_chance:
		amount = int(amount * crit_multiplier)
		is_critical = true
	
	return {
		"amount": amount,
		"is_critical": is_critical
	}
