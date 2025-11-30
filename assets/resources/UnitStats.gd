class_name UnitStats
extends Resource

@export var title : String = "Unit's Title"
@export var price : int = 100

@export var max_health : int = 10
@export var health : int = 10

@export var projectile_damage : int = 2
@export var projectile_size : float = 0.25

@export var n_projectiles : int = 1

@export var fire_speed : float = 0.2

@export var attack_range : float = 10.0

@export var crit_chance : float = 10.0
@export var crit_multiplier : float = 2.5

@export var stats = {
	"title": "Unit's Title",
	"price": 100,

	"max_health": 10,
	"health": 10,

	"projectile_damage": 2,
	"n_projectiles": 1,
	"fire_speed": 0.2,

	"attack_range": 10.0,

	"crit_chance": 10.0,
	"crit_multiplier": 2.5
}

var stat_labels = {
	"price": "Price",

	"max_health": "Max Health",
	"health": "Health",

	"projectile_damage": "Projectile Damage",
	"n_projectiles": "Number of Projectiles",
	"fire_speed": "Fire Speed",

	"attack_range": "Attack Range",

	"crit_chance": "Crit Chance",
	"crit_multiplier": "Crit Multiplier"
}
