shader_type canvas_item;

void fragment() {
	// Place fragment code here.
}
void vertex() {
  // Animate Sprite2D moving in big circle around its location
  VERTEX += vec2(cos(TIME)*1000.0, sin(TIME)*800.0);
}