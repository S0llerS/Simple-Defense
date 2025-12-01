extends Control


@export var ui : CanvasLayer

func _ready() -> void:
	ui.base.health_component.destroyed.connect(_on_destroyed)

func _on_destroyed():
	visible = true

func _on_retry_pressed() -> void:
	get_tree().reload_current_scene()
