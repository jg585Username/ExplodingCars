///Initialize race target
randomize();
path[0] = NPC_Car_Path //two paths for o_opp to follow
path[1] = NPC_Car_Path2
path_start(path[irandom(1)], 3.2 + random(0.5), 1, 1) //do not let cars catch up with targets, assign random speeds


