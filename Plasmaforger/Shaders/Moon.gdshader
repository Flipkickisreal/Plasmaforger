shader_type canvas_item;

void fragment() {
	// Place fragment code here.
}
void vertex() {
  // Animate Sprite2D moving in big circle around its location
  VERTEX += vec2(cos(TIME*0.4)*100.0, sin(TIME*0.1)*30.0);
}