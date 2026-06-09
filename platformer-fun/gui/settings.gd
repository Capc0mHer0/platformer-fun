extends Control
class_name Settings

signal settings_closed

func _ready() -> void:
	$GridContainer/HSlider.value = db_to_linear(AudioServer.get_bus_volume_db(0))

func _on_h_slider_value_changed(value) -> void:
	var sfx_index = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(sfx_index, linear_to_db(value))

func _on_back_button_pressed() -> void:
	settings_closed.emit()
	self.queue_free()
