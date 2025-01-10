event_inherited()

draw_healthbar(x, y, x + 50, y + 5, hp_car, c_black, c_red, c_lime, 0, true, true)

if player_hp <= 0 { //player death
	draw_sprite(explosion, -1, x, y)
	instance_create_depth(x, y, 1, o_explosion)
}