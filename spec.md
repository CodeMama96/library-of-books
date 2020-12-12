# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database -ActiveRecord is both my book.rd and user.rb files
- [x] Include more than one model class (e.g. User, Post, Category) - I have a Book and User class
- [x] Include at least one has_many relationship on your User model (e.g. User has_many Posts) -My User class has a has_many relationship with books
- [x] Include at least one belongs_to relationship on another model (e.g. Post belongs_to User) - The Book class has a belongs_to relationship to the user
- [x] Include user accounts with unique login attribute (username or email) -My emails have unique ID's where they can only edit and delete their own books.
- [x] Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying - All CRUD routes are used for the belongs_to resource
- [x] Ensure that users can't modify content created by other users -Userwse cannot modify other users content by ensuring that it is the current_user through the helper methods 
- [x] Include user input validations -users cannot use the same email twice through has_secure_password and also other validation methods such as the User and Book class
- [x] BONUS - not required - Display validation failures to user with error message (example form URL e.g. /posts/new)
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code -READ.md is complete

Confirm
- [x] You have a large number of small Git commits
- [x] Your commit messages are meaningful
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message