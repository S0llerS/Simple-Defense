class_name ShootComponent
extends Node3D

@export var projectile_scene : PackedScene
@export var enabled : bool = true

@onready var timer: Timer = %Timer

func shoot(unit_stats: UnitStats):
	if !enabled:
		return
	
	for i in range(unit_stats.n_projectiles):
		if !get_parent().target:
			return
		
		var instance: Projectile = projectile_scene.instantiate()
		get_tree().root.add_child(instance)
		
		instance.global_position = global_position
		instance.target = get_parent().target
		
		instance.attack_component.damage = unit_stats.projectile_damage
		instance.attack_component.crit_chance = unit_stats.crit_chance
		instance.attack_component.crit_multiplier = unit_stats.crit_multiplier
		
		var t = min(0.175, unit_stats.fire_speed * 0.5 / unit_stats.n_projectiles)
		await get_tree().create_timer(t).timeout
		#await get_tree().create_timer(unit_stats.fire_speed * 0.75 / unit_stats.n_projectiles).timeout


func _on_timer_timeout() -> void:
	pass # Replace with function body.
