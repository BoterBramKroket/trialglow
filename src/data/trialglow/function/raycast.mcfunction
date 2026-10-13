advancement revoke @s only trialglow:ring_a_bell
execute at @s anchored eyes positioned ^ ^ ^ run function trialglow_iris:get_target
execute if data storage trialglow_iris:output {TargetType: "BLOCK"} at @e[type=minecraft:marker,tag=trialglow_iris.targeted_block,limit=1] positioned ~ ~-1 ~ run function trialglow:check_for_trial_spawner
kill @e[type=minecraft:marker,tag=trialglow_iris.targeted_block]