*** Settings ***
Library  SeleniumLibrary

*** Variables ***
${url}  https://vaccine-haven.herokuapp.com/
${Browser}  chrome
${ID}    9621054570033
${VACCINE}  Pfizer
${SITE}  OGYHSite
${INFO}  https://vaccine-haven.herokuapp.com/info
${REGISTERATION}  https://vaccine-haven.herokuapp.com/registration

*** Keywords ***

Open home page with chrome and maximize window
   Open Browser  ${url}  ${Browser}
   Maximize Browser Window

Check my info
    Click Element  //*[@id="nav__info__link"]
    ${url}=   Get Location
    Should Be Equal  ${url}  ${INFO}
    Click Element  //*[@id="nav__home__link"]/img

Check regis
    Click Element  //*[@id="dropdown"]/text
    Click Element  //*[@id="nav__register__link"]
    ${url}=   Get Location
    Should Be Equal  ${url}  ${REGISTERATION}
    Click Element  //*[@id="nav__home__link"]/img


Navigate to reservation page from home
    Click Element  //*[@id="dropdown"]/text
    Click Element  //*[@id="nav__reserve__link"]

Fill in citizen id
    Input Text  name=citizen_id  ${ID}

Select site
    Click Element  //*[@id="site_name"]
    Click Element  //*[@id="site_name"]/option[2]

Select vaccine
    Click Element  //*[@id="vaccine_name"]
    Click Element  //*[@id="vaccine_name"]/option[2]

Submit form
    Click Element  //*[@id="reserve__btn"]

Check reservation result
    Click Element  //*[@id="nav__info__link"]
    Input Text  name=citizen_id  ${ID}
    Click Element  //*[@id="info__btn"]

    Wait Until Page Contains Element  //*[@id="reserve_vaccine_value"]
    ${vaccine_name_on_screen}  Get Text  //*[@id="reserve_vaccine_value"]
    Should Be Equal  ${vaccine_name_on_screen}  ${VACCINE}

    Wait Until Page Contains Element  //*[@id="reserve_site_value"]
    ${vaccine_site_on_screen}  Get Text  //*[@id="reserve_site_value"]
    Should Be Equal  ${vaccine_site_on_screen}  ${SITE}

    Wait Until Page Contains Element  //*[@id="reserve_date_value"]
    ${date}  Get Text  //*[@id="reserve_date_value"]
    Should Not Be Empty  ${date}

    ${time}  Get Text  //*[@id="reserve_time_value"]
    Should Not Be Empty  ${time}

Cancel reservation
    Click Element  //*[@id="cancel__btn"]

Check cancellation result
    Wait Until Page Contains Element  //*[@id="citizen_id"]
    Input Text  name=citizen_id  ${ID}
    Click Element  //*[@id="info__btn"]

    Wait Until Page Contains Element  //*[@id="reserve_vaccine_value"]
    ${vaccine_name_on_screen}  Get Text  //*[@id="reserve_vaccine_value"]
    Should Be Empty  ${vaccine_name_on_screen}

    Wait Until Page Contains Element  //*[@id="reserve_site_value"]
    ${vaccine_site_on_screen}  Get Text  //*[@id="reserve_site_value"]
    Should Be Empty  ${vaccine_site_on_screen}

    Wait Until Page Contains Element  //*[@id="reserve_date_value"]
    ${date}  Get Text  //*[@id="reserve_date_value"]
    Should Be Empty  ${date}

    ${d_time}  Get Text  //*[@id="reserve_time_value"]
    Should Be Empty  ${d_time}

*** Test Cases ***

Setup:
   Open home page with chrome and maximize window

Test case 1:
    Check my info

Test case 2:
    Check regis

Reservation making:
   Navigate to reservation page from home
   Fill in citizen id
   Select site
   Select vaccine
   Submit form

Test case 3: check reservation result
   Check reservation result

Cancellation
    Cancel reservation

Test Case 4: check cancellation result
    Check cancellation result





    
