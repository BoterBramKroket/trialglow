#> trialglow_iris:raycast/check_intersection/loop
#
# Tests for ray-box intersections with all axis-aligned bounding boxes of a hitbox
#
# @within trialglow_iris:raycast/test_for_block
# @within trialglow_iris:raycast/test_for_entity
# @within trialglow_iris:raycast/check_intersection/loop
# @reads
#   storage trialglow_iris:data Shape
#       A list of axis-aligned bounding boxes of the form {min: [x, y, z], max: [x, y, z]}
# @output
#   Success: 1 if a box is hit, 0 otherwise
#   Result: the distance to the first box that is hit

# Test for intersection with a single bounding box
data modify storage trialglow_iris:data Box set from storage trialglow_iris:data Shape[-1]
data remove storage trialglow_iris:data Shape[-1]
execute store success score $is_hit trialglow_iris store result score $distance trialglow_iris run function trialglow_iris:raycast/check_intersection/ray_box

# If this box is indeed hit before any other this far, remember the targeted box and the targeted face
execute if score $is_hit trialglow_iris matches 1 if score $distance trialglow_iris >= $min_distance trialglow_iris run scoreboard players set $is_hit trialglow_iris 0
execute if score $is_hit trialglow_iris matches 1 run data modify storage trialglow_iris:data TargetedBox set from storage trialglow_iris:data Box
execute if score $is_hit trialglow_iris matches 1 if score $hits_x_face trialglow_iris matches 1 if score $to_aabb trialglow_iris = $to_x_face trialglow_iris run data modify storage trialglow_iris:data TargetedFace set from storage trialglow_iris:data Faces[0]
execute if score $is_hit trialglow_iris matches 1 if score $hits_y_face trialglow_iris matches 1 if score $to_aabb trialglow_iris = $to_y_face trialglow_iris run data modify storage trialglow_iris:data TargetedFace set from storage trialglow_iris:data Faces[1]
execute if score $is_hit trialglow_iris matches 1 if score $hits_z_face trialglow_iris matches 1 if score $to_aabb trialglow_iris = $to_z_face trialglow_iris run data modify storage trialglow_iris:data TargetedFace set from storage trialglow_iris:data Faces[2]
execute if score $is_hit trialglow_iris matches 1 run scoreboard players operation $min_distance trialglow_iris = $distance trialglow_iris

# Loop this function until all boxes have been analyzed
execute if data storage trialglow_iris:data Shape[-1] run return run function trialglow_iris:raycast/check_intersection/loop
execute if score $min_distance trialglow_iris matches 2147483647 run return fail
scoreboard players operation $min_distance trialglow_iris *= $1000 trialglow_iris
return run scoreboard players get $min_distance trialglow_iris
