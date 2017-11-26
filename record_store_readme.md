# **Record Store**    

![Image](/record_store_readme_images/albums.jpeg)
![Image](/record_store_readme_images/artist.jpeg)

## Project:    

I started the **Record Store** project while at CodeClan in Glasgow. The project, a full-stack web-based Album inventory, was a culmination of everything I had learned in the Ruby section of the course and gave me a chance to build on my HTML, CSS and SQL skills as well as try to use Postgres SQL and the Sinatra framework on a larger solo project.    

### *Specification:*    

**Big Al's Record Store**    

The owner of Big Al's Record Store wants an app which will help him keep on top of his store inventory. He does not want an app that customers will see, but he will use to check stock levels and see what he needs to order soon.    

You should be able to add stock, which would have an Artist and Album as well as the quantity available.    

*MVP:*    

  * Create albums with the quantity that are in stock
  * Create artists
  * Show an inventory page listing albums and artists
  * Show a stock level for the inventory items e.g. High/Medium/Low    

**Possible Extensions:**    

  * Add a buy and sell price to each stock item
  * Calculate the possible markup on items and show on inventory page
  * Add a genre to an Album
  * Any other ideas you might come up with    

### *Planning:*    

The planning stage of the project initially involved reviewing the **project spec** to clarify what needed to be done to achieve the MVP. Following this I created a **use-case diagram**, drew up **class and object diagrams** and an **table diagram** in [Draw.io](https://www.draw.io/) to solidify my thoughts on the classes I would need, the properties they would possess, the methods they would require and the relationship they would have to the other classes. Next, I created an **activity diagram**, a **site map** and a **REST plan** (mapping REST keywords, URLs, HTTP verbs, and Ruby methods) in order to clarify the path through the site. For **user experience (UX) considerations** and as a blueprint to follow I created a **proto-persona** and several **wireframes** (Stock, New/Edit Artist, New/Edit Album and Discounts pages) using [NinjaMock](https://ninjamock.com/account/register). I also created an **implementations constraints plan** and a **Trello board** to split up and organise the tasks that I needed to complete in order to complete the project. Finally, I wrote **pseudocode** before coding up.     

### *Code Overview:*    

I created the full-stack site using **Test Driven Development** (using MiniTest), the **Model View Controller** design pattern, **Embedded Ruby (ERB/HTML)** files to dynamically build the HTML, **Cascading Style Sheets (CSS)** to make the site web and mobile responsive and apply custom styling,  **PostGres SQL** in Terminal to store the dataset, and the **Sinatra framework** to handle the GET and POST requests/responses. The site was coded with **Ruby in Atom**.    

## Getting Started    

These instructions aim to get a copy of the project up and running on your local machine for development and testing purposes.    

### Prerequisites    

* Ruby installed.
* PostGres installed.
* Sinatra installed.     

### Clone    

The project can be cloned and opened (from version control) using the GitHub option on Android Studio.     

The project can be cloned with SSH using:  
[git@github.com:PMGH/record_store.git](git@github.com:PMGH/record_store.git)    

### Setup/Running

The application can be run in a browser (e.g. Google Chrome).

Navigate to the project root folder (inside record_store_project) in Terminal.

* A PostGres DB should be created called 'record_store', run 2 commands in Terminal: psql  create database record_store;
* The db/record_store.sql file should be run in Terminal using PostGres SQL in order to create the DB tables (psql -d record_store -f record_store.sql).
* OPTIONAL - can seed the database by running the seeds.rb in Terminal when in the project folder (Ruby seeds.rb).
* Run the app.rb file in Terminal to start Sinatra (Ruby app.rb).
* Open the browser and navigate to http://localhost:4567/big_als    

## Built With:  

* Test Driven Development (MiniTest)
* Atom
* MVC
* Ruby
* ERB/HTML
* CSS
* PostGres SQL
* Sinatra Framework    


## Authors  
* Peter McCready - Initial work    
