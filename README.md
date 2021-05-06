# README

This README would normally document whatever steps are necessary to get the
application up and running.

This website integrates a Facebook login to allow users to make post and comment on posts. Users can make a post if they have enough currency. When currency is 0 user cannot continue posting. 
User can get more posts through comments and likes on their content. 

Navbar at the top allows you to navigate between site pages. Login and Logout views depend on session. 


You can start the rails server with -b and include the ssl keys.
'rails s -b 'ssl://localhost:PORT?key-localhost.key$cert=localhost.crt'