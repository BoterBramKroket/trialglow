scoreboard players set distance raycast 0
execute if block ~ ~ ~ trial_spawner run data modify storage trialglow:trial_spawner current_mobs set from block ~ ~ ~ current_mobs
execute if block ~ ~ ~ trial_spawner run function trialglow:trial_spawner/highlight_all_mobs