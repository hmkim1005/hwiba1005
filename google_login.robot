*** Settings ***
Resource          Common.robot

*** Test Cases ***
테스트 수행 날짜 입력
    테스트 수행 날짜

홈으로 페이지 이동
    홈으로 크롬 실행

로그인 실패
    로그인 페이지로 이동
    로그인 실패

로그인 성공
    로그인 성공

브라우져 종료
    Close Browser
