Textarea
================

This application is a template for testing JavaScript text editors. The
instructions explain how to use the template as a starting point for a 
new github repository that the user can then modify with the JavaScript
editor to see if it meets all of the current functionality that I need.

Ruby on Rails
-------------

This application requires:

- Ruby 2.2.2
- Rails 4.2.4

Learn more about [Installing Rails](http://railsapps.github.io/installing-rails.html).

Getting Started
---------------

= Create the new repository on github

Follow the instructions on github to create a new repository. Do NOT add the Readme.md
or the .gitignore file as these are already in the existing repository.

[Create github repository](https://help.github.com/articles/creating-a-new-repository/)

= Copy source repository to the new repository

Move to the source repository and issue the following command to push the existing
repository to a new repository. In this example, we'll copy the textarea code
to the summernote repository

```bash
cd  projects/textarea
git push https://github.com/mcdaley/summernote.git add-create-js-erb:master
```

Where,

* **add-create-js-erb** is the latest branch of textarea, I need to try this with the master branch

* **master** push the changes to the summernote master branch

**NOTE:** You can also use the **gitk** tool to figure out which branch that you want to
copy to the new repository.

= Clone the new repository

Move to the directory where you want to create the new git repository and clone the 
changes from gihub.

```bash
cd  projects
git clone https://github.com/mcdaley/summernote.git
```

= Get app up and running

```bash
cd       summernote
bundle   install
bin/rake db:create
bin/rake db:migrate
bin/rake db:test:prepare
```

Now, start the server and verify that everything is working.

```bash
bin/rails server
```




Documentation and Support
-------------------------

Issues
-------------

Similar Projects
----------------

Contributing
------------

Credits
-------

License
-------
