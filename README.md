## Horse_Shows

Welcome to the Horse shows app, where you can enter your horses in different shows!

To start, you will need to follow the below installation instructions.

Once set up and on the webapp, sign up and follow the instructions seen on the web browser! Enjoy!

At a minimum, users can:

Create an account, login and logout
Add horses to their account and enter those horses into shows.
Correct the details of any of their horses.

##Installation instructions To run this app on a local server:

1. In a bash terminal of your choice, clone this repo, e.g. if using SSH, type:

    $ git@github.com:spacecat33/horse_shows.git

2. In your terminal, run:

    $ cd horse_shows

    NOTE: This repository uses a Secret_Session key. Without one, you will see a cookie security warning in your terminal whenever you view this repository. To resolve, make sure you create a secret_Session key such as using .env or credentials.yml.enc. MAKE SURE YOU DO NOT PUSH YOUR KEY TO A PUBLICLY ACCESSIBLE SPACE.

3. In your terminal, run: 

    $ rails.s

4. In your web browser, navigate to the address provided in your terminal (usually http://localhost:/3000).

5. You will see the HorseShows sign-in/sign-up page. You made it! Explore!

    You can make you own account or you can use these credentials to log in as a pre-made user: username: Lea password: lea

If you encounter any problems or cannot access any test account, after running step 2 above in your terminal, run:

$ bundle install 

Then, in your terminal, run: 

$ rails.s

##Contributing If you would like to suggest an improvement or new feature that would be very welcome! To do this: a. fork and clone this repo b. cd into the project folder and run bundle install c. run rspec to make sure the tests are passing for you d. make a new branch for your changes - try and use a relevant name git checkout -b eg. git checkout -b amazing-new-feature e. make your changes and/or additions f. push your changes to your own fork g. submit a pull request

##License The gem is available as open source under the terms of the MIT License, which you can view here: https://opensource.org/licenses/MIT.