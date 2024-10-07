extends WorldEnvironment

var box = preload("res://SceneInstances/MovingCube.tscn")
var rng = RandomNumberGenerator.new()
var time_interval: float = 1.5
var min_time: float = 0.5
var max_time: float = 2.0
var time_elaspsed: float = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	time_elaspsed += delta
	if time_elaspsed > time_interval:
		time_elaspsed = 0
		var box_instance = box.instantiate()
		add_child(box_instance)
		time_interval = rng.randf_range(min_time, max_time)
