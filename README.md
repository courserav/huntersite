# README

This README would normally document whatever steps are necessary to get the
application up and running.

This website integrates a Facebook login to allow users to make post and comment on posts. Users can make a post if they have enough currency. When currency is 0 user cannot continue posting. 
User can get more posts through comments and likes on their content. 

Navbar at the top allows you to navigate between site pages. Login and Logout views depend on session. 

To Run:
 # Step 1
 Clone or download the repository from Github. 
 
 # Step 2
 Run bundle install to get all required gems. 

 # Step 3
 Create database and run migrations. 
 rails db:create
 rails db:migrate

# Step 4
Start Rails server. Facebook omniauth is included. Make sure ssl certificate and key are present in the 
root directory of the project. 

You can start the rails server with -b and include the ssl keys like this:
'rails s -b 'ssl://localhost:PORT?key-localhost.key$cert=localhost.crt'

# Step 5
Make an account first. Then, once your profile is under the list of registered hunters, log in as that user
and begin interacting with the site. You can make posts, comment under posts, and like comments. 