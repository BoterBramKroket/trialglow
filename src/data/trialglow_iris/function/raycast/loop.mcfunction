#> trialglow_iris:raycast/loop
#
# Loops forward until an obstacle is hit or until the maximum recursion depth has been reached
#
# @context a marker and the current ray position
# @within trialglow_iris:get_target
# @within trialglow_iris:raycast/loop

# Test for collisions
execute store success score $block_hit trialglow_iris store result score $block_distance trialglow_iris run function trialglow_iris:raycast/test_for_block
execute store success score $entity_hit trialglow_iris store result score $entity_distance trialglow_iris run function trialglow_iris:raycast/test_for_entity
execute if score $block_hit trialglow_iris matches 1 run return run function trialglow_iris:raycast/on_hit
execute if score $entity_hit trialglow_iris matches 1 run return run function trialglow_iris:raycast/on_hit

# Proceed to the next block
execute store result score $to_next_block trialglow_iris run function trialglow_iris:raycast/find_next_block
scoreboard players operation $total_distance trialglow_iris += $to_next_block trialglow_iris

# Fail if the maximum recursion depth is reached and nothing was found
scoreboard players add $depth trialglow_iris 1
execute if score $depth trialglow_iris = $max_depth trialglow_iris run tag @s remove trialglow_iris.executing
execute if score $depth trialglow_iris = $max_depth trialglow_iris run return fail

# Otherwise, loop this function at the next block
execute if data storage trialglow_iris:data {NextCoordinateChange: "x"} if score $dx trialglow_iris matches 0.. positioned ~1 ~ ~ run return run function trialglow_iris:raycast/loop
execute if data storage trialglow_iris:data {NextCoordinateChange: "x"} if score $dx trialglow_iris matches ..-1 positioned ~-1 ~ ~ run return run function trialglow_iris:raycast/loop
execute if data storage trialglow_iris:data {NextCoordinateChange: "y"} if score $dy trialglow_iris matches 0.. positioned ~ ~1 ~ run return run function trialglow_iris:raycast/loop
execute if data storage trialglow_iris:data {NextCoordinateChange: "y"} if score $dy trialglow_iris matches ..-1 positioned ~ ~-1 ~ run return run function trialglow_iris:raycast/loop
execute if data storage trialglow_iris:data {NextCoordinateChange: "z"} if score $dz trialglow_iris matches 0.. positioned ~ ~ ~1 run return run function trialglow_iris:raycast/loop
execute if data storage trialglow_iris:data {NextCoordinateChange: "z"} if score $dz trialglow_iris matches ..-1 positioned ~ ~ ~-1 run return run function trialglow_iris:raycast/loop
execute if score $depth trialglow_iris < $max_depth trialglow_iris at @s run return run function trialglow_iris:raycast/loop
