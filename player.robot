*** Settings ***
Library   Browser

*** Test Cases ***
Example Test
    New Page    https://parodify.vercel.app
    Get Text    h1    contains    Playwright