*** Settings ***
Library           SeleniumLibrary    run_on_failure=Nothing    WITH NAME    S
Library           DateTime    WITH NAME    DT


*** Variables ***
${totalTime}      30
${checkTime}      3
${id}             kim.autotest@gmail.com
${password}       Qwert12345!
${google_home}    https://www.google.com/

*** Keywords ***
Go to home-page
    Open Browser    ${google_home}    chrome    executable_path=${CURDIR}/chromedriver
    Log To Console    구글 홈으로 이동 성공
    sleep    2s

Go to login-page
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    xpath://*[@href='https://accounts.google.com/ServiceLogin?hl=ko&passive=true&continue=https://www.google.com/&ec=GAZAmgQ']
    Log To Console    1
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@href='https://accounts.google.com/ServiceLogin?hl=ko&passive=true&continue=https://www.google.com/&ec=GAZAmgQ']
    Log To Console    2
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    id:headingText
    Should Be Equal    ${title}    로그인
    Log To Console    로그인 페이지로 이동 테스트 성공
    sleep    1s

Login failed
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    id=identifierId
    InputText Elements    id:identifierId    ${EMPTY}
    Log To Console    존재하지 않는 아이디 입력
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class=VfPpkd-vQzf8d
    sleep    1s
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class: o6cuMc
    Should Contain    ${title}    이메일이나 전화번호를 입력하세요.
    sleep    1s
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    id=identifierId
    InputText Elements    id:identifierId    ${id}
    Log To Console    존재하는 아이디 입력
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class=VfPpkd-vQzf8d
    InputText Elements    name:password    test
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:VfPpkd-vQzf8d
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:VfPpkd-vQzf8d
    Should Be Equal    ${title}    다음
    Log To Console    아이디와 맞지 않는 비밀번호 입력
    sleep    1s

Login succeed
    InputText Elements    name:password    ${password}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:VfPpkd-vQzf8d
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class: gb_d
    Should Be Equal    ${title}    Gmail
    Log To Console    아이디와 맞는 비밀번호 입력하여 로그인 성공

Click Elements
    [Arguments]    ${element}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    ${element}
    Log To Console    버튼 클릭

InputText Elements
    [Arguments]    ${element}    ${input_text}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    ${element}    ${input_text}
    Log To Console    텍스트 입력

Get Element Attributes
    ${get_attr}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Element Attribute    ${element}    ${attribute}
    Log To Console    속성값 가져오기

Get Texts
    [Arguments]    ${element}
    ${get_text}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    ${element}
    Log To Console    텍스트 가져오기
    [Return]    ${get_attr}

Date of testing
    ${date}    DT.Get Current Date
    Log To Console    ${date}

testcode
    Log To Console    1
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@href='https://accounts.google.com/ServiceLogin?hl=ko&passive=true&continue=https://www.google.com/&ec=GAZAmgQ']
    Log To Console    2
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    id:headingText
    Should Be Equal    ${title}    로그인
    Log To Console    로그인 페이지로 이동 테스트 성공
    sleep    1s
