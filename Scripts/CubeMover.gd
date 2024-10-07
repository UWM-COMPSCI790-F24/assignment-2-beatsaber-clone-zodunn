extends CSGBox3D

@export var moveSpeed: float = 4 # meters / second
var x_max: float = 1.5
var x_min: float = -1.5
var y_max: float = 1.5
var y_min: float = 0.15
var rng = RandomNumberGenerator.new()
@export var color: String

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var x = rng.randf_range(x_min, x_max)
	var y = rng.randf_range(y_min, y_max)
	position.x = x
	position.y = y
	var color_number = rng.randf_range(0, 1)
	if color_number <= 0.5:
		color = "Blue"
		material_override = ResourceLoader.load("res://Materials/blue_laser.tres", "StandardMaterial3D", 1)
	elif color_number > 0.5:
		color = "Red"
		material_override = ResourceLoader.load("res://Materials/red_laser.tres", "StandardMaterial3D", 1)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if position.z < 2:
		position += get_global_transform().basis.z * moveSpeed * delta
	else:
		free()
