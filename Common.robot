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
홈으로 크롬 실행
    Open Browser    ${google_home}    chrome    executable_path=${CURDIR}/chromedriver
    Log To Console    구글 홈으로 이동 성공
    sleep    1s

로그인 페이지로 이동
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Element Should Be Visible    xpath://*[@href='https://accounts.google.com/ServiceLogin?hl=ko&passive=true&continue=https://www.google.com/&ec=GAZAmgQ']
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    xpath://*[@href='https://accounts.google.com/ServiceLogin?hl=ko&passive=true&continue=https://www.google.com/&ec=GAZAmgQ']
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    id:headingText
    Should Be Equal    ${title}    로그인
    Log To Console    로그인 페이지로 이동 테스트 성공
    sleep    1s

로그인 실패
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    id=identifierId
    InputText Element[텍스트 입력하기]    id:identifierId    ${EMPTY}
    Log To Console    존재하지 않는 아이디 입력
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class=VfPpkd-vQzf8d
    sleep    1s
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class: o6cuMc
    Should Contain    ${title}    이메일이나 전화번호를 입력하세요.
    sleep    1s
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    id=identifierId
    InputText Element[텍스트 입력하기]    id:identifierId    ${id}
    Log To Console    존재하는 아이디 입력
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class=VfPpkd-vQzf8d
    InputText Element[텍스트 입력하기]    name:password    test
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:VfPpkd-vQzf8d
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class:VfPpkd-vQzf8d
    Should Be Equal    ${title}    다음
    Log To Console    아이디와 맞지 않는 비밀번호 입력
    sleep    1s

로그인 성공
    InputText Element[텍스트 입력하기]    name:password    ${password}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    class:VfPpkd-vQzf8d
    ${title}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    class: gb_d
    Should Be Equal    ${title}    Gmail
    Log To Console    아이디와 맞는 비밀번호 입력하여 로그인 성공

Click Element[버튼 클릭]
    [Arguments]    ${element}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Click Element    ${element}

InputText Element[텍스트 입력하기]
    [Arguments]    ${element}    ${input_text}
    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Input Text    ${element}    ${input_text}

Get Element Attribute[속성값 가져오기]
    ${get_attr}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Element Attribute    ${element}    ${attribute}

Get Text[텍스트 가져오기]
    [Arguments]    ${element}
    ${get_text}    Wait Until Keyword Succeeds    ${totalTime}    ${checkTime}    Get Text    ${element}
    [Return]    ${get_attr}

테스트 수행 날짜
    ${date}    DT.Get Current Date
    Log To Console    ${date}
