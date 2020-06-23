import numpy as np
import cv2
import time
import os
from imutils import paths
import face_recognition
import pickle



def getName():
	name = raw_input("What's your name?: ")
	return name

def createDir(main_dir, name):
	images = 0
	name_dir = main_dir + name
	if not os.path.exists(name_dir):
		os.makedirs(name_dir)
		new = 1
	else:
		path, dirs, files = next(os.walk(name_dir))
		images = len(files)
		new = 0
		
	return new, images, name_dir
	
def printDatasetResults(n, images, name):
	if(n == 1):
		print("\nUser {} has been created!".format(name))
	else:
		print("\nUser {} already exists, and has {} images saved!".format(name,images))


def userWantsToProceed(n, directory):
	val = raw_input("Do you want to start the detection process? (Y/N): ").split(" ")[0]
	if(val == 'Y' or val == 'y'):
		return True
	else:
		if(n == 1):
			try:
				os.rmdir(directory)
			except OSError as e:
				print("Error: %s : %s" % (directory, e.strerror))
		return False
	
def printStartDetection():
	print("\nDetection process is about to start...just look at the camera!")
	print("If you want to stop the process, just press [ESC]\n")

def showDetections(img):
	cv2.imshow('Frame',img)
	
def stopCondition():
	return (cv2.waitKey(30) & 0xff == 27)
	
def updateDetectionState(images, output):
	print('Image {} saved in {}'.format(str(images), output))
	
	
def detect(main_dir, name, images):
	face_cascade = cv2.CascadeClassifier('haarcascade_frontalface_default.xml')
	start_time = time.time()
	det_time = time.time()
	cap = cv2.VideoCapture(0)
	ret, img = cap.read()

	max_size = np.shape(img)

	while not stopCondition():
		ret, img = cap.read()
		imgc = img.copy()
		gray = cv2.cvtColor(img, cv2.COLOR_BGR2GRAY)
		faces = face_cascade.detectMultiScale(gray, scaleFactor=1.1, minNeighbors=5, minSize=(30, 30), flags=cv2.CASCADE_SCALE_IMAGE)
		for (x,y,w,h) in faces:
			cv2.rectangle(img,(x,y),(x+w,y+h),(255,0,0),2)
			roi_gray = gray[y:y+h, x:x+w]
			roi_color = img[y:y+h, x:x+w]
		showDetections(img)
		if(len(faces) == 1 and (time.time() - det_time) > 0.5):
			output_dir = main_dir + name + "/image-" + str(images) + ".png"
			if(y >= 0 and (y+h) <= max_size[0] and x >= 0 and (x+w) <= max_size[1]):
				crop_img = imgc[y:(y+h), x:(x+w)]
				cv2.imwrite(output_dir,crop_img)
				updateDetectionState(images, output_dir)
				images = images + 1
				det_time = time.time()

	cap.release()
	cv2.destroyAllWindows()
	duration = time.time() - start_time
	return duration

def userWantsToEncode():
	val = raw_input("\nDo you want to start the encoding process? (Y/N): ").split(" ")[0]
	if(val == 'Y' or val == 'y'):
		return True
	else:
		return False

def startEncoding():
	print("\nStarting encoding process...")
	
def updateEncodingState(current, total):
	print("Loading... {}%".format(current*100/total))

def encoding(directory):
	encondings_list = []
	names_list = []
	imagePaths = list(paths.list_images(directory))
	total_photos = len(imagePaths)
	start_time = time.time()
	for (i, imagePath) in enumerate(imagePaths):
		updateEncodingState(i + 1, total_photos)
		image = cv2.imread(imagePath)
		rgb = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
		new_locations = face_recognition.face_locations(rgb, model= 'hog')
		new_encodings = face_recognition.face_encodings(rgb, new_locations)
		name = imagePath.split(os.path.sep)[-2]
		for encoding in new_encodings:
			encondings_list.append(encoding)
			names_list.append(name)
	
	data = {"encodings": encondings_list, "names": names_list}
	f = open("encodings.pickle", "wb")
	f.write(pickle.dumps(data))
	f.close()	
	
	total_users = len(np.unique(names_list))
	duration = time.time() - start_time
	return duration, total_photos, total_users

def printStats(det_time, enc_time, total_images, total_users):
	print('\n{} images from {} users processed!'. format(total_images, total_users))
	m, s = divmod(det_time, 60)
	print('Detection process took {:02d}m{:02d}s'.format(int(m),int(s)))
	m, s = divmod(enc_time, 60)
	print('Encoding  process took {:02d}m{:02d}s'.format(int(m),int(s)))

def printEnd():
	print('\nBye!')


def addUser():	
	dataset_dir = './dataset/'

	user = getName()
	new, images, user_dir = createDir(dataset_dir, user)
	printDatasetResults(new, images, user)

	enc_duration = det_duration = photos = users = 0
	
	if(userWantsToProceed(new, user_dir)):
		printStartDetection()
		det_duration = detect(dataset_dir, user, images)
	if(userWantsToEncode()):
		startEncoding()
		enc_duration, photos, users = encoding(dataset_dir)

	printStats(det_duration, enc_duration, photos, users)
	printEnd()

#addUser()
