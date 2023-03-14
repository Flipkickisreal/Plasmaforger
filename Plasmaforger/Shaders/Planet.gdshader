shader_type canvas_item;

void fragment() {
	// Place fragment code here.
}
void vertex() {
  // Animate Sprite2D moving in big circle around its location
  VERTEX += vec2(cos(TIME*0.03)*100.0, sin(TIME*0.05)*80.0);
}