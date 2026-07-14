extends Node

static var FILE_PATH = "user://game.res"

var gameData: GameData = GameData.new()

func _ready() -> void:
	load_game()

func update_level_progress(level_name: String, time_completed: float) -> void:
	var levelFound := false
	for level in gameData.levels:
		if level.level_name == level_name:
			if level.fastest_complete > time_completed:
				level.fastest_complete = time_completed
			levelFound = true
	if not levelFound:
		var level_data: LevelData = LevelData.new()
		level_data.level_name = level_name
		level_data.fastest_complete = time_completed
		gameData.levels.append(level_data)
	_save_game()

func load_game() -> void:
	if ResourceLoader.exists(FILE_PATH):
		var fileData := ResourceLoader.load(FILE_PATH)
		if fileData is GameData: # Check that the data is valid
			print("Loaded game data")
			gameData = fileData.duplicate(true)

func _save_game() -> void:
	var result := ResourceSaver.save(gameData, FILE_PATH)
	if result == OK:
		print("Game saved")
	else:
		push_warning("Failed to save game")
