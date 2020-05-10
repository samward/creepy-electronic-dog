# CreepyElectronicDog

_CreepyElectronicDog_ is a Rails 6 application that reads article data from a [JSON endpoint](https://s3-eu-west-1.amazonaws.com/olio-staging-images/developer/test-articles-v2.json) and allows application users to "♥︎ like" the articles they see.  These likes are persisted in a local database and combined with any likes returned from the endpoint.

## Installation
This application requires Ruby 2.7.1 to be installed on your machine.  Installation instructions for a range of operating systems can be found [here](https://www.ruby-lang.org/en/documentation/installation/).

The other dependencies can be installed via [_Bundler_](https://bundler.io/).  To install Bundler, simply run `gem install bundler` on your terminal.

Once Ruby and Bundler are installed, run `bundle install` from the root of this project.

## Running the application

The application uses _SQLite3_ for local database storage, which is preconfigured with Rails 6.  To start the application simply run `rails s` from the root of the project.

You can then visit the articles page at http://localhost:3000


## Running the test suite

This application contains a combination of unit, integration and feature tests.

To run the basic test suite (without feature specs), use the command `rspec . --tag ~@js` from the project root

To run the full test suite, simply run `rspec .`.  Note that your system will need to be configured with ChromeDriver.  Installation instructions for this can be found on the [ChromeDriver website](https://chromedriver.chromium.org/getting-started).
