extends Control
class_name Settings

@onready var resolutionOptionsButton: OptionButton = $GridContainer/MarginContainer/OptionButton
@onready var fullScreenCheckBox: CheckBox = $GridContainer/CenterContainer/CheckBox

signal settings_closed

func _ready() -> void:
	$GridContainer/HSlider.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	
	var currentResolution = get_window().get_size()
	var id = 0
	for resolution in ResolutionManager.resolutions:
		resolutionOptionsButton.add_item(resolution, id)
		if ResolutionManager.resolutions[resolution] == currentResolution:
			resolutionOptionsButton.select(id)
		id += 1
		
	if get_window().get_mode() == Window.MODE_FULLSCREEN:
		fullScreenCheckBox.set_pressed_no_signal(true)

func _on_h_slider_value_changed(value) -> void:
	var sfx_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(sfx_index, linear_to_db(value))

func _on_back_button_pressed() -> void:
	settings_closed.emit()
	self.queue_free()

func _on_option_button_item_selected(index) -> void:
	var id = resolutionOptionsButton.get_item_text(index)
	ResolutionManager.set_resolution(ResolutionManager.resolutions[id])

func _on_check_box_toggled(toggled_on: bool) -> void:
	if toggled_on:
		get_window().set_mode(Window.MODE_FULLSCREEN)
	else:
		get_window().set_mode(Window.MODE_WINDOWED)
		ResolutionManager.center_window()
