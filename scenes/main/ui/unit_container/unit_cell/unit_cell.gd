extends Button

@export var unit_scene : PackedScene
var preview_unit : Unit

var is_dragging : bool = false

@onready var price: Label = %Price

func _ready() -> void:
	var unit_template: Unit = unit_scene.instantiate()
	price.text = "$" + str(unit_template.unit_stats.price)

func _on_button_down() -> void:
	preview_unit = unit_scene.instantiate()
	#get_tree().root.add_child(preview_unit)
	
	is_dragging = true
	Global.start_dragging(unit_scene)

func _on_button_up() -> void:
	preview_unit.queue_free()
	
	preview_unit = null
	is_dragging = false
	Global.end_dragging()
