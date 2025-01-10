//bomb
if can_drop = true and phy_speed > 1{
	drop_bomb = instance_create_depth(x, y, 0, o_Bomb)
	can_drop = false
	alarm[1] = 240
}