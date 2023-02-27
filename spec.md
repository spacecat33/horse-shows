Specs:

- [x ]Using Ruby on Rails for the project
- [x ]Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes) - A Horse and User has_many Shows
- [x ]Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User) - A Show belongs_to both a User and a Horse
- [x ]Include at least two has_many through relationships (x has_many y through z; e.g. Recipe has_many Items through Ingredients) -  a Horse has_many :users, through: :shows & a User has_many :horses, through: :shows
- [x ]Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g. Recipe has_many Items through Ingredients, Item has_many Recipes through Ingredients) - a Horse has_many :users, through: :shows & a User has_many :horses, through: :shows
- [x ]The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) - the Shows table has additional attributes, including 'title' and 'location'.
- [x ]Include reasonable validations for simple model objects (list of model objects with validations e.g. User, Recipe, Ingredient, Item) - User and Horse both require minimum characters for their names which must also be present among other validations.
- [x ]Include a class level ActiveRecord scope method (model object & class method name and URL to see the working feature e.g. User.most_recipes URL: /users/most_recipes) - two shown in Show model with corresponding variable in show#index and in index.html.erb.
- [x ]Include signup 
- [x ]Include login
- [x ]Include logout
- [x ]Include third party signup/login (how e.g. Devise/OmniAuth)
- [x ]Include nested resource show or index (URL e.g. users/2/recipes)
- [x ]Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x ]Include form display of validation errors (form URL e.g. /recipes/new)
Confirm:

- [x ]The application is pretty DRY
- [x ]Limited logic in controllers
- [x ]Views use helper methods if appropriate
- [x ]Views use partials if appropriate
