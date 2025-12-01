class_name Main
extends Node3D

@export var head : Head

var unit_scene : PackedScene
var preview_unit : Unit

func _ready() -> void:
	Global.dragging_started.connect(_on_dragging_started)
	Global.dragging_ended.connect(_on_dragging_ended)

func _on_dragging_started():
	unit_scene = Global.unit_scene
	preview_unit = unit_scene.instantiate()
	
	preview_unit.process_mode = Node.PROCESS_MODE_DISABLED
	preview_unit.range_component.set_visuals_mode(true)
	preview_unit.hurtbox_component.monitorable = false
	
	add_child(preview_unit)

func _on_dragging_ended():
	# add unit
	if !preview_unit.hurtbox_component.has_overlapping_areas() and !is_inside_unit_area(preview_unit.global_position):
		if Stats.change_money(-preview_unit.unit_stats.price):
			SoundPlayer.play_sound(SoundPlayer.BUILD)
			
			var instance = unit_scene.instantiate()
			add_child(instance)
			instance.global_position = preview_unit.global_position
	else:
		print("Can't place unit here!")
	
	# clean up
	preview_unit.queue_free()
	preview_unit = null

func _physics_process(_delta: float) -> void:
	if !preview_unit:
		return
	
	var mouse_position = get_viewport().get_mouse_position()
	
	var ray_origin = head.camera.project_ray_origin(mouse_position)
	var direction = head.camera.project_ray_normal(mouse_position)
	
	var plane = Plane(Vector3.UP)
	
	var intersection = plane.intersects_ray(ray_origin, direction)
	
	if intersection:
		preview_unit.global_position = intersection
		
		if preview_unit.hurtbox_component.has_overlapping_areas():
			preview_unit.range_component.set_visuals_mode(true, false)
		else:
			preview_unit.range_component.set_visuals_mode(true, true)
	
	if is_inside_unit_area(intersection):
		preview_unit.range_component.set_visuals_mode(true, false)
	else:
		preview_unit.range_component.set_visuals_mode(true, true)

func is_inside_unit_area(pos: Vector3):
	return pos.x < -12.5 or pos.x > 12.5 or pos.z < -12.5 or pos.z > 12.5
