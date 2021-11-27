# vaccine-web-tests
Introduction to Robot framework

### SUT

https://vaccine-haven.herokuapp.com/

### Prerequisite

Since my tests use Chrome to open the application. Here are some instruction on how to set Chrome driver. 

1. Check your Chrome version
<img alt="1" src="https://user-images.githubusercontent.com/59832457/143722082-84d22e51-4d65-4f23-a97c-6d0fb6dba841.png" width="500" height="300">
<img width="355" alt="1" src="https://user-images.githubusercontent.com/59832457/143722271-76ab554e-ed40-4476-b227-684de231ab79.png">

2. Download suitable version for your Chrome driver

  * https://chromedriver.chromium.org/

3. Set your Chrome driver path

There are many ways to set Chrome driver path. This is one of the good example [set Chrome driver for MAC](https://www.swtestacademy.com/install-chrome-driver-on-mac/)

### How to run test

install robot framework

```
pip install robotframework
```

install selenium2library

```
pip install robotframework-selenium2library
```
run tests
```
robot 3AM.robot
```

### In class question

which do you think is a better framework for E2E testing of web applications or web services:  Robot Framework or Cucumber with Selenium/HTTP library and JUnit?


In my opinion, I prefer Cucumber with Selenium/HTTP library and JUnit. I'm agree that Robot Framework is easier to use. However, it is limited in term of functionality. If we're going to test for more complex features, Cucumber may be a better choice. Moreover, Cucumber allow you to create more flexible Gherkin code and this is what we're looking for in order to conduct E2E testing


### Robot framework resource(s)

* [Thai tutorial](https://www.youtube.com/watch?v=xqN4DSUf_Gs&list=PLZ6Bx61eBnB07SRw1zZR5Pad8kheKLftt&index=2) - This is one of the good tutorial in Thai that I recommmend
* [Source code](https://github.com/kachain2019/robot_day1) - This is the source code from the previous video
* [Documentation](https://robotframework.org/Selenium2Library/Selenium2Library.html#Open%20Browser) - Robot framework documentation
* [Robot framework example](https://github.com/bleachjade/Kvent/blob/master/Kvent/tests/e2e/test_auth_success.robot) - Good example of how to apply robot framework to project

