if keyboard_check(vk_left){
	phy_rotation -= 2.7
}


if keyboard_check(vk_right){
	phy_rotation += 2.7
}
 
if keyboard_check(vk_up){
	forward_x = lengthdir_x(155,-phy_rotation - 90);
	forward_y = lengthdir_y(155,-phy_rotation - 90);
	physics_apply_force(x,y,forward_x,forward_y);
}
 
if keyboard_check(vk_down){
	phy_speed_x = lerp(phy_speed_x, 0, 0.05)
	phy_speed_y = lerp(phy_speed_y, 0 , 0.05)
}

if (phy_speed > 1){
		//moves emitter to location of car
		part_emitter_region(particle_system, emitter,x-1, x+1, y-1, y+1, ps_shape_rectangle, ps_distr_gaussian)
		inertia_dir = point_direction(x, y, x + phy_speed_x, y + phy_speed_y)
		forward_dir = point_direction(x, y, x + lengthdir_x(50, -phy_rotation - 90), y + lengthdir_y(50, -phy_rotation - 90))
		angle_dif = abs(angle_difference(forward_dir, inertia_dir))
	
	if (angle_dif > 20){ //drifting
		part_type_orientation(tire_part, -phy_rotation, -phy_rotation, 0, 0, 0)
		part_emitter_burst(particle_system, emitter, tire_part, 20)
		audio_play_sound(sound_car_drift, 0, false)
		//smoke
		part_type_speed(smoke_part, 1, 2, 0, 0)
		part_type_direction(smoke_part, inertia_dir, inertia_dir, 0, 0)
		part_emitter_burst(particle_system, emitter, smoke_part, 4)
	}

	if (angle_dif <= 20 and audio_is_playing(sound_car_drift)){
			audio_stop_sound(sound_car_drift)
	}

}

//shooting
if (mouse_check_button_released(mb_left)){
	with instance_create_layer(x,y,"Instances", o_Bullet) {
		audio_play_sound(sound_gunshot, 1, false)
		var angle = point_direction(x,y,mouse_x,mouse_y);
		image_angle = angle;
		bforward_x = lengthdir_x(5000, angle);
		bforward_y = lengthdir_y(5000, angle);
		physics_apply_force(x,y,bforward_x,bforward_y);
	}
}

if instance_exists(o_opp) = false {
	delay++
	if delay >= 120 {
		room_goto(room_win)
	}
	
}

hp_car = (player_hp / 100) * 100


if o_blackcar.player_hp <= 0 {
	draw_sprite(explosion, -1, x, y)
	instance_destroy()
	room_goto(room_lose)
}

if instance_number(o_blackcar) = 0 {
	audio_stop_sound(background_music)
}