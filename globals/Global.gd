extends Node

# ui related
var unit_scene : PackedScene

signal dragging_started
signal dragging_ended

var selected_unit : Unit

signal unit_selected

func start_dragging(unit):
	unit_scene = unit
	
	dragging_started.emit()

func end_dragging():
	unit_scene = null
	
	dragging_ended.emit()

func select_unit(unit):
	if selected_unit:
		selected_unit.range_component.set_visuals_mode(false)
	
	selected_unit = unit
	selected_unit.range_component.set_visuals_mode(true)
	
	unit_selected.emit()
