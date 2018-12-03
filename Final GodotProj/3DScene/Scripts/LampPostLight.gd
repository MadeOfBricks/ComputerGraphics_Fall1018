extends OmniLight

const BASE_ENERGY = 0.27

func _ready():
	pass



func _on_VisibilityNotifier_screen_entered():
	visible = true



func _on_VisibilityNotifier_screen_exited():
	visible = false
