import imutils
from imutils.video import VideoStream
from imutils.video import FPS
import face_recognition
import pickle
import time
import cv2
import numpy as np
import collections as cl
import new_user

def getUsersCount(data_pk):
	return cl.Counter(data_pk["names"])

def getEncodings(img,detector):
	img_gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
	faces = detector.detectMultiScale(img_gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30), flags=cv2.CASCADE_SCALE_IMAGE)
	boxes = [(y, x + w, y + h, x) for (x, y, w, h) in faces]
	
	img_rgb = cv2.cvtColor(img, cv2.COLOR_BGR2RGB)
	encodings = face_recognition.face_encodings(img_rgb, boxes)
	
	return encodings, boxes
	
def recognizeFaces(encodings, numOfPhotos,data):
	names = []
	threshold = 0.5
	name = "Unknown"
	for encoding in encodings:
		matches = face_recognition.compare_faces(data["encodings"], encoding)
		if True in matches:
			matchedIdxs = [i for (i, b) in enumerate(matches) if b]
			counts = {}
			for i in matchedIdxs:
				name = data["names"][i]
				counts[name] = counts.get(name, 0) + 1
			name = max(counts, key=counts.get)
			if(counts[name] <= threshold*numOfPhotos[name]):
				name = "Unknown"
		names.append(name)
	return names
		
def chooseUser(names_list):
	if(len(names_list) > 0):
		return names_list[0]
	else:
		return None
		
def drawFrame(boxes, names, name2display, clean_frame):
	if names is not None:
		for ((top, right, bottom, left), name) in zip(boxes, names):
			if(name is name2display):
				cv2.rectangle(clean_frame, (left, top), (right, bottom),
					(0, 255, 0), 2)
				y = top - 15 if top - 15 > 15 else top + 15
				cv2.putText(clean_frame, name, (left, y), cv2.FONT_HERSHEY_SIMPLEX,
					0.75, (0, 255, 0), 2)
	return clean_frame
		
def displayFrame(frame):
	cv2.imshow("Frame", frame)

def stopCondition():
	return (cv2.waitKey(1) & 0xff == 27)

def printStats():
	fps.stop()
	print("Recognition process took {:.2f}".format(fps.elapsed()))
	print("Processed and Displayed at {:.2f} FPS".format(fps.fps()))

def endFacialRecognition():
	cv2.destroyAllWindows()
	vs.stop()

def userDetected(user, time_threshold):
	try:
		if(user is not userDetected.last_user):
			userDetected.start_time = time.time()
			userDetected.last_user = user
		else:
			if(time.time() - userDetected.start_time >= time_threshold and user is not None):
				return True

	except AttributeError:
		userDetected.start_time = time.time()
		userDetected.last_user = user
		
	return False
	
def getValidationFromUser(name):
	val = raw_input("\nAre you {}? (Y/N)".format(name)).split(" ")[0]
	if(val == 'Y' or val == 'y'):
		return True
	else:
		return False
		
def userWantsToCreateAccount():
	val = raw_input("\nUser unknown. Do you want to be added to the system? (Y/N): ").split(" ")[0]
	if(val == 'Y' or val == 'y'):
		return True
	else:
		return False
	
def faceRecognition():
	print("\nStarting facial recognition process!")
	data = pickle.loads(open('encodings.pickle', "rb").read())
	detector = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
	vs = VideoStream(src=0).start()
	# vs = VideoStream(usePiCamera=True).start()
	time.sleep(1.0)
	fps = FPS().start()
	users_cnt = getUsersCount(data)
	
	while True:	
		frame = imutils.resize(vs.read(), width=500)
		encodings, boxes = getEncodings(frame, detector)
		names = recognizeFaces(encodings, users_cnt,data)
		user = chooseUser(names)
		frame = drawFrame(boxes, names, user, frame)
		displayFrame(frame)
		user_det = userDetected(user,3)
		if (stopCondition() or user_det):
			break
		fps.update()
	cv2.destroyAllWindows()
	vs.stop()
	return user

while True:
	rec = faceRecognition()
	if(rec is "Unknown"):
		if(userWantsToCreateAccount()):
			new_user.addUser()
			break
	else:
		if(getValidationFromUser(rec)):
			print("Setpoint updated with success!\n")
			break
		

