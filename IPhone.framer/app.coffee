# Import file "iOS 7 Home Screen"
sketch = Framer.Importer.load("imported/iOS%207%20Home%20Screen@1x", scale: 1)

Oval1A.opacity = 0
Oval2A.opacity = 0
Oval3A.opacity = 0
Oval4A.opacity = 0
Repeat.opacity = 0
delete_1.opacity = 0


# Show first artboard
flow =new FlowComponent
flow.showNext(screenA)
flow.header = Status_Bar

#IP Adresse ändern
socket = new WebSocket('ws://172.20.15.8:8080')
socket.onmessage = (zeichen) ->
	fillDot(zeichen.data)

# Switch to next screen on tap
screenA.onPanLeft ->
	flow.showNext(screenB)


dots = [Oval1A, Oval2A, Oval3A, Oval4A]
eingabe = ''

fillDot = (buttonwert) ->
	eingabe += buttonwert
	if eingabe.length == 1
		delete_1.opacity = 100
	if eingabe.length == 4
		Repeat.opacity = 100
		Enter_Passcode.opacity = 0
		Oval1A.opacity = 0
		Oval2A.opacity = 0
		Oval3A.opacity = 0
		Oval4A.opacity = 0
		if eingabe == '1234'
				flow.showNext(Right)
			else
				#Fehler
				eingabe = ''
	else 
		dots[eingabe.length - 1].opacity = 100

# enter numer one 
Button_1.onTap ->
	fillDot('1')
Button_2.onTap ->
	fillDot('2')
Button_3.onTap ->
	fillDot('3')
Button_4.onTap ->
	fillDot('4')
Button_5.onTap ->
	fillDot('5')
Button_6.onTap ->
	fillDot('6')
Button_7.onTap ->
	fillDot('7')
Button_8.onTap ->
	fillDot('8')
Button_9.onTap ->
	fillDot('9')
Button_0.onTap ->
	fillDot('0')

#delete last dot
delete_1.onTap ->
	eingabe = eingabe.substring(0, eingabe.length - 1)
	dots[eingabe.length].opacity = 0
	
###delete last dot
delete_1.onTap ->
	eingabe=eingabe.splice(-1,1)
###


# Return to first screen when clicking cancel	
Cancel_1.onTap ->
	flow.showPrevious()	
	Oval1A.opacity = 0
	Oval2A.opacity = 0
	Oval3A.opacity = 0
	Oval4A.opacity = 0
	eingabe = ''

# Return to first screen when clicking back
back.onTap ->
	flow.showOverlayLeft(screenA)	
	Repeat.opacity = 0
	Cancel_1.opacity = 100
	delete_1.opacity = 0
	Enter_Passcode.opacity = 100
	Oval1A.opacity = 0
	Oval2A.opacity = 0
	Oval3A.opacity = 0
	Oval4A.opacity = 0
	eingabe = ''