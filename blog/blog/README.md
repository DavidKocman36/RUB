# Blog web page

Version: Ruby 3.2.2

The semestral assignment for NI-RUB. It is a basic blog webpage that is written in Ruby on Rails. 

Technical functionality:

- Login/Registering users
- Adding, editing and deleting blog posts as an admin
- Viewing blog posts.
- Commenting on posts.
- Editing your profile.

## Setup

To seed the data, use
```
rails db:seed
```

After seeding, run the rails server
```
rails server
```

After that, open localhost in your browser (most propably on port 3000).

## Seeded users

There are four users available to use - one admin and three normal ones. After seeding it is able to log in as one. All have the same password: `neconeco`. The username of the admin user is `Admin`, usernames of other users are `user1`, `user2` and `user3`. The passwords and usernames can be also seen in `db/seeds.rb` file.