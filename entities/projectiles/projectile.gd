class_name Projectile
extends CharacterBody3D

@export var attack_component : AttackComponent

var direction : Vector3
var target : Node3D

func _physics_process(delta: float) -> void:
	if target:
		direction = (target.global_position - global_position).normalized()
	
	if global_position.length() > 50:
		queue_free()
	
	velocity = direction * 25.0 #lerp(velocity, direction * 25.0, 8.0 * delta)
	move_and_slide()


func _on_hitbox_component_area_entered(area: Area3D) -> void:
	var entity = area.get_parent()
	if entity is Monster:
		var result = attack_component.attack()
		
		entity.health_component.take_damage(result.amount, result.is_critical)
		
		queue_free()
