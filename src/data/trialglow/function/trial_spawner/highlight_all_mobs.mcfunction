data modify storage trialglow:trial_spawner mob.uuid set from storage trialglow:trial_spawner current_mobs[0]
function trialglow:trial_spawner/highlight_mob with storage trialglow:trial_spawner mob
data remove storage trialglow:trial_spawner current_mobs[0]
execute if data storage trialglow:trial_spawner current_mobs[0] run function trialglow:trial_spawner/highlight_all_mobs