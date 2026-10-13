#> trialglow_iris:get_position/get_coordinates
#
# Gets the coordinates of the executing entity
#
# @context A marker
# @within trialglow_iris:get_position/main
# @within trialglow_iris:get_hitbox/entity

tag @s add trialglow_iris.coordinate_getter

# Get integer coordinates
data modify storage trialglow_iris:data Pos set from entity @s Pos
execute store result score $[x] trialglow_iris store result storage trialglow_iris:args x int -1 run data get storage trialglow_iris:data Pos[0]
execute store result score $[y] trialglow_iris store result storage trialglow_iris:args y int -1 run data get storage trialglow_iris:data Pos[1]
execute store result score $[z] trialglow_iris store result storage trialglow_iris:args z int -1 run data get storage trialglow_iris:data Pos[2]

# Get fractional coordinates
function trialglow_iris:get_position/teleport with storage trialglow_iris:args
data modify storage trialglow_iris:data Pos set from entity @s Pos
execute store result score ${x} trialglow_iris run data get storage trialglow_iris:data Pos[0] 1000000
execute store result score ${y} trialglow_iris run data get storage trialglow_iris:data Pos[1] 1000000
execute store result score ${z} trialglow_iris run data get storage trialglow_iris:data Pos[2] 1000000

# Clean up
data remove storage trialglow_iris:data Pos
