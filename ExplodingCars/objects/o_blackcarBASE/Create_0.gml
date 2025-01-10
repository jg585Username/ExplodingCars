/// @description Insert description here
// You can write your code in this editor
image_index = irandom(2)
image_speed = 0
my_target = o_opp_target
//skidmarks
angle_dif = 0
particle_system = part_system_create()
part_system_automatic_draw(particle_system, false)
part_system_position(particle_system, 0, 0)
emitter = part_emitter_create(particle_system)

tire_part = part_type_create()
part_type_sprite(tire_part, skidmark, false, false, false)
part_type_life(tire_part, 30, 200)
part_type_alpha2(tire_part, 0.05, 0)

//smoke
smoke_part = part_type_create()
part_type_sprite(smoke_part, smoke, false, false, false)
part_type_size(smoke_part, 0.1, 2, 0.1, 0.1)
part_type_orientation(smoke_part, 0, 359, 1, 1, 0)
part_type_life(smoke_part, 10, 200)
part_type_alpha2(smoke_part, 0.1, 0)