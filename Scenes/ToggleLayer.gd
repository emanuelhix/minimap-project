extends CanvasLayer

func _input(event):
	if event.is_action_released("toggle_map"):
		self.visible = !self.visible
