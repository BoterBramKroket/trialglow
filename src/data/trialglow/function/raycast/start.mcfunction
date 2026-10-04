advancement revoke @s only trialglow:ring_a_bell
scoreboard objectives add raycast dummy
# Player interaction range is 4.5 blocks (= 45 * 0.1 intervals)
scoreboard players set distance raycast 50
execute anchored eyes run function trialglow:raycast/loop