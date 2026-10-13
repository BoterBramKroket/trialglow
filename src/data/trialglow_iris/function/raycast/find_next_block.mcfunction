#> trialglow_iris:raycast/find_next_block
#
# Find the coordinates of the next tile that should be traversed by the ray
#
# @within trialglow_iris:raycast/loop
# @writes
#   scores $[x] $[y] $[z] trialglow_iris
#       The new position
#   scores $last_[x] $last_[y] $last_[z] trialglow_iris
#       The previous position
# @output
#   Result: The distance to the next block
#   Success: 1

# Save previous coordinates
scoreboard players operation $last_[x] trialglow_iris = $[x] trialglow_iris
scoreboard players operation $last_[y] trialglow_iris = $[y] trialglow_iris
scoreboard players operation $last_[z] trialglow_iris = $[z] trialglow_iris

# See what distance the ray needs to travel to hit another tile with a different x coordinate
execute if score $dx trialglow_iris matches 0.. run scoreboard players set $to_next_x trialglow_iris 1000000000
execute if score $dx trialglow_iris matches ..-1 run scoreboard players set $to_next_x trialglow_iris 0
scoreboard players operation ${x}*1000 trialglow_iris = ${x} trialglow_iris
scoreboard players operation ${x}*1000 trialglow_iris *= $1000 trialglow_iris
scoreboard players operation $to_next_x trialglow_iris -= ${x}*1000 trialglow_iris
scoreboard players operation $to_next_x trialglow_iris /= $dx trialglow_iris

# See what distance the ray needs to travel to hit another tile with a different y coordinate
execute if score $dy trialglow_iris matches 0.. run scoreboard players set $to_next_y trialglow_iris 1000000000
execute if score $dy trialglow_iris matches ..-1 run scoreboard players set $to_next_y trialglow_iris 0
scoreboard players operation ${y}*1000 trialglow_iris = ${y} trialglow_iris
scoreboard players operation ${y}*1000 trialglow_iris *= $1000 trialglow_iris
scoreboard players operation $to_next_y trialglow_iris -= ${y}*1000 trialglow_iris
scoreboard players operation $to_next_y trialglow_iris /= $dy trialglow_iris

# See what distance the ray needs to travel to hit another tile with a different z coordinate
execute if score $dz trialglow_iris matches 0.. run scoreboard players set $to_next_z trialglow_iris 1000000000
execute if score $dz trialglow_iris matches ..-1 run scoreboard players set $to_next_z trialglow_iris 0
scoreboard players operation ${z}*1000 trialglow_iris = ${z} trialglow_iris
scoreboard players operation ${z}*1000 trialglow_iris *= $1000 trialglow_iris
scoreboard players operation $to_next_z trialglow_iris -= ${z}*1000 trialglow_iris
scoreboard players operation $to_next_z trialglow_iris /= $dz trialglow_iris

# Determine which distance is the shortest
execute if score $to_next_x trialglow_iris <= $to_next_y trialglow_iris if score $to_next_x trialglow_iris <= $to_next_z trialglow_iris run data merge storage trialglow_iris:data {NextCoordinateChange: "x"}
execute if score $to_next_y trialglow_iris <= $to_next_x trialglow_iris if score $to_next_y trialglow_iris <= $to_next_z trialglow_iris run data merge storage trialglow_iris:data {NextCoordinateChange: "y"}
execute if score $to_next_z trialglow_iris <= $to_next_x trialglow_iris if score $to_next_z trialglow_iris <= $to_next_y trialglow_iris run data merge storage trialglow_iris:data {NextCoordinateChange: "z"}

# Calculate the new coordinates when the ray reaches the next tile
execute if data storage trialglow_iris:data {NextCoordinateChange: "x"} run data modify storage trialglow_iris:args {} merge value {a: "x", b: "y", c: "z"}
execute if data storage trialglow_iris:data {NextCoordinateChange: "y"} run data modify storage trialglow_iris:args {} merge value {a: "y", b: "z", c: "x"}
execute if data storage trialglow_iris:data {NextCoordinateChange: "z"} run data modify storage trialglow_iris:args {} merge value {a: "z", b: "x", c: "y"}
function trialglow_iris:raycast/macro_functions/find_next_block_aux with storage trialglow_iris:args

# Return the added distance
return run scoreboard players operation $to_next_block trialglow_iris *= $1000 trialglow_iris
