LEASE MANAGEMENT SYSTEM

CSC517 FALL 2021 PROJECT 2 (Ruby on Rails)
FACULTY: Dr. Edward F. Gehringer

MENTOR: Tirth Patel

**TEAM ANDROMEDA**: Lalit Bangad(llbangad), Subodh Thota(sthota), Kanchan Rawat (kprawat)

RUBY VERSION: 3.0.2
RAILS 6.1.4

Find details of other dependencies in the GEMFILE

DEPLOYED LINK : http://52.15.104.34:3000

HOSTING PLATFORM: AWS 

**PRECONFIGURED ADMIN:**

EMAIL: admin@ncsu.edu
PASSWORD: 123456


**Note: Please don’t change the credentials of the admin. If the server is down, it could be due to AWS instance connection time out. Please mail sthota@ncsu.edu or kprawat@ncsu.edu or llbangad@ncsu.edu to restart the AWS server instance.**


**NOTE:**

1. Used devise gem for authentication purposes.

2. Leasing agent can only view the properties that are associated to him. Each property is only associated to one leasing agent. Example, Leasing agent ‘A’ can view only properties ‘P1’,’P2,’P3’ which are associated to Leasing Agent ‘A’.  Leasing Agent ‘B’ cannot access properties ‘P1’, ‘P2’, ‘P3’ as they’re not associated with Leasing Agent ‘B’.

**MAIN COMPONENTS OF THE SYSTEM: **(Please note that all the ID fields are auto generated and you don’t see them in the forms)

	•	ADMIN
	•	LEASING AGENT
	•	PROPERTY
	•	APPLICATION
	•	APPLICANT


**1) LEASING AGENT FLOW:**

	•	Go to home -> Click Leasing Agent -> A leasing Agent login page appears
	•	Use the Signup link 
	•	In the signup up link, we see Leasing Agent form is asked NAME, PHONE NUMBER, EMAIL, PASSWORD. ID is assigned automatically by the rails db. This covers all the required attributes for the leasing Agent
	•	Once signed up, we get automatically redirected to the leasing agent’s dashboard.
	•	The dashboard gives us the opportunity to VIEW and ADD Properties. Note that View properties only displays the properties associated to the logged in agent and not all the properties present in the db. The dashboard also provides us an option to logout and Edit profile. 
	•	Select the ‘Click here to view and add properties link’
	•	You can see the properties associated to the current leasing agent. You also get a link to add a ‘NEW PROPERTY’ to the leasing agent.

To see the APPLICATIONS for a specific property, click on the SHOW link of every property. This shows the PROPERTY DETAILS along with the APPLICATIONS for that specific property

On Clicking the SHOW link of every property, you can see the applications that have been filled by various applicants for that property. Beside each application detail, you get the options of CHECKIN, CHECKOUT, REJECT. 

CHECKIN : Checks in the applicant of that application to the property. Changes the application status to APPROVED. Automatically changes the Availability of the property to FALSE. Also, fills the OCCUPIED BY FIELD by the Applicant Name. Checking in one Applicant automatically rejects the applications of other applicants for that particular property!

CHECKOUT: Checks out the currently residing tenant(previous applicant). Changes the AVAILABILITY of the property to TRUE. Also, fills the OCCUPIED BY FIELD with NONE.

REJECT : Changes the application status to reject.

**2) APPLICANT FLOW:**

	•	Go to home-> Select Applicant-> You see a Login page. Use the  Sign up. Once Signed Up, You can see we are redirected to the applicant’s dashboard
	•	An applicant dashboard can be used for three things 

a. View an Applicant’s applications 

You can view the timestamp, status and the name of the property applied 

b. View an applicant’s correctly occupied properties 

You can view the  MOVE-OUT option: Moving out automatically changes the AVAILABILITY of that property to TRUE, and The Occupied by details are also changed to NONE . This can be verified by logging in as leasing agent, and verifying the property details.

c. Apply for new properties
 The link provides a form where the applicant can select the Property that he wants to apply. You can verify that the dropdown list for the properties only shows the AVAILABLE properties and not the occupied properties


**3) ADMIN FLOW:**

	•	Go to home-> Select ADMIN-> You see a Login page. Use the preconfigured Login for ADMIN. Once logged in, You can see we are redirected to the admin’s dashboard
	•	An admin dashboard can be used for following things 

A) ADMIN RIGHTS: Edit admin profile

B) MANAGE LEASING AGENT : 
Admin can add a new leasing agent
Admin can also View/Delete/Edit Leasing Agents

C) MANAGE APPLICATIONS:
Admin can create new applications
Admin can view/ edit applications.

D) MANAGE APPLICANTS:
Admin can add applicants 
Admin can also view/edit applicant details

E) MANAGE PROPERTIES: 
Admin can add new properties
Admin can also view/edit properties. In this link, admin can get all the property details, an option to edit them. He also gets a list of applications that are related to ALL OF THE PROPERTIES. 
NOTE : He can use the Checkin checkout and reject options in the view properties link to change the STATUS of the application. The functionality of these operations remain same as mentioned in the Leasing agent flow.
