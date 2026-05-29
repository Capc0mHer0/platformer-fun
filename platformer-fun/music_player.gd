extends AudioStreamPlayer

const MUSIC_FOLDER = "res://assets/music/"

var songs: Array[AudioStream] = []

func _ready() -> void:
	load_songs_from_folder()
	if songs.size() <= 0:
		return
	var random_index: int = randi() % songs.size()
	stream = songs[random_index]
	play()

func load_songs_from_folder() -> void:
	var dir: Array[String] = ResourceLoader.list_directory(MUSIC_FOLDER)
	for file_name in dir:
		# Filter for audio files and ignore Godot import files (.remap)
		if file_name.ends_with(".mp3") or file_name.ends_with(".wav"):
			var song_path: String = MUSIC_FOLDER + file_name.trim_suffix(".remap")
			var stream_file := load(song_path)
			if stream_file is AudioStream:
				songs.append(stream_file)
