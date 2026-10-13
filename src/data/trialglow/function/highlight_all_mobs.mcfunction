# Limit=1 to improve performance by halting search when unique entity is found
$effect give @e[nbt={UUID:$(uuid)},limit=1] glowing 30 0 true
data remove storage trialglow:trial_spawner current_mobs[0]
execute if data storage trialglow:trial_spawner current_mobs[0] run data modify storage trialglow:trial_spawner mob.uuid set from storage trialglow:trial_spawner current_mobs[0]
execute if data storage trialglow:trial_spawner current_mobs[0] run function trialglow:highlight_all_mobs with storage trialglow:trial_spawner mob