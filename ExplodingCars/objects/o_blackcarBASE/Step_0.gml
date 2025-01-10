if (!is_undefined(my_target)){
	target_direction = point_direction(x, y, my_target.x, my_target.y)
	target_x_direction = lengthdir_x(155, target_direction)
	target_y_direction = lengthdir_y(155, target_direction)
	physics_apply_force(x, y, target_x_direction, target_y_direction)
	phy_rotation = -target_direction - 90
}

//Tire skidmark
if (phy_speed > 1){
	//moves emitter to location of car
	part_emitter_region(particle_system, emitter,x - 1, x + 1, y- 1, y + 1, ps_shape_rectangle, ps_distr_gaussian)
	inertia_dir = point_direction(x, y, x + phy_speed_x, y + phy_speed_y)
	forward_dir = point_direction(x, y, x + lengthdir_x(50, -phy_rotation - 90), y + lengthdir_y(50, -phy_rotation - 90))
	angle_dif = abs(angle_difference(forward_dir, inertia_dir))
	
	if (angle_dif > 20){ //drifting
		part_type_orientation(tire_part, -phy_rotation, -phy_rotation, 0, 0, 0)
		part_emitter_burst(particle_system, emitter, tire_part, 20)
		
		//smoke
		part_type_speed(smoke_part, 1, 2, 0, 0)
		part_type_direction(smoke_part, inertia_dir, inertia_dir, 0, 0)
		part_emitter_burst(particle_system, emitter, smoke_part, 4)
	}
	
}


