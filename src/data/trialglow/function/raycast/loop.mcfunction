scoreboard players remove distance raycast 1
execute unless score distance raycast matches 0 if block ~ ~ ~ bell positioned ~ ~-1 ~ run function trialglow:trial_spawner/check_for_trial_spawner
execute unless score distance raycast matches 0 positioned ^ ^ ^0.1 run function trialglow:raycast/loop