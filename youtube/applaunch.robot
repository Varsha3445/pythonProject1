*** Settings ***
Library     AppiumLibrary
Library     AutoItLibrary
Library     applaunch.py
Library     navigation.py
Library     Videolaunchtime.py
*** Variables ***
${library_locator}  //android.widget.Button[@content-desc="Library"]/android.widget.ImageView
${create_locator}   //android.widget.Button[@content-desc="Create"]/android.widget.ImageView
${youtube_id}     com.google.android.youtube:id/youtube_logo
*** Test Cases ***
youtube_launch
     Open Application
...     http://localhost:4723/wd/hub
...     platformName=Android
...     deviceName=b4a268eb
...     appPackage=com.google.android.youtube
...     appActivity=com.google.android.youtube.HomeActivity
    Start Screen Recording
    Sleep    8

 # Wait for the youtube logo to be appear in your phone
    Wait Until Page Contains Element    ${youtube_id}
    ${youtube_logo}    Run Keyword And Return Status    Page Should Contain Element    ${youtube_id}
    Log To Console    ${youtube_logo}
    Run Keyword If    ${youtube_logo} == True    test1      ELSE    test2
    Stop Screen Recording       filename=youtube_launch
     # Click on search Icon in youtube application
     ${launchtime} =   applaunch_time
     Log To Console       applaunch time is:${launchtime}

navigation
    Wait Until Page Contains Element    com.google.android.youtube:id/youtube_logo
    Start Screen Recording
    Click Element    ${library_locator}
    Sleep    3s
    Go Back
    Click Element    ${create_locator}
    Stop Screen Recording       filename=home_to_library
    Sleep    3s
    Go Back
    ${navigationtime} =   navigation_time
    Log To Console     navigation time is:${navigationtime}

#Type 'Mbox'obile automation in search text
search_key
    Sleep    2s
    Wait Until Page Contains Element      //android.widget.ImageView[@content-desc="Search"]    timeout=20s

    Click Element     //android.widget.ImageView[@content-desc="Search"]


    Sleep    2s
    Wait Until Page Contains Element    com.google.android.youtube:id/search_edit_text     30s
    Input Text      id=com.google.android.youtube:id/search_edit_text       Nature View
    Send   {ENTER}

     # Click on particular video entitle 'application'
    Start Screen Recording
    Sleep    2s
    Wait Until Page Contains Element    //android.view.ViewGroup[@content-desc="Norway AMAZING Beautiful Nature with Relaxing Music and sound, 4k nature | Relaxation film - 58 minutes - Go to channel - Relaxation Film - 16M views - 2 years ago - play video"]  50s
    Click Element    //android.view.ViewGroup[@content-desc="Norway AMAZING Beautiful Nature with Relaxing Music and sound, 4k nature | Relaxation film - 58 minutes - Go to channel - Relaxation Film - 16M views - 2 years ago - play video"]
    Stop Screen Recording       filename=video_launch
    ${videolaunchtime} =  video_launchtime
    Log To Console    videolaunch time is:${videolaunchtime}



*** Keywords ***
test1
    Log To Console    successful
test2
    Log To Console    unsuccessful


