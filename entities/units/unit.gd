class_name Unit
extends StaticBody3D

@export var unit_stats : UnitStats

@export var health_component : HealthComponent
@export var hurtbox_component : HurtboxComponent

@export var shoot_component : ShootComponent
@export var range_component : RangeComponent

@export var shoot_timer: Timer

var target : Monster

func _ready() -> void:
	# stats
	health_component.health = unit_stats.max_health
	
	if range_component:
		range_component.scale = Vector3(unit_stats.attack_range, unit_stats.attack_range, unit_stats.attack_range)
	if shoot_timer:
		shoot_timer.wait_time = unit_stats.fire_speed
	
	# signals
	health_component.destroyed.connect(_on_destroyed)

func _on_destroyed():
	queue_free()

func _on_shoot_timer_timeout() -> void:
	var areas = range_component.get_overlapping_areas()
	target = null
	for area in areas:
		if area.get_parent() is Monster:
			target = area.get_parent()
			break
	
	if target:
		shoot_component.shoot(unit_stats)


func _on_hurtbox_component_input_event(_camera: Node, event: InputEvent, _event_position: Vector3, _normal: Vector3, _shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			Global.select_unit(self)
