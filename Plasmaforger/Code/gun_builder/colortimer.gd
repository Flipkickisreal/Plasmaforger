extends Label
var red = 0
var green = 255
var timedout = false
const LOOP_AMOUNT_COLOR := 40
const BLACK = Color(0,0,0,255)
const YELLOW = Color(170, 170, 0, 255)
const RED = Color(255, 1, 1, 255)
const GREEN = Color(1, 255, 1, 255)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	add_theme_color_override("font_shadow_color",BLACK)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass

#attempt 1
#func _on_gun_builder_gamestarted() -> void:
	#await get_tree().create_timer(5.0).timeout
#	var newColor = Color(red, green, 0, 255)
	#remove_theme_color_override("font_shadow_color")
#	add_theme_color_override("font_shadow_color",newColor)
	#for i in LOOP_AMOUNT_COLOR:
#		remove_theme_color_override("font_shadow_color")
	#	green-=13
#		red+=13
	#	newColor = Color(red ,green, 0, 255)
#		if timedout == false:
	#		add_theme_color_override("font_shadow_color", newColor)
#		await get_tree().create_timer(0.5).timeout

#attempt 2

#func _on_timer_timeout() -> void:
#	timedout = true
#	self.remove_theme_color_override("font_shadow_color")
#	self.add_theme_color_override("font_shadow_color",GREEN)
#	self.remove_theme_color_override("font_color")
#	self.add_theme_color_override("font_color", GREEN)
#	print("green!")
#	await get_tree().create_timer(5.0).timeout
#	self.remove_theme_color_override("font_shadow_color")
#	self.add_theme_color_override("font_shadow_color",YELLOW)
#	print("yellow!")
#	await get_tree().create_timer(5.0).timeout
#	self.remove_theme_color_override("font_shadow_color")
#	self.add_theme_color_override("font_shadow_color",RED)
#	print("red!")


func _on_gun_builder_elf() -> void:
	set_text("Mimi's shop'o gunparts\nBUY BIG KAWAII\nMUCH BOOM!!!!")


func _on_gun_builder_dwarf() -> void:
	set_text("E-Recto's!\n Perveyor of Fine Parts\nFight Hard: Shop E-Recto's")
