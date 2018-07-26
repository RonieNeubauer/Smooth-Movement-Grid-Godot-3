extends KinematicBody2D

const MAX_SPEED = 2 # 1,2,4,8
var direct = {"N": Vector2(0,-1), "S": Vector2(0,1), "W": Vector2(-1,0), "O": Vector2(1,0)}
var step = 0
var move = "stop"
var play_pos = Vector2(0,0)

func _ready():
	self.position = Vector2(get_node("..").cell_size, get_node("..").cell_size) # To Centralize get_node("..").cell_size / 2
	set_physics_process(true)

func step_move(key, dir, speed):
	if(Input.is_action_pressed(key) and move == "stop") or move == dir:
		move = dir
		step = step + 1
		play_pos = direct[dir]
		if step == get_node("..").cell_size / speed:
			move = "stop";
			step = 0
		move_and_collide(play_pos.normalized() * speed)
	
func _physics_process(delta):
	step_move("ui_up", "N", MAX_SPEED)
	step_move("ui_down", "S", MAX_SPEED)
	step_move("ui_left", "W", MAX_SPEED)
	step_move("ui_right", "O", MAX_SPEED)
	