#> trialglow_iris:setup/load
#
# Defines scoreboard objectives and sets up storage if it has not already been done
#
# @handles #minecraft:load

# IDE storage definitions for Spyglass
#define storage trialglow_iris:data
#define storage trialglow_iris:args
#define storage trialglow_iris:settings
#define storage trialglow_iris:output

# Setup scoreboard and storage
function trialglow_iris:setup/scoreboard
execute unless data storage trialglow_iris:data is_setup run function trialglow_iris:setup/storage
