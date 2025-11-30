class_name MoveComponent
extends Node3D

@export var speed : float = 10.0

var target : Node3D

func _ready() -> void:
	pass

func move():
	var force = (target.global_position - global_position).normalized() * speed
	
	return force
