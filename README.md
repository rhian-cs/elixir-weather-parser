# WeatherParser

This application fetches weather data from the [American Weather API](https://w1.weather.gov/xml/current_obs/) and displays it in a nice format.

You can build this application yourself by following [this guide I wrote](https://github.com/rhian-cs/elixir-studies/tree/master/book/chapter-13-organizing-a-project/workshop).

## Running the application

In order to build the application, you can use:

    mix escript.build

And to run it:

    ./weather_parser

## Creating the docs

Run:

    mix docs

This will generate the docs at the `docs/index.html` directory.

## Running the tests

Run:

    mix test
