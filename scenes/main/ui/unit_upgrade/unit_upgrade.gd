class_name UnitUpgrade
extends PanelContainer

@export var upgrade_cell : PackedScene

@onready var title: Label = %Title

@onready var health_bar: TextureProgressBar = %HealthBar
@onready var health_label: Label = %HealthLabel

@onready var upgrade_container: GridContainer = %UpgradeContainer

func _ready() -> void:
	Global.unit_selected.connect(_on_unit_selected)

func show_upgrades():
	# clean up
	for child in upgrade_container.get_children():
		child.queue_free()
	
	# актуалочка
	var unit_stats = Global.selected_unit.unit_stats
	
	title.text = str(unit_stats.title)
	
	# HP stuff
	Global.selected_unit.health_component.hurt.connect(_on_unit_hurt)
	_on_unit_hurt()
	
	#for key in unit_stats.stats:
		#var instance: UpgradeCell = upgrade_cell.instantiate()
		#
		#instance.title.text = unit_stats.stat_labels[key]
		#instance.amount.text = str(unit_stats.stats[key])
		#instance.price.text = "$100"
		#
		#upgrade_container.add_child(instance)

func _on_unit_hurt():
	if !Global.selected_unit:
		print("BOOM")
		return
	
	var max_health = Global.selected_unit.unit_stats.max_health
	var current_health = Global.selected_unit.health_component.health
	
	health_bar.max_value = max_health
	health_bar.value = current_health
	
	health_label.text = str(current_health) + "/" + str(max_health)

func _on_unit_selected():
	show_upgrades()
	visible = true

func _on_close_pressed() -> void:
	if Global.selected_unit:
		Global.selected_unit.range_component.set_visuals_mode(false)
	
	visible = false
