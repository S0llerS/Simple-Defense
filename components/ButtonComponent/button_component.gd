extends Node

var target_button : Button

func _ready() -> void:
	target_button = get_parent()
	
	target_button.mouse_entered.connect(_on_hovered)
	target_button.pressed.connect(_on_pressed)
	
	target_button.focus_mode = Control.FOCUS_NONE

func _on_hovered():
	pass

func _on_pressed():
	pass
