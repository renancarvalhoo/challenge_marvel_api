# README

### Comics App Challenge:

- Description:
    - Using the Marvel developer API ​https://developer.marvel.com/​, create a simple app that allows the user to scroll through all the  comics ever released from the most recent to the oldest (and please, let us see the cover picture while at it!). The app should allow users to search by character (eg. ​deadpool​) and allow the user to mark specific comics as favourites.
    - The assets to recreate the design can be found inside the `assets` folder. The Marvel API interactive documentation can be found here:
    https://developer.marvel.com/docs

- Requirements:
    1. When I open the page I want to see a list of all Marvel’s released comic books covers ordered from most recent to the oldest
    2. When I see the list of comics I want to be able to search by character (eg. ​“deadpool”​) so I can find my favorite comics
    3. When I see the list of comics I want to be able to upvote any of them so that the most popular are easy to find in the future

- Implementation Notes
  -  Acceptable implementation languages are Ruby and Javascript. You may use any language framework readily available to you (using Rails is encouraged!)
  -  Completed projects must include a README with enough instructions for evaluators to build and run the code
  -  Use appropriate production-capable frameworks
  -  Use appropriate dependency-management and build tools
  -  The project's structure and organization should follow best practices
  -  Prefer immutable design if possible
  -  Test your code and your API. No need to test every permutation, but demonstrate you know the types of things to test for.
  -  Even though this is a simplified requirement as appropriate to be an exercise, your code should be production capable
  -  Assume the application will be used by a reasonable number of users, external API rate limiting may be applied
  -  User management and authentication is not required, a 30 minute cookie based session is sufficient
  -  Show your working, if you've used any interesting libraries or approaches during development let us know and explain why in the README


### Solution:

  - First I did an analysis if there were any wrapper of the recent and updated Marvel api, I ended up finding nothing, a lot of old stuff, so I decided to develop a simple wrapper. The wrapper created was a very simple solution, where I defined in the client class the call the API and created a previous module in which makes the creation of a new instance of the Client every time it is called, thus immutable, you can call *Marvel.comics* in a background service without worrying about context.
  - Analyzing the Marvel API, I noticed that characters (Hero) are not updated frequently, so I decided to put this in a table, this would be good to do the filter query on Dashboard. A rake task was created to update character data, so a possibility would be to set a cron to run according to a certain time period.
  - One of the preferences would be to use a rate limit for the external api, but since I was not using user saved in the database i decided that if I would already use some type of memory store to solve this, why not write a cache ?
  - Frontend was something simple too, I used the form of the own Rails Active view to make some interactions, the funniest to do was the heart as favorite


## Requirements TO-DO:
   - [x] When I open the page I want to see a list of all Marvel’s released comic books covers ordered from most recent to the oldest
   - [x] When I see the list of comics I want to be able to search by character (eg. ​“deadpool”​) so I can find my favorite comics
   - [x] When I see the list of comics I want to be able to upvote any of them so that the most popular are easy to find in the future

## Improvements

  - I would further separate the wrapper into different classes such as Response, Request, Parser and also create a paginate class or even a simple ObjectView/PORO to remove some of the code from the Controller
  - Create a router with metaprogramming in the api wrapper to manage versions
  - Error handling in the Server Client, currently if we search for a hero name and it doesn’t exist, the controller will return all the heroes. It could return an error stating that there is no such hero, or even do an input search and handle everything by javascript.
  - Save the user to the database and manage the favorites by each user.
  - Adjust as the assets in order to load the images in javascript, with this I can remove the forms created in the frontend and make everything javascript

## Interesting gems used

 - `VCR` - *store http request on tests*
 - `awesome_print` - *as the gem says awesome printer =)*
 - `rails-controller-testing` - *there are some good commands to use with controller tests.*
 - `dotenv-rails` - *this is to configure a file where it is possible to add envs to the project, so we keep the env configuration out of the project files.*

## How to run

It's required to have **redis** installed on machine to work with cache.
In MacOs is possible to do `brew install redis`


- Create a file .env at the base of the project and add the following variables

		 MARVEL_PRIVATE_API_KEY=''
		 MARVEL_API_KEY=''
		 SECRET_KEY_BASE='' (It's possible to generate it with `rake secret`)

- Clone the repo: git clone {{this_repo_url}}
- Enter the marvel_api folder: `cd marvel_api`
- Install the dependencies: `bundle install` (Ruby 2.7.1 is required)
- Run tests `RAILS_ENV=test rake test`
- Run application `rails s` (*default port 3000*)


You can access the page through the **http://localhost:3000**
