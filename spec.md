# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app (I have used Sinatra and ActiveRecord throughout this project.)
- [x] Use ActiveRecord for storing information in a database (I meet this requirement because my student model and my course model are both persisted to the database.)
- [x] Include more than one model class (e.g. User, Post, Category) (I use 2 models, a Student model, and a Course model.)
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) (I meet this requirement.. a Student has_many Courses in this project.)
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) (I meet this requirement. A Course belongs_to a user.)
- [x] Include user accounts with unique login attribute (username or email) (I meet this requirement. A user can create an account with a unique username and password, and login with that same information.)
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying (This requirement is met because a Student is able to CRUD a course object and the appropriate routes are made.)
- [x] Ensure that users can't modify content created by other users (This requirement is met because users cannot even possibly view or see specific content unless they are logged in as that user.)
- [x] Include user input validations (This requirement is met because during login process, I prevent a user from creating an account and route them back to new sign up page if it contains any of the specifically defined 'special characters')
- [ ] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [ ] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
