layer_set_visible("Effect_1", true)
sprite_index = empty
alarm[0] = 10
opp_id = other.id
if take_health = true {
	opp_id.opp_health -= 25
	take_health = false
	alarm[1] = 120
}