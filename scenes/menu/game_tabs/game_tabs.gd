@tool

class_name GameTabs
extends Control

@export var tabs : HBoxContainer

func _process(_delta: float) -> void:
	for child in tabs.get_children():
		if child is Button:
			child.custom_minimum_size = Vector2(size.x / 3, size.x / 3)
