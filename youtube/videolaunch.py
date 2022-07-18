import cv2
video_path = 'C:/Users/DELL/PycharmProjects/pythonProject1/videolaunchtime/videos/Video_launch.mp4'
ref1 = 'C:/Users/DELL/PycharmProjects/pythonProject1/videolaunchtime/reference/reference.jpg'
ref2 = 'C:/Users/DELL/PycharmProjects/pythonProject1/videolaunchtime/reference/reference1.jpg'
frame_path = 'C:/Users/DELL/PycharmProjects/pythonProject1/videolaunchtime/frames/'
frame1 = cv2.imread(ref1)
frame1 = cv2.imread(ref1)
frame2 = cv2.imread(ref2)
difference = cv2.subtract(frame2,frame1)
b,g,r = cv2.split(difference)
if cv2.countNonZero(b) > 0 and cv2.countNonZero(g) > 0 and cv2.countNonZero(r) > 0:
    print("frames are different! \n Video Playback Successful!!")
else:
    print("video playback unsuccessful!")