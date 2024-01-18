extends Control

@onready var player: AudioStreamPlayer = $AudioStreamPlayer

func _on_open_file_dialog_file_selected(path: String):
	player.stream = AudioStreamOggVorbis.load_from_file(path)
