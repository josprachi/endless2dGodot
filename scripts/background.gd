extends ParallaxBackground


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_parent().gameOver== false:
		scroll_base_offset+= Vector2(-15,0)
	else:
		scroll_base_offset= Vector2(0,0)	
	
#	pass
