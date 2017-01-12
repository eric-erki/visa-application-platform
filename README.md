### Description
This is a university homework assignment for software engineering class. This course require us to make a website for both travel agencies and applicants. Travel Agencies can do CRUD resources, visa applicant can only read visa and its status, create new message travel agency. Access control is built inside, multiple companies can use it at the same time.

#### demo
http://visa-application-platform.herokuapp.com/

### Environment
- ruby: 2.2.3p173
- Rails: 4.2.7.1
- Development and test database: sqlite 3
- Production database: pg 0.17.1

[![Build Status](https://travis-ci.org/Adagio-cantabile/visa-application-platform.svg?branch=master)](https://travis-ci.org/Adagio-cantabile/visa-application-platform)

### database design
![Alt text](https://github.com/Adagio-cantabile/visa-application-platform/blob/master/images/UML.png "database design")

### Data Structure
#### Visa Applying Process
For Chinese applicants, different countries may have different application process. For example, applying for traveling visa of united states requires interview, while for traveling visa of Japan doesn't. We need to make a data structure to make sure a certain type of a certain country have corresponding process. 

I designed hash containing `country abbreviation => [type, applying process]`. Here is an example of successful visa application process:

```
  SUCCESSFUL_VISA =
    { 'JPN' => [
        ['Study', Status::PROGRESS_NO_INTERVIEW_SUCCESS],
        ['Travel(single)', Status::PROGRESS_NO_INTERVIEW_SUCCESS],
        ['Travel(group)', Status::PROGRESS_NO_INTERVIEW_SUCCESS],
        ['Travel(5 years)', Status::PROGRESS_NO_INTERVIEW_SUCCESS],
        ['Visiting Friends', Status::PROGRESS_NO_INTERVIEW_SUCCESS],
        ['Business', Status::PROGRESS_NO_INTERVIEW_SUCCESS],
        ['Working', Status::PROGRESS_NO_INTERVIEW_SUCCESS],
      ],
      'USA' => [
        ['Business/Travel', Status::PROGRESS_WITH_INTERVIEW_SUCCESS],
        ['Student', Status::PROGRESS_WITH_INTERVIEW_SUCCESS],
        ['Working', Status::PROGRESS_WITH_INTERVIEW_SUCCESS],
	  ]
    }
```

#### Access Control
Some actions are only able to perform by admin user or manager(like create a new staff). Access rules are written in `lib/access_domain.rb`.

Rules are in the form of `[domain, controller, action]`, these actions are only accessible to specific users.

```
  DOMAIN_LIST = [
    ['admin', 'staffs', 'index'],
    ['admin', 'staffs', 'create'],
    ['admin', 'staffs', 'delete'],
    ['admin', 'visas', 'delete'],
  ]
```

### Watch Illegal Actions

Error will be raised and recorded into log when an illegal action happens. I use a customized error `PageNotFoundError` here.

Illegal actions such as:

- If someone logged in, then try to access resources of other companies
- If someone logged in, but not a admin user, then try to access resources only admin can access

### View
For most pages with forms, I used slim-template to reduce HTML work.

### How to use this website
##### For travel agencies
![Alt text](https://github.com/Adagio-cantabile/visa-application-platform/blob/master/images/index.png "index page")
Click `Travel Agency login` button in Index page
<br>
![Alt text](https://github.com/Adagio-cantabile/visa-application-platform/blob/master/images/login.png "login page")
Use user name: `201392248`, password: `123456` to login. This is an admin user who can use all functionalities
<br>
![Alt text](https://github.com/Adagio-cantabile/visa-application-platform/blob/master/images/management.png "visa management page")
Then comes to visa management page, here you can see all unarchived visa applications,click `create new applicant information`  among the management panel.
<br>
![Alt text](https://github.com/Adagio-cantabile/visa-application-platform/blob/master/images/new_applicant.png "new applicant page")
Fill in user information, passport number should be unique(Here I only considered Chinese nationality)
<br>
![Alt text](https://github.com/Adagio-cantabile/visa-application-platform/blob/master/images/new_visa.png "new visa page)
Then return to management panel, click `create new visa application`
Here you need to use passport number that already exits, if not, create a new applicant first. After inputting visa number, applicant information will be show up to check if applicant information is correct.
<br>
![Alt text](https://github.com/Adagio-cantabile/visa-application-platform/blob/master/images/management_2.png "management page)
Then return to management panel. If a visa application is in a final step, `success` and `rejected`  button are shown because there are two outcomes for a visa application. If a visa is not pending status, staff/manager can edit that record, but only admin can delete. From the detail panel, histories statuses are shown.
<br>
![Alt text](https://github.com/Adagio-cantabile/visa-application-platform/blob/master/images/applicant.png "applicant info page)
Click `view all applicants info`,  staff/manager can create or update applicant information, only admin user can delete it.
<br>
![Alt text](https://github.com/Adagio-cantabile/visa-application-platform/blob/master/images/staff.png "staff info page")
Return to management panel, Click `manage staffs` panel,  only admin can delete staff. Click `create new staff` button to create a new staff, this is also admin only.
Return to management panel, click `view all messages`,  this is for handling customer support, if you have already solved customer's problem, click `done with it` button and it won't appear any more.
<br>
![Alt text](https://github.com/Adagio-cantabile/visa-application-platform/blob/master/images/edit_profile.png "edit profile page")
If you want to edit your account, click button in the right side of header, then click `edit profile`. Considering corporate management of staff series number,  it's not updatable.

#### For visa applicants
![Alt text](https://github.com/Adagio-cantabile/visa-application-platform/blob/master/images/visa_search.png "visa status query page")
Logout first, then goes to the homepage, click `visa status query` button. Input name and passport number you just created, all your unarchived visa applications will appear, click `detail` button to see history statuses.
<br>
![Alt text](https://github.com/Adagio-cantabile/visa-application-platform/blob/master/images/message.png "send message page")
Click `send us a message` in detail panel,  check if your information listed was correct, send the message, then the agency will see it and handle it soon.

#### references
Icons are downloaded from:
<div>Icons made by <a href="http://www.flaticon.com/authors/popcorns-arts" title="Popcorns Arts">Popcorns Arts</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
<div>Icons made by <a href="http://www.flaticon.com/authors/popcorns-arts" title="Popcorns Arts">Popcorns Arts</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
<div>Icons made by <a href="http://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
<div>Icons made by <a href="http://www.flaticon.com/authors/freepik" title="Freepik">Freepik</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
<div>Icons made by <a href="http://www.flaticon.com/authors/prosymbols" title="Prosymbols">Prosymbols</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
<div>Icons made by <a href="http://www.flaticon.com/authors/roundicons" title="Roundicons">Roundicons</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
<div>Icons made by <a href="http://www.flaticon.com/authors/roundicons" title="Roundicons">Roundicons</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
<div>Icons made by <a href="http://www.flaticon.com/authors/roundicons" title="Roundicons">Roundicons</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
<div>Icons made by <a href="http://www.flaticon.com/authors/roundicons" title="Roundicons">Roundicons</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
<div>Icons made by <a href="http://www.flaticon.com/authors/madebyoliver" title="Madebyoliver">Madebyoliver</a> from <a href="http://www.flaticon.com" title="Flaticon">www.flaticon.com</a> is licensed by <a href="http://creativecommons.org/licenses/by/3.0/" title="Creative Commons BY 3.0" target="_blank">CC 3.0 BY</a></div>
