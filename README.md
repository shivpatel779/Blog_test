# README

This is a simple Rails 7 application that allows users to register, login, and view a list of posts. It also provides APIs for user authentication and retrieving posts.

Technologies Used
Ruby 3.0.0
Rails 7
PostgreSQL

Installation
Clone the repository:

   git clone <repository_url>

Install dependencies:
  
    bundle install
    Set up the database:

   rails db:create
   rails db:migrate
Start the Rails server:

    rails server
    
Usage


#Web Interface
 1 Visit localhost:3000/regsiter in your browser to access the web interface.
           You can register a new account or login link if existing credentials.
Once logged in, you can view a list of posts which you created.
  API Endpoints

1. User Registration
   Endpoint: localhost:3000/users
   Method: POST
   Request Body: JSON object containing username and password fields.
   Response: JSON object with message indicating successful registration or error message.
   json:

    {
        "email": "your email address",
        "password": "password123"
    }

2. User Login
   Endpoint: localhost:3000/user_login
   Method: POST
   Request Body: JSON object containing username and password fields.
   Response: JSON object with token field if login successful, otherwise error message.
      json:

    {
        "email": "your email address",
        "password": "password123"
    }

3. User Logout
   Endpoint: localhost:3000/logout_user
   Method: DELETE.
   Response: Message logout successful, otherwise error message.
      json:

    {
        message: "Logout Succesfully"
    }

4. Get List of posts
   Endpoint: /show_all_post
   Method: GET
   Response: JSON array of posts if authenticated, otherwise error message.
   Example Requests (Using Postman)


