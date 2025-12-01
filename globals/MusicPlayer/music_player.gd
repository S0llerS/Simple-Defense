extends Node

# music

# core
@onready var audio_player: AudioStreamPlayer = %AudioPlayer

func play_music(music):
	audio_player.stream = music
	audio_player.play()
