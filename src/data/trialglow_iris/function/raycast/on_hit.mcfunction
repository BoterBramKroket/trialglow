#> trialglow_iris:raycast/on_hit
#
# Writes all available information about the encountered block or entity
# See trialglow_iris:get_target for full documentation
#
# @within trialglow_iris:raycast/loop

# Write target type (one of BLOCK, ENTITY)
execute if score $block_hit trialglow_iris matches 1 if score $entity_hit trialglow_iris matches 0 run data modify storage trialglow_iris:output TargetType set value "BLOCK"
execute if score $entity_hit trialglow_iris matches 1 if score $block_hit trialglow_iris matches 0 run data modify storage trialglow_iris:output TargetType set value "ENTITY"
execute if score $block_hit trialglow_iris matches 1 if score $entity_hit trialglow_iris matches 1 if score $block_distance trialglow_iris <= $entity_distance trialglow_iris run data modify storage trialglow_iris:output TargetType set value "BLOCK"
execute if score $block_hit trialglow_iris matches 1 if score $entity_hit trialglow_iris matches 1 if score $block_distance trialglow_iris > $entity_distance trialglow_iris run data modify storage trialglow_iris:output TargetType set value "ENTITY"

# Write targeted block
execute if data storage trialglow_iris:output {TargetType: "BLOCK"} run data modify storage trialglow_iris:output TargetedBlock set value [0, 0, 0]
execute if data storage trialglow_iris:output {TargetType: "BLOCK"} store result storage trialglow_iris:output TargetedBlock[0] int 1 run scoreboard players get $[x] trialglow_iris
execute if data storage trialglow_iris:output {TargetType: "BLOCK"} store result storage trialglow_iris:output TargetedBlock[1] int 1 run scoreboard players get $[y] trialglow_iris
execute if data storage trialglow_iris:output {TargetType: "BLOCK"} store result storage trialglow_iris:output TargetedBlock[2] int 1 run scoreboard players get $[z] trialglow_iris
execute if data storage trialglow_iris:output {TargetType: "BLOCK"} align xyz run summon minecraft:marker ~0.5 ~0.5 ~0.5 {Tags: ["trialglow_iris", "trialglow_iris.targeted_block"]}

# Write targeted entity
execute if data storage trialglow_iris:output {TargetType: "ENTITY"} run data modify storage trialglow_iris:output TargetedEntity set from storage trialglow_iris:data TargetedBox.entity_id
execute if data storage trialglow_iris:output {TargetType: "ENTITY"} run data remove storage trialglow_iris:data TargetedBox.entity_id
execute if data storage trialglow_iris:output {TargetType: "ENTITY"} run data remove storage trialglow_iris:data TargetedFace.entity_id
execute if data storage trialglow_iris:output {TargetType: "ENTITY"} store result score $entity_id trialglow_iris run data get storage trialglow_iris:output TargetedEntity
execute if data storage trialglow_iris:output {TargetType: "ENTITY"} as @e[tag=trialglow_iris.possible_target] if score @s trialglow_iris.id = $entity_id trialglow_iris run tag @s add trialglow_iris.targeted_entity
execute if data storage trialglow_iris:output {TargetType: "ENTITY"} run tag @e remove trialglow_iris.possible_target

# Write target position
data modify storage trialglow_iris:output TargetPosition.tile set value [0, 0, 0]
execute store result storage trialglow_iris:output TargetPosition.tile[0] int 1 run scoreboard players get $[x] trialglow_iris
execute store result storage trialglow_iris:output TargetPosition.tile[1] int 1 run scoreboard players get $[y] trialglow_iris
execute store result storage trialglow_iris:output TargetPosition.tile[2] int 1 run scoreboard players get $[z] trialglow_iris
data modify storage trialglow_iris:output TargetPosition.point set from storage trialglow_iris:data TargetPoint
execute store result score ${x} trialglow_iris run data get storage trialglow_iris:output TargetPosition.point[0] 1000000
execute store result score ${y} trialglow_iris run data get storage trialglow_iris:output TargetPosition.point[1] 1000000
execute store result score ${z} trialglow_iris run data get storage trialglow_iris:output TargetPosition.point[2] 1000000

# Write targeted box
data modify storage trialglow_iris:output TargetedBox set from storage trialglow_iris:data TargetedBox

# Write targeted face
data modify storage trialglow_iris:output TargetedFace set from storage trialglow_iris:data TargetedFace
execute if data storage trialglow_iris:output TargetedFace{Direction: "WEST_EAST"} if score $dx trialglow_iris matches 0.. run data modify storage trialglow_iris:output TargetedFace.Direction set value "WEST"
execute if data storage trialglow_iris:output TargetedFace{Direction: "WEST_EAST"} if score $dx trialglow_iris matches ..-1 run data modify storage trialglow_iris:output TargetedFace.Direction set value "EAST"
execute if data storage trialglow_iris:output TargetedFace{Direction: "UP_DOWN"} if score $dy trialglow_iris matches 0.. run data modify storage trialglow_iris:output TargetedFace.Direction set value "DOWN"
execute if data storage trialglow_iris:output TargetedFace{Direction: "UP_DOWN"} if score $dy trialglow_iris matches ..-1 run data modify storage trialglow_iris:output TargetedFace.Direction set value "UP"
execute if data storage trialglow_iris:output TargetedFace{Direction: "NORTH_SOUTH"} if score $dz trialglow_iris matches 0.. run data modify storage trialglow_iris:output TargetedFace.Direction set value "NORTH"
execute if data storage trialglow_iris:output TargetedFace{Direction: "NORTH_SOUTH"} if score $dz trialglow_iris matches ..-1 run data modify storage trialglow_iris:output TargetedFace.Direction set value "SOUTH"

# Write total distance
execute if data storage trialglow_iris:output {TargetType: "BLOCK"} run scoreboard players operation $total_distance trialglow_iris += $block_distance trialglow_iris
execute if data storage trialglow_iris:output {TargetType: "ENTITY"} run scoreboard players operation $total_distance trialglow_iris += $entity_distance trialglow_iris
execute store result storage trialglow_iris:output Distance double 0.000001 run scoreboard players get $total_distance trialglow_iris

return run scoreboard players get $total_distance trialglow_iris
