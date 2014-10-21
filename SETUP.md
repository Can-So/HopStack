# Setup HopStack

HopStack is ready to be setup on any local machine. At Beard and Fedora, we're 
big fans of [Codio](https://codio.com/).

## Getting Started on Codio

1. Create a New Project in Codio. From Codio's docs...

    ```bash
    Creating a new project or importing one is really easy. All you do is click on the
    Create Project button on the Dashboard as shown below.
    
    You will then be shown a dialog that lets you choose the various ways to create or import a project.
    ```
    Choose Git and insert your git clone URL
    
2. Run dependency installs

    ```bash
    $ npm install
    $ npm update
    $ bower install
    $ bower update
    ```
    
3. Add the following folder structure

    ```bash
    lib/dist/bower_components
    ```
    
4. Add a symbolic link to /app for bower_components
    
    ```bash
    $ ln -s /home/codio/workspace/bower_components /home/codio/workspace/app/bower_components
    ```
    
5. Globally install Grunt
    
    ```bash
    $ npm install -g grunt-cli
    ```

6. Install Compass
    
    ```bash
    $ gem update
    $ gem install compass 
    ```

7. Run the project
    
    ```bash
    $ grunt server
    ```bash