extends Node2D

onready var box = $Player
onready var gg = $gg
onready var ray = $Player/RayCast2D
onready var ggrope = $Rope

var thingtostick = null

func _process(delta):
	if thingtostick:
		ggrope.start_pos = thingtostick.global_position
		
	gg.global_position = box.global_position
	ray.look_at(get_global_mouse_position())
	
	if Input.is_action_pressed("ui_touch"):
		if ray.is_colliding():
			thingtostick = ray.get_collider()
			var distancelength = ray.get_collision_point().distance_to(box.global_position)
			
			gg.length = distancelength
			gg.global_rotation_degrees = ray.global_rotation_degrees - 90
			
			gg.node_b = thingtostick.get_path()
			box.linear_velocity.y -= 4
			
	if Input.is_action_pressed("ui_touch"):
		ggrope.visible = true
		ggrope.end_pos = box.global_position
	
	if not Input.is_action_pressed("ui_touch"):
		ggrope.visible = false
		thingtostick = null
		gg.node_b = gg.node_a
