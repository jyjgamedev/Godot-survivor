extends Camera2D

var target_position = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	#set this camera to current camera
	make_current()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	acquire_target()
	global_position = global_position.lerp(target_position, 1.0-exp(-delta*10))
	

func acquire_target():
	#from current tree find "player" group
	var player_nodes = get_tree().get_nodes_in_group("player")
	if player_nodes.size()>0:
		#pick the first node from "player" group
		var player = player_nodes[0] as Node2D # as Type let it the type to 
		#since we do not know exact type, intellicence does not work yet.
		# global_position = player.global_position
		target_position= player.global_position
