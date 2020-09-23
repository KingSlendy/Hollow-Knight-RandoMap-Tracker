var cam = cam_get_vars();
draw_sprite_stretched(sprBkgMain, 0, cam.cam_x, cam.cam_y, cam.cam_w, cam.cam_h);

if (place_pin) {
	draw_sprite_ext(sprPinGold, 0, mouse_x, mouse_y, 1, 1, 0, c_white, 0.5);
}