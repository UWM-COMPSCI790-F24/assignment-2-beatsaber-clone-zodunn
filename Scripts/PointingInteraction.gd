extends XRController3D

var line_visible = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var start = global_position + (-global_basis.z * 0.1)
	var end = (-global_basis.z * 1) + start
	
	$"LineRenderer".points[0] = start
	$"LineRenderer".points[1] = end


func _on_button_pressed(name: String) -> void:
	if name == "ax_button":
		$"LineRenderer".visible = !line_visible
		line_visible = !line_visible


func _on_area_3d_area_entered(area: Area3D) -> void:
	if line_visible:
		var box = area.get_parent()
		if box.color == "Red" and self.name == "RightPointingController":
			$"DestroySound".play()
			box.free()
		elif box.color == "Blue" and self.name == "LeftPointingController":
			$"DestroySound".play()
			box.free()
