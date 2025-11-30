@tool
extends Button

@export var container: VBoxContainer

func _ready() -> void:
	#container.resized.connect(_on_container_resized)
	print(321)

func _on_container_resized() -> void:
	size = container.size

func _process(_delta: float) -> void:
	var new_size = get_parent().size.x / 3
	custom_minimum_size = Vector2(new_size, new_size)
