#> trialglow_iris:setup/storage
#
# Sets up storage for trialglow_iris
#
# @within trialglow_iris:setup/load

data merge storage trialglow_iris:data {is_setup: 1b}

# Set default settings
data merge storage trialglow_iris:settings {\
    TargetEntities: false,\
    MaxRecursionDepth: 16,\
    Blacklist: "#trialglow_iris:shape_groups/air",\
    Whitelist: "minecraft:bell"\
}
