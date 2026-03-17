extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var v2=Vector2()
var over = false
var object_parent=null
var point = 0
var v_CD = Vector2()
var dr1 = 100
var dr2 = 100
var dr3 = 100
var kurangin = 0.5
var tracktor = false
var jarakDC = 100
var tigabone = true
var R_virtual = 0.0
var pos_keni = Vector2(0,0)
# Called when the node enters the scene tree for the first time.
func _ready():
	
	#var c=$point3.get_position()
	#var d=$point4.get_position()
	#v_CD = c-d
	
	#var a1=$point.get_position()
	#var b1=$point3.get_position()
	#var jarak =a1.distance_to(b1)
	#v2=b1-a1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	pass
	
func get_intersections2(x1,y1,r1,x2,y2,r2):
	var centerdx = x1-x2
	var centerdy = y1-y2
	
	var R =sqrt(centerdx*centerdx+centerdy*centerdy)
	
	if R >= r1+r2:
		over = true
		#print("over")
		return null
	if R <= abs(r1-r2):
		over = false
		return null
	if R==0 and r1 == r2:
		over = false	
		return null
		
	else:
		over = false
		var R2 = pow(R,2)
		var R4 = R2*R2
		var r1k=pow(r1,2)
		var r2k=pow(r2,2)
		var r2r2 = (r1k -r2k)
		var a = r2r2/(2*R2)
		var s = 2*(r1k +r2k)/R2
		var z = ((r2r2*r2r2)/R4)
		var c = sqrt(s-z-1)
		
		var fx = (x1+x2)/2+a*(x2-x1)
		var gx = c*(y2-y1)/2
		var fy =(y1+y2)/2+a*(y2-y1)
		var gy =c*(x1-x2)/2
		
		
		var x = fx+gx
		var y = fy+gy
		
		var xb = fx-gx
		var yb = fy-gy

		var val=[Vector2(x,y),Vector2(xb,yb)]
	
		return val
		
#var pos=get_intersections(a.x,a.y,diameterA,b.x,b.y,diameterB)
func get_intersections(x0,y0,r0,x1,y1,r1):
	#var x=(x1-x0)
	#var a=pow(x,2)
	#var d=sqrt(pow((xb-xa),2)+pow((yb-ya),2))
	var xs=x1-x0
	var ys=y1-y0
	var d=sqrt(pow(xs,2)+pow(ys,2))

	if d >= r0+r1:
		over = true
		#print("over")
		return null
	if d <= abs(r0-r1):
		over = false
		return null
	if d==0 and r0 == r1:
		over = false	
		return null
	else:
		over = false
		var rx2 = pow(r0,2)
		var a = (rx2-pow(r1,2)+pow(d,2))/(2*d) # GET x
		var h = sqrt(rx2-pow(a,2)) # GET y
	
				#GET 2 POSITION OF INTERCECTION
		var xsd=xs*1/d
		var ysd=ys*1/d
		
		var xl=x0+a*xsd
		var yl=y0+a*ysd
		
		var x3=xl+h*ysd
		var y3=yl-h*xsd
		var x3F = x0+(a*xs/d)+(h*ys/d)
		
		#a=3 kali ok ok1
		#h=2 kali ok ok1
		#d=2 kali ok ok1
		#1/d = 2 kali ok ok2
		
		
		#var x3F =(x0+((rx2-pow(r1,2)+pow((sqrt(pow(xs,2)+pow(ys,2))),2)/(2*(sqrt(pow(xs,2)+pow(ys,2)))))*(xs/(sqrt(pow(xs,2)+pow(ys,2))))+(sqrt(rx2-pow(a,2)))*(ys/(sqrt(pow(xs,2)+pow(ys,2)))
		#print("y  "+var2str(x3))
		var x4=xl-h*ysd
		var y4=yl+h*xsd
		var val=[Vector2(x3,y3),Vector2(x4,y4)] # RETURN 2 POINT
		#get_node("Label").set_text(var2str(x3))
		return val
	
func _draw():
	var a=$point.get_position()
	var m=$point.get_rect().size/2
	var diameterA = dr1
	#draw_circle(a+m,diameterA,Color(1,0,0,0.5))
	
	
	var b=$point2.get_position()
	var c=$point3.get_position()
	
	var d=$point4.get_position()
	var diameterB = dr2
	
	#draw_circle(b+m,diameterB,Color(0,1,0,0.5))
	
	var diameterC = dr3
	#draw_circle(c+m,diameterC,Color(1,0,1,0.5))
	
	var total = dr1+dr2+dr3
	
	var jarakAB =a.distance_to(b)
	var ab_p = (200-jarakAB)/200
	
	var jarakAC =a.distance_to(c)
	kurangin = (float(total-(dr3))/total)
	#print(var2str(kurangin))
	var posmid = a+((c-a)/2)
	
	
	#var jarakAB =100
	#print(jarakAB)
	#draw_circle(a+m,jarakAB,Color(1,1,1,0.8))
	
	var jarakBC =200

	#print(jarakBC)
	#draw_circle(a+m,jarakAC*kurangin,Color(1,0.1,0.2,0.5))
	#draw_circle(c+m,dr3,Color(1,1,0.2,0.2))
	var posAC= c-a
	
	
	var v =a.direction_to(b)
	var jarak_mid = jarakAC/2
	if jarak_mid <=1:
		jarak_mid = 1
	var posB_new = jarak_mid *(posAC.normalized())
	
	#var kurangin = float(jarakAC-dr3)/jarakAC
	#$point2.set_position(posB_new+a)
	#var jarakAC =300
	#draw_circle(c+m,jarak_mid,Color(0.5,1,1,0.4))
	#draw_circle(a+m,diameterA,Color(0.5,0.2,1,0.8))
	#draw_circle(b+m,diameterB,Color(1,0.2,1,0.8))
	
	#draw_circle(c+m,jarakAC*kurangin,Color(0.5,0.2,1,0.8))
	#draw_line(a+m,b+m,Color(1,0,1,1),3)
	draw_line(a+m,c+m,Color(1,1,1,1),1)
	draw_line(b+m,c+m,Color(1,0,0,1),3) #red
	
	
	
	var x = (dr3-(dr1+dr2))*1.0/(0-(dr1+dr2+dr3))  # work
	
	
	var p = (19.7-(dr1+dr2))*1.0/(101.2-(dr1+dr2+dr3))
	var add = (dr1+dr2)-(p*(dr1+dr2+dr3))
	
	if tracktor:
		R_virtual = (jarakAC*x)+dr3 # work
	else:
		
		R_virtual = ((dr1+dr2)*1.0/total)*jarakAC
		#R_virtual = (jarakAC*x)+dr3
		#R_virtual = kurangin*jarakAC
	#if (dr1+dr2) < R_virtual:
		#R_virtual = dr3
	#if jarakAC <= diameterA:
		#R_virtual = diameterA
	#draw_circle(a+m,jarakAB,Color(0.5,1,1,0.4))
	#var R_virtual = jarakAC*0.8
	$LineEdit4.text = var2str(jarakAB)

	#draw_circle(a+m,R_virtual,Color(0.5,0.2,1,0.8))
	
	
	
	#var jarakAB =a.distance_to(b)
	#var v_cd = Vector2()
	#print(jarakAB)
	#var c_to_d = c+(v2.normalized()*100)
	#v2=c-a
	#var a_to_c=a+(v2.normalized()*200)
	#draw_circle(b+m,100,Color(1,0.2,1.2,0.2))
	
	#$point4.set_position(c_to_d) # parent move
	#$point3.set_position(a_to_c)
	#draw_line(a+m,a_to_c+m,Color(1,0,1,1),3)
	#draw_line(d+m,a_to_c+m,Color(0,1,1,1),3)
	#draw_circle(a,R_virtual,Color(1,1,0,0.5))
	#draw_circle(b,240,Color(0,1,1,0))
	if tigabone:
		
		var pos2=get_intersections(a.x,a.y,R_virtual,c.x,c.y,diameterC)
		#var pos2=get_intersections(a.x,a.y,jarakAC,c.x,c.y,diameterC)
		#var pos2=get_intersections(a.x,a.y,diameterA,b.x,b.y,diameterB)
		
		if not pos2 == null:
			var flip = 1
			if tracktor:
				flip = 0
			var vec_haft = (pos2[flip]-a)/2.0
			var pos_mid = a+vec_haft
			
			var sud = c.angle_to_point(a)
			var sud2 = c.angle_to_point(pos2[flip])
			$point4.set_position(pos_mid) 
			$point2.set_position(pos2[flip]) #asli
			$LineEdit5.text  =var2str(rad2deg(sud-sud2))
			#pos_keni=pos2[1]
			#draw_circle(pos_keni,diameterB,Color(1,1,0,0.3))
			#draw_line(c+m,pos2[1]+m,Color(1,1,0,1),3)
			
		
		#b=$point2.get_position()
		
		var vc = b.direction_to(c)
		var vac = a.direction_to(c)
		var over2= false
		if over:
			var vector_ab=c-b
			var jarakAC_t =a.distance_to(b)
			over2 = true
			var pos_b=a+(vac*jarakAC_t)
			$point2.set_position(pos_b)
			var pos_c=pos_b+(vc*dr3)
			#var arah2 = arah+(vc*dr3)
			draw_line(pos_b+m,pos_c+m,Color(0,1,0,0.2),3)
			#draw_line(arah+m,arah2+m,Color(1,1,0,1),5)
		
	
	#var pos=get_intersections(pos_keni.x,pos_keni.y,diameterB,c.x,c.y,diameterC)
	var pos=get_intersections(a.x,a.y,diameterA,b.x,b.y,diameterB)
	if over:
		#var vector_ab=b-a
		var arah=a+(v*dr1)
		
		var arah2 = arah+(v*dr2)
		draw_line(a+m,arah+m,Color(0,0,1,1),3)
		draw_line(arah+m,arah2+m,Color(1,1,0,1),3)
		
	if not pos == null:	
		#jarakDC = c.distance_to(pos[1])
		pos_keni =pos[1]
		#draw_circle(pos[0],diameterB,Color(1,1,0,0.3))
		#draw_line(c+m,b+m,Color(1,1,0,1),3)
		#draw_line(pos_keni+m,pos[point],Color(1,1,0,1),3)
		draw_line(a+m,pos[0]+m,Color(1,1,0,1),3)
		draw_line(pos[0]+m,b+m,Color(0,0,1,1),3)
		
		
		#draw_circle(c+m,diameterC,Color(0.04,0.1,1,0.5))
		
		#draw_circle(b+m,diameterB,Color(0.7,0.1,0,0.5))
		#draw_circle(pos[point]+m,diameterB,Color(0.3,0.3,0.9,0.6))
		#draw_line(pos[point]+m,jarakAB,Color(0,3,1,0.1),3)
		#draw_line(c+m,pos2[point],Color(1,1,0,1),3)
		
	#draw_line(a+m,c+m,Color(0,0,1,1),3)
	#if not over2:
		#draw_line(b+m,c+m,Color(1,1,0,1),3)
		
func baru():
	update()



func _on_CheckBox_toggled(v):
	
	if v:
		point = 1
	else:
		point = 0
	
	update()

func _on_LineEdit_text_changed(v):
	
	dr1 = str2var(v)
	update()

func _on_LineEdit2_text_changed(v):
	dr2 = str2var(v)
	update()


func _on_LineEdit3_text_changed(v):
	dr3 = str2var(v)
	update()


func _on_LineEdit4_text_changed(v):
	kurangin =str2var(v)
	update()


func _on_HSlider_value_changed(value):
	kurangin = value/100
	update()


func _on_CheckBox2_pressed():
	pass # Replace with function body.


func _on_CheckBox2_toggled(button_pressed):
	tracktor = button_pressed
	update()
