scoreboard players set distance raycast 0
data remove storage trialglow:trial_spawner current_mobs
execute if block ~ ~ ~ trial_spawner run data modify storage trialglow:trial_spawner current_mobs set from block ~ ~ ~ current_mobs
execute if data storage trialglow:trial_spawner current_mobs[0] run function trialglow:trial_spawner/highlight_all_mobs