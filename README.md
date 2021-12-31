# Facebook Clone

## About this project

This is the final project for the Odin Project's Ruby on Rails course. The objective of this project was to create a web application that mimicked some of Facebook's core functationality like friend requests, user profiles, posting, commenting, and liking. Another aspect was using omniauth to allow users to create their account and sign in through Facebook. You can view the project's full assignment here: https://www.theodinproject.com/paths/full-stack-ruby-on-rails/courses/ruby-on-rails/lessons/rails-final-project.

Ruby on Rails web application with the social media platform's core functionality: user profiles, posts, pictures, friends, likes, and comments. Omniauth implementation allows users to sign up and sign in using their Facebook login. All other user validation is handled with Devise.

## Functionality
Users can send and receive friend requests from other users. A count of a user’s pending notifications/friend requests is displayed in the navigation bar.

Users can post pictures and/or written content. Users can like and comment on these posts.

A user’s timeline functions as it does on Facebook – they only see posts they or their friends have made.

## Potential future features

Ability to like comments.

Ability to comment on comments.

Expanded notification functionality such as tagging other users in posts or comments.

Blocking users and hiding users' posts.

## Deployment

Deployed with Heroku. [See live](https://stormy-headland-06761.herokuapp.com/).

## Get started

Clone the repo to your local machine:

`$ git clone https://github.com/jmorton138/facebook_clone`

Install all of the necessary gems:

`$ bundle install`

Migrate the database:

`$ rails db:migrate`

Sample data is located in the seed file. To use this data, run:

`$ rails db:seed`

To run this application on your local server run:

`$ bin/rails server`

View the application at:

`http://127.0.0.1:3000`




