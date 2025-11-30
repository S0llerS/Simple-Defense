class_name MonsterSpawner
extends Node3D

@export var target_base : Node3D

@export var monster_scene : PackedScene
@onready var wave_timer: Timer = %WaveTimer

func _ready() -> void:
	_on_wave_timer_timeout()

func spawn_monster():
	if !target_base:
		return
	
	var instance = monster_scene.instantiate()
	
	var angle = randf_range(0.0, TAU)
	var pos = Vector2(cos(angle), sin(angle)) * randf_range(25.0, 40.0)
	instance.position = Vector3(pos.x, 0.0, pos.y)
	
	instance.move_component.target = target_base
	
	add_child(instance)

func _on_wave_timer_timeout() -> void:
	if !target_base:
		wave_timer.stop()
		return
	
	var n_monsters = 1 + int(Stats.wave / 5.0) * 2
	for i in range(n_monsters):
		spawn_monster()
	
	Stats.next_wave()
