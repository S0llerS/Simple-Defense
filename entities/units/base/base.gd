class_name Base
extends StaticBody3D

@export var health_component : HealthComponent

func _ready() -> void:
	health_component.destroyed.connect(_on_destroyed)

func _on_destroyed():
	queue_free()
