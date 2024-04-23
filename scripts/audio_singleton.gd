extends Node

func _ready():
	$main_music.play()

func _process(_delta):
	pass

func _play_audio():
	$main_reset_sound.play()
