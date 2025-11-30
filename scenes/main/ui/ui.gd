extends CanvasLayer

@export var main : Main
@export var head : Head

@export var base : Unit

@onready var health: Label = %Health
@onready var money: Label = %Money
@onready var wave: Label = %Wave

func _ready() -> void:
	base.health_component.hurt.connect(_on_hurt)
	base.health_component.destroyed.connect(_on_destroyed)
	
	Stats.money_changed.connect(_on_money_changed)
	Stats.wave_changed.connect(_on_wave_changed)

func _on_hurt():
	health.text = "HP: " + str(base.health_component.health)

func _on_destroyed():
	pass

func _on_money_changed():
	money.text = "$" + str(Stats.money)

func _on_wave_changed():
	wave.text = "WAVE: " + str(Stats.wave)
