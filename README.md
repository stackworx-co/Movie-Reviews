# README

<h2>Movie Review App</h2>
<p>In this app user can see many movies. User can rate the 
movie and give comments. User can also book online ticket for
particular movie and download the invoice in PFD form. In 
this app only admin has privilege to manage movies and while
on the other hand user only can see this.</p>

<h2>Prerequisites</h2>
<p>Ruby version: <strong> ruby 2.6.3p62</strong><br>
Rails version: <strong>Rails 5.2.3</strong><br>
Database: <strong>sqlite3</strong></p>


<h2>Architecture</h2>
<p>This app has 4 main models user, review, movie and booking.
Movie model has one-to-many relationship with user model.
Review model has one-to-many relationship with movie. Booking
model has one-to-many relationship with movie.</p>

<h2>What is included?</h2>
<p>1. In this app Devise gem is used for registration and login.
2. Cancan gem is used for authentication of users on the bases
of their roles.<br> 3. Paperclip gem used to upload to photos of
movies.<br> 4. Font-awesome-sass gem us used to include font-awesome 
icons in rails.<br> 5. Wicked PDF gem is used for to download movie's
booking invoice in PDF form.</p>

<h2>What does this app do ?</h2>
<p>1. User can register on this app and if user is already 
registered then can login.<br> 2. After the signup/login user
can see all movies present in the app on index page.
<br>3. User can click on any particular movie to see its
details.<br>4. User can click on "Write a review" button and
then can rate and comment the movie.<br>5. User can click on
"Book ticket" button and after giving quantity of tickets and
then book ticket for the movie.<br> 6. After booking ticket user
can click on "Download PDF" button and download invoice
for ticket in PDF form.<br>7. If user is a admin then he/she
can create a new movie, update and delete old movies present 
in the app.</p>

<h2>Installation</h2>
<p>1. Pull the project down from GitHub using git clone.<br>
2. Change into the project directory using cd IMDb.<br>
3. Install the gems using bundle install.<br>4. Create the 
database with rake db:create.<br>4. Run the migrations with
rake db:migrate.<br>5. Open localhost:3000 in user browser.</p>




 