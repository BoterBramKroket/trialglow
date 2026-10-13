#> trialglow_iris:raycast/test_for_block
#
# @within trialglow_iris:raycast/loop
# @output
#   Result: 0
#   Success: 1 if a block was hit, 0 otherwise

# Check if the current block is loaded
execute store success score $loaded trialglow_iris if blocks ~ ~ ~ ~ ~ ~ ~ ~ ~ masked
execute if score $loaded trialglow_iris matches 0 run return fail

# Check if the current block is blacklisted, or explicitly not whitelisted
execute if data storage trialglow_iris:settings Whitelist run data modify storage trialglow_iris:args id set from storage trialglow_iris:settings Whitelist
execute if data storage trialglow_iris:settings Whitelist store success score $is_whitelisted trialglow_iris run function trialglow_iris:raycast/macro_functions/block_id_test with storage trialglow_iris:args
execute if data storage trialglow_iris:settings Whitelist unless score $is_whitelisted trialglow_iris matches 1 run return fail

# See if the block is hit
function trialglow_iris:get_hitbox/block
execute unless data storage trialglow_iris:data Shape[0] run return fail
return run function trialglow_iris:raycast/check_intersection/loop
