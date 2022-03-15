extends KinematicBody
 
var path = []
var path_ind = 0
const move_speed = 80
onready var nav = get_parent()

export var team = 0

func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	look_at( Vector3(target_pos.x, 0.2, target_pos.z) , Vector3.UP)
	rotate(Vector3.UP, -90)

	path_ind = 0
 
func _physics_process(delta):
	if path_ind < path.size():
		var move_vec = (path[path_ind] - global_transform.origin)
		if move_vec.length() < 0.1:
			path_ind += 1
		else:
			move_and_slide(move_vec.normalized() * move_speed * delta, Vector3(0, 1, 0))
 
func select():
	$SelectionRing.show()
 
func deselect():
	$SelectionRing.hide()
