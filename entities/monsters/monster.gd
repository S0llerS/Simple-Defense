class_name Monster
extends CharacterBody3D

@export var health_component : HealthComponent
@export var hitbox_component : Area3D

@export var attack_timer : Timer

@export var move_component : MoveComponent

var can_attack : bool = true

func _ready() -> void:
	health_component.destroyed.connect(_on_destroyed)

func _on_destroyed():
	Stats.change_money(10)
	queue_free()

func _physics_process(delta: float) -> void:
	# attack
	if can_attack:
		var areas = hitbox_component.get_overlapping_areas()
		for area in areas:
			var entity = area.get_parent()
			if entity is Unit:
				entity.health_component.take_damage(10)
				
				can_attack = false
				attack_timer.start()
				
				break
	
	# movement
	var direction = Vector3.ZERO
	if move_component.target:
		direction = (move_component.target.global_position - global_position).normalized()
		look_at(global_position + direction)
	
	velocity = lerp(velocity, direction * 4.0, 8.0 * delta)
	move_and_slide()


func _on_attack_timer_timeout() -> void:
	can_attack = true
