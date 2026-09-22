# Create trial_spawner storage to keep track of trial spawners mobs and calls loop_trough_mobs function
data remove storage trialglow:trial_spawner mobs
data modify storage trialglow:trial_spawner mobs set from block ~ ~ ~ current_mobs
function trialglow:trial_spawner/loop_trough_mobs