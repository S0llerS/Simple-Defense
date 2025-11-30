extends Node

const DAMAGE_POPUP = preload("uid://n0n1kqkqt17d")

func spawn_popup(popup: PackedScene, pos: Vector3, amount: int, is_critical: bool):
	var instance = popup.instantiate()
	get_tree().root.add_child(instance)
	
	var offset = Vector3(randf_range(-0.75, 0.75), 0.0, randf_range(-0.75, 0.75))
	instance.global_position = pos + offset
	
	instance.label.text = str(amount)
	
	if is_critical:
		instance.animator.play("critical_popup")
	else:
		instance.animator.play("popup")
