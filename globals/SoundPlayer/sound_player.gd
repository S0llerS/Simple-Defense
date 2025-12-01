extends Node

# sounds
const BASIC_SHOOT = preload("uid://ba0v72y7deulx")
const DESTROYED = preload("uid://3g6nh8wylbne")
const BUILD = preload("uid://bldnxnipe0m35")

# core
var audio_players

func _ready() -> void:
	audio_players = get_children()

func play_sound(sound):
	for audio_player in audio_players:
		if !audio_player.playing:
			audio_player.stream = sound
			audio_player.pitch_scale = randf_range(0.95, 1.05)
			
			audio_player.play()
			
			break
