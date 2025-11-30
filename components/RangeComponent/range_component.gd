class_name RangeComponent
extends Area3D

@export var range_visuals : MeshInstance3D

@export var range_active : Material
@export var range_inactive : Material

func set_visuals_mode(enabled: bool, is_active: bool = true):
	range_visuals.visible = enabled
	
	if is_active:
		range_visuals.material_override = range_active
	else:
		range_visuals.material_override = range_inactive
