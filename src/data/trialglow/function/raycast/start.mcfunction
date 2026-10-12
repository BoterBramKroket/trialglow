advancement revoke @s only trialglow:ring_a_bell
execute at @s anchored eyes positioned ^ ^ ^ run function iris:get_target
execute if data storage iris:output {TargetType: "BLOCK"} at @e[type=minecraft:marker,tag=iris.targeted_block,limit=1] positioned ~ ~ ~ run function trialglow:test
kill @e[type=minecraft:marker,tag=iris.targeted_block]