*** Settings ***
Library     AppiumLibrary
Library     AutoItLibrary


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


    ${youtube_logo}    Run Keyword And Return Status    Page Should Contain Element    com.google.android.youtube:id/youtube_logo
    Log To Console    ${youtube_logo}
    Run Keyword If    ${youtube_logo} == True    test1      ELSE    test2
    Stop Screen Recording       filename=youtube_launch

operations
    Sleep    3s
    Wait Until Page Contains Element    //android.widget.Button[@content-desc="Subscriptions: New content is available"]/android.widget.ImageView    20s
    Click Element    //android.widget.Button[@content-desc="Subscriptions: New content is available"]/android.widget.ImageView















 # Wait for the youtube logo to be appear in your phone
    Sleep    2s
    Wait Until Page Contains Element     com.google.android.youtube:id/youtube_logo   timeout=50s

     # Click on search Icon in youtube application
    Sleep    2s
    Wait Until Page Contains Element      //android.widget.ImageView[@content-desc="Search"]    timeout=20s

    Click Element     //android.widget.ImageView[@content-desc="Search"]

#Type 'Mobile automation in search text box'
    Sleep    2s
    Wait Until Page Contains Element    com.google.android.youtube:id/search_edit_text     10s
    Input Text      id=com.google.android.youtube:id/search_edit_text       Nature View
    Send   {ENTER}

     # Click on particular video entitle 'application'
    Sleep    2s
    Wait Until Page Contains Element    //android.view.ViewGroup[@content-desc="Norway AMAZING Beautiful Nature with Relaxing Music and sound, 4k nature | Relaxation film - 58 minutes - Go to channel - Relaxation Film - 15M views - 2 years ago - play video"]      50s
    Click Element    //android.view.ViewGroup[@content-desc="Norway AMAZING Beautiful Nature with Relaxing Music and sound, 4k nature | Relaxation film - 58 minutes - Go to channel - Relaxation Film - 15M views - 2 years ago - play video"]

    Start Screen Recording  100s
    Sleep    10s
    Stop Screen Recording   ${EXECDIR}${/}Videos${/}test
    Log To Console     Recording Done


*** Keywords ***
test1
    Log To Console    successful
test2
    Log To Console    unsuccessful





