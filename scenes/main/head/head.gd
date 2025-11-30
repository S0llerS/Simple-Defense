class_name Head
extends Node3D

@export var camera : Camera3D

var speed : float = 25.0

var noclip_enabled : bool = false

var original_transform : Transform3D

func _ready() -> void:
	original_transform = global_transform

func _input(event: InputEvent) -> void:
	if !noclip_enabled:
		return
	
	if event is InputEventMouseMotion:
		rotate_y(-event.relative.x * 0.001)
		camera.rotate_x(-event.relative.y * 0.001)
		
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-90), deg_to_rad(90))

func _physics_process(delta: float) -> void:
	# handle
	if Input.is_action_just_pressed("noclip"):
		if !noclip_enabled:
			Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
			noclip_enabled = true
		else:
			Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
			
			global_transform = original_transform
			camera.rotation = Vector3(deg_to_rad(-90), 0, 0)
			
			noclip_enabled = false
	
	# process
	if noclip_enabled:
		var input_dir = Input.get_vector("left", "right", "up", "down")
		var direction = (camera.global_transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
		
		position += direction * 25.0 * delta
