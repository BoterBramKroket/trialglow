# Send Raycast to find bell by repeatedly calling this function (if found call check_trial_spawner function)
execute if block ~ ~ ~ minecraft:bell run execute positioned ~ ~-1 ~ run function trialglow:trial_spawner/check_trial_spawner
execute unless block ~ ~ ~ minecraft:bell run execute positioned ^ ^ ^0.1 run function trialglow:bell/find_bell