event_inherited()

if opp_health <= 0 {
	draw_sprite(explosion, -1, x, y)
	instance_destroy()
}

if instance_number(o_opp) = 0{
	audio_stop_sound(background_music)
}
