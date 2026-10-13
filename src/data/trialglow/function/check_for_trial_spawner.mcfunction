data remove storage trialglow:trial_spawner current_mobs
execute if block ~ ~ ~ trial_spawner run data modify storage trialglow:trial_spawner current_mobs set from block ~ ~ ~ current_mobs
execute if data storage trialglow:trial_spawner current_mobs[0] run data modify storage trialglow:trial_spawner mob.uuid set from storage trialglow:trial_spawner current_mobs[0]
execute if data storage trialglow:trial_spawner current_mobs[0] run function trialglow:trial_spawner/highlight_all_mobs with storage trialglow:trial_spawner mob