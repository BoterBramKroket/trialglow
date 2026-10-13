#> trialglow_iris:get_position/get_rotation
#
# Returns the context rotation as a vector
#
# @context A marker and a rotation
# @within trialglow_iris:get_position/main

execute positioned 0.0 0.0 0.0 run teleport @s ^ ^ ^1000000
data modify storage trialglow_iris:data Pos set from entity @s Pos
execute store result score $dx trialglow_iris run data get storage trialglow_iris:data Pos[0]
execute store result score $dy trialglow_iris run data get storage trialglow_iris:data Pos[1]
execute store result score $dz trialglow_iris run data get storage trialglow_iris:data Pos[2]
