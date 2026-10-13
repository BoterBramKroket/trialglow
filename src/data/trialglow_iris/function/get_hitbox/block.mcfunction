#> trialglow_iris:get_hitbox/block
#
# Returns the shape of the current block
#
# @within trialglow_iris:raycast/test_for_block
# @output
#	storage trialglow_iris:data Shape: compound[]
#       A list of cuboids given by two corners in the format {min: [x, y, z], max: [x, y z]}

data remove storage trialglow_iris:data Shape
execute if block ~ ~ ~ minecraft:bell run function trialglow_iris:get_hitbox/block/shape_groups/bell
