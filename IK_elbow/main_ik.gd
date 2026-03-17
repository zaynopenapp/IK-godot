extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func solve_ik(base: Vector2, target: Vector2, L1: float, L2: float) -> Array:
	var dir = target - base
	var d = dir.length()

	var total = L1 + L2

	# 👉 STRETCH jika target terlalu jauh
	if d > total:
		var scale = d / total
		L1 *= scale
		L2 *= scale

	# hindari nol
	d = max(d, 0.0001)

	var a = (L1 * L1 - L2 * L2 + d * d) / (2.0 * d)
	var h = sqrt(max(L1 * L1 - a * a, 0.0))

	var p = base + dir.normalized() * a
	var perp = Vector2(-dir.y, dir.x).normalized() * h

	var elbow = p + perp

	return [elbow, target]
	
func _draw():
	var a=$point.get_position()
	var m=$point.get_rect().size/2
	var b=$point2.get_position()
	var c=$point3.get_position()
	var L1 = 120
	var L2 = 100
	var pos = solve_ik(a,c,L1,L2)
	$point2.set_position(pos[0]) # parent move
	draw_line(a+m,pos[0]+m,Color(0,1,1,1),3)
	draw_line(pos[0]+m,pos[1]+m,Color(1,1,0,1),3) #red
	

func baru():
	update()
