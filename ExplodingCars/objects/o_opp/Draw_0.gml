/// @description Insert description here
// You can write your code in this editor
event_inherited()
for (var i = 0; i < instance_number(o_opp); i++){
	opp_ids[i] = instance_find(o_opp, i)
	var val = opp_ids[i]
	hp = (val.opp_health/100) * 100
	draw_healthbar(val.x, val.y, val.x + 50, val.y + 5, hp, c_black, c_red, c_lime, 0, true, true)
}

if opp_health <= 0 {
	draw_sprite(explosion, 1, x, y)
	instance_create_depth(x, y, 1, o_explosion)
}
