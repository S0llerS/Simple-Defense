extends Node3D

@export var tile_scene : PackedScene
@export var tile_size : Vector3 = Vector3(1.0, 0.25, 1.0)

@export var grid_size : Vector2 = Vector2(6, 10)

func _ready() -> void:
	spawn_tiles()

func spawn_tiles():
	for x in range(grid_size.x):
		for y in range(grid_size.y):
			var instance = tile_scene.instantiate()
			
			var x_pos = tile_size.x * x - (tile_size.x * grid_size.x - 1) / 2
			var z_pos = tile_size.z * y - (tile_size.z * grid_size.y - 1) / 2
			instance.position = Vector3(x_pos, 0.0, z_pos)
			
			add_child(instance)
