/* Associations */

1. A user can have many dogs  
2. A dog belongs to a user   
3. dogs should have a breed  
4. user should have many breeds through dogs has_many :breeds, through: :dog



/* User */

1. User signin/signout and signup should be handled by devise
2. Should be able to login with Omniauth

/* dogs */

1. A new dog should be associated to current_user upon creation
2. If an adoptable dog is adopted the foreign key will now be current_user id
3. dog model should have a method for adoption
4. dog model should have a method display all adoptable dogs
  

/* sessions */

1. Upon logging in a session should be created 
2. logging in should redirect to the account page
3. signup should login and redirect to account page

/* views */

User
  1. User account page should display the user stats
  2. User account page should display all the dogs the user owns
  3. User account page should have a picture for all the dogs (paperclip gem??)
  4. User account page should have a button to edit profile

layout
  1. Navigation should include signout if signed in
  2. Navigation should include link to home page (account)
  3. Navigation should include link to about page
  4. Navigation should include link to adopt pets (if logged in)

partials
  _user_form (for new user and edit user)
  _pet_form (for new pet and edit pet)
  _signin
  _header



/* validations */

User
  - Must have a username
  - Must have a password
  - password must be longer than 4 characters
  - Must have an address
  - Must have an email address

Dogs
  - Must have a Name
  - Must have a Price if adoptable
  - Must be either adoptable or unadoptable default false
Breed
  - Breed Must have a name
  - breed only submittable by admin????


