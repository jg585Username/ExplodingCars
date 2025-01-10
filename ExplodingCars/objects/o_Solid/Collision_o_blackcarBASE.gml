//handles collision with wall
if play_crash = true {
	audio_play_sound(car_crash, 1 ,false)
	play_crash = false
	alarm[0] = 120
}