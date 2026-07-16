extends Node
# Levels are in the order they are in the array. New levels must be added to the
# array in the order we want them to be played

const levels: Array[String] = [
	"res://levels/level_1.tscn",
	"res://levels/level_2.tscn",
	"res://levels/level_3.tscn",
	"res://levels/level_4.tscn",
	"res://levels/level_5.tscn",
	"res://levels/level_6.tscn",
	"res://levels/level_7.tscn"]

func advanceToNextScene() -> void:
	var currentSceneIndex := levels.find(get_tree().current_scene.scene_file_path)
	if currentSceneIndex >= levels.size() - 1:
		get_tree().quit()
	elif currentSceneIndex == -1:
		print("Could not find current scene in levels array: ", get_tree().current_scene.scene_file_path)
	else:
		get_tree().change_scene_to_file(levels[currentSceneIndex + 1])

func loadLevel(level: int) -> void:
	if level > levels.size():
		print("Tried to change to level which does not exist: ", level)
		return
	get_tree().change_scene_to_file(levels[level - 1])
	
func restartLevel() -> void:
	var currentSceneIndex := levels.find(get_tree().current_scene.scene_file_path)
	get_tree().change_scene_to_file(levels[currentSceneIndex])
