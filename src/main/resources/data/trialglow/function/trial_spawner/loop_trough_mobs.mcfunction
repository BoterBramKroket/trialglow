# Loop trough trial spawners mobs (using trial_spawner storage) and calls glow_mob function on each mob while parsing its UUID
execute unless data storage trialglow:trial_spawner mobs[0] run return 0
data modify storage trialglow:trial_spawner args.uuid set from storage trialglow:trial_spawner mobs[0]
function trialglow:trial_spawner/glow_mob with storage trialglow:trial_spawner args
data remove storage trialglow:trial_spawner mobs[0]
function trialglow:trial_spawner/loop_trough_mobs