extends Node2D

var cell_size = 64 # 16, 32, 64

func _draw():
	for y  in range(0,600, cell_size):
		for x in range(0, 1024, cell_size):
			draw_line(Vector2(x, y), Vector2(x, y + cell_size), Color(0,1,0), 1.0)
			draw_line(Vector2(x, y), Vector2(x + cell_size, y), Color(0,1,0), 1.0)