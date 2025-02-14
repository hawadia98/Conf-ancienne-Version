**** Settings ***
Library  UsercubeRobotFramework.py

*** Variables ***
${ORDERPATH}  ${EMPTY}
${RESULTPATH}  ${EMPTY}
${RUNTIMEPATH}  ${EMPTY}

*** Keywords ***
Launch Provisioning
    Fulfill RobotFramework  ${ORDERPATH}  ${RESULTPATH}  ${RUNTIMEPATH}
