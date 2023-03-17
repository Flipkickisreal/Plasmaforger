extends HBoxContainer
signal anythingpressed 
var anything_pressed = false
signal dwarfpressed
signal elfpressed

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func _on_planetbuttonone_pressed() -> void:
	while anything_pressed == false:
		anything_pressed = true
		emit_signal("anythingpressed")
		emit_signal("elfpressed")
		await get_tree().create_timer(5.0).timeout
		hide()
		await get_tree().create_timer(20).timeout
		queue_free()

func _on_planetbuttontwo_pressed() -> void:
	while anything_pressed == false:
		anything_pressed = true
		emit_signal("anythingpressed")
		emit_signal("dwarfpressed")
		await get_tree().create_timer(5.0).timeout
		hide() 
		await get_tree().create_timer(20).timeout
		queue_free()               
