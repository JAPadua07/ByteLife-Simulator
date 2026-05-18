var _dx = 0;
var _dy = gui_h * 0.7;
var _boxw = gui_w;
var _boxh = gui_h - _dy;

draw_sprite_stretched(tempspr_DiaBox, 0, _dx, _dy, _boxw, _boxh);

_dy += 16;
_dx += 16;

draw_set_font(BitPap24);

var _name = messages[current_message].name;
draw_text(_dx, _dy, _name);

_dy += 40;

draw_text_ext(_dx, _dy, draw_message, -1, _boxw - _dx * 2);