extends Node2D

const CUBE = preload("res://Scenes/Cubes.tscn")
const CUBE_WIDTH = 20
var spawn_position = global_position
onready var player = get_parent().get_node("Player")

func _process(delta):
	#if spawn_position.distance_to(player.position) < 1000:
	if Input.is_action_just_pressed("ui_touch"):
		spawn()
		
func spawn():
	var new_cube = CUBE.instance()
	add_child(new_cube)
	new_cube.global_position.x = spawn_position.x
	new_cube.global_position.y = spawn_position.y
	
	randomize()
	
	spawn_position.x += rand_range( spawn_position.x+CUBE_WIDTH, player.position.x+ spawn_position.x)
	spawn_position.y += player.position.y
