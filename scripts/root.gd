extends Control

@onready var n_player: AudioStreamPlayer = $AudioStreamPlayer
@onready var n_play_button: Button\
	= $PlayerControlsMargin/PlayerControls/PlayerControlButtons/PlayButtonMargin/PlayButton
@onready var n_slider: Slider = $PlayerControlsMargin/PlayerControls/SliderMargin/Slider

func _process(_p_delta: float):
	if n_player.stream:
		n_slider.value = n_player.get_playback_position() / n_player.stream.get_length()

func _on_open_file_dialog_file_selected(path: String):
	n_player.stream = AudioStreamOggVorbis.load_from_file(path)
	n_player.play()

func _on_play_button_pressed():
	n_player.stream_paused = not n_player.stream_paused
	n_play_button.text = "RESUME" if n_player.stream_paused else "PAUSE"

func _on_seek_button_pressed(p_backward: bool):
	n_player.seek(n_player.get_playback_position() + (-5.0 if p_backward else 5.0))
