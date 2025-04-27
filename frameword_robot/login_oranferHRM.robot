*** Settings ***
Documentation       Test login page on orangehrm.com (https://opensource-demo.orangehrmlive.com/web/index.php/auth/login)

Library             SeleniumLibrary


*** Variables ***
${URL}          https://opensource-demo.orangehrmlive.com/web/index.php/auth/login
${USERNAME}     Admin
${PASSWORD}     admin123
# username and password error
${USERNAME1}    Admin123
${PASSWORD1}    admin1234


*** Test Cases ***
test dang nhap thanh cong
    # 1 mo trinh duyet
    Open Page
    # 3 dang nhap
    Dang Nhap    ${USERNAME}    ${PASSWORD}
    # 4 kiem tra ket quap
    Kiem Tra Dang Nhap

test dang nhap khong thanh cong
    # 1 mo trinh duyet
    Open Page
    # 3 dang nhap
    Dang Nhap    ${USERNAME1}    ${PASSWORD1}
    # 4 kiem tra ket qua
    Kiem Tra Dang Nhap Khong Thanh Cong


*** Keywords ***
Open Page
    Open Browser    ${URL}    chrome
    # phong to mang hinhf
    # Maximize Browser Window
    Wait Until Element Is Enabled
    ...    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[1]/div/div[2]/input
    Wait Until Element Is Enabled
    ...    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[2]/div/div[2]/input

Dang Nhap
    [Arguments]    ${USERNAME}    ${PASSWORD}
    Input Text    name=username    ${USERNAME}
    Input Text    name=password    ${PASSWORD}
    Click Button    xpath=//*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/form/div[3]/button

Kiem Tra Dang Nhap
    # kiem tra ket qua
    Wait Until Page Contains Element    xpath=//span[text()="Dashboard"]    timeout=10s
    Page Should Contain Element    xpath=//span[text()="Dashboard"]
    Page Should Contain    OrangeHRM

Kiem Tra Dang Nhap Khong Thanh Cong
    # kiem tra ket qua
    # //*[@id="app"]/div[1]/div/div[1]/div/div[2]/div[2]/div[1]/div[1]/div[1]/p
    Wait Until Page Contains Element    xpath=//p[text()="Invalid credentials"]    timeout=10s
    Page Should Contain Element    xpath=//p[text()="Invalid credentials"]
    Page Should Contain    Invalid credentials
