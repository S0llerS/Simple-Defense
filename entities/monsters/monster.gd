class_name Monster
extends CharacterBody3D

@export var monster_stats : MonsterStats

@export var health_component : HealthComponent
@export var hitbox_component : Area3D

@export var attack_timer : Timer

@export var move_component : MoveComponent

var can_attack : bool = true

func _ready() -> void:
	# stats
	health_component.health = monster_stats.max_health
	
	hitbox_component.scale = Vector3(monster_stats.attack_range, monster_stats.attack_range, monster_stats.attack_range)
	attack_timer.wait_time = monster_stats.attack_speed
	
	# signals
	health_component.destroyed.connect(_on_destroyed)

func _on_destroyed():
	Stats.change_money(monster_stats.kill_reward)
	queue_free()

func _physics_process(delta: float) -> void:
	# attack
	if can_attack:
		var areas = hitbox_component.get_overlapping_areas()
		for area in areas:
			var entity = area.get_parent()
			if entity is Unit:
				entity.health_component.take_damage(monster_stats.melee_damage)
				
				can_attack = false
				attack_timer.start()
				
				break
	
	# movement
	var direction = Vector3.ZERO
	if move_component.target:
		direction = (move_component.target.global_position - global_position).normalized()
		look_at(global_position + direction)
	
	velocity = lerp(velocity, direction * monster_stats.move_speed, 8.0 * delta)
	move_and_slide()


func _on_attack_timer_timeout() -> void:
	can_attack = true
