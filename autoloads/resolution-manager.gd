extends Node

static var base_resolution = Vector2i(640, 360)

static var resolutions: Dictionary = {
	"640×360": Vector2i(640, 360),
	"1280x720": Vector2i(1280, 720),
	"1920x1080": Vector2i(1920, 1080),
	"2560x1440": Vector2i(2560, 1440),
	"3840x2160": Vector2i(3840, 2160),
	}

func _ready() -> void:
	## TODO: read from saved files to keep settings between session
	set_resolution(Vector2i(1280, 720))

func center_window() -> void:
	var center_screen = DisplayServer.screen_get_position() + DisplayServer.screen_get_size() / 2
	var window_size = get_window().get_size_with_decorations()
	get_window().set_position(center_screen-window_size / 2)
	
func set_resolution(new_resolution: Vector2i = get_window().get_size()) -> void:
	get_tree().root.content_scale_factor = (new_resolution / base_resolution).x
	get_window().set_size(new_resolution)
	center_window()
