# Upwork Test Task README

###Task: Write in Ruby automation testcase by Tue. 
1. Go to https://www.upwork.com/
2. Type keyword “Ruby” in Find Freelancer search box 
3. On Find Freelancer Search result page select additional filters: 
1. Category - Web, Mobile & Software
2. Hourly rate - $10 hours and below
4. Verify that first 3 freelancers has the keyword in their title
5. Click on second freelancer to open profile
6. Verify that the keyword is presented in title and in description
7. Verify that freelancer’s hourly rate match search criteria

The project is written in Ruby, using RSpec and Selenium Webdriver. Reporting is implemented using Allure Reporter.

Driver is set up for local testing in Google Chrome, without parallel execution.


### To run tests execute command in terminal within the project directory

```
sh run.sh 
```

### If report will not open automatically, please open the file via some browser

```
allure-report/index
```


# Ruby-RSpec-Allure
