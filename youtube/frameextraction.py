import cv2

video_path = 'C:/Users/DELL/PycharmProjects/pythonProject1/videolaunchtime/videos/Video_launch.mp4'
reference_path = 'C:/Users/DELL/PycharmProjects/pythonProject1/videolaunchtime/reference/reference.jpg'
frame_path = 'C:/Users/DELL/PycharmProjects/pythonProject1/videolaunchtime/frames/'


def vid_to_frame():
    vid = cv2.VideoCapture(video_path)
    success, image = vid.read()
    count = 0
    while success:
        cv2.imwrite(frame_path + "frame%d.jpg" % count, image)
        success, image = vid.read()
        count += 1
vid_to_frame()
