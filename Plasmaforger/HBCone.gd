extends HBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_planetbuttonone_pressed() -> void:
	await get_tree().create_timer(5.0).timeout
	hide()

func _on_planetbuttontwo_pressed() -> void:
	await get_tree().create_timer(5.0).timeout
	hide()                
