# Learn Elixir by building a robot assistant

## Introduction

We're going to learn Elixir by building a virtual assistant module by module. Before we start, please have a look at the [installation page](elixir.docs/installation.md) in the documentation. We included [some high-level documentation](elixir.docs/README.md) on some  Elixir features that you will need for the exercices, but don't be afraid to check the [official documentation](https://elixir-lang.org/docs.html) or to ask questions when you're stuck. 

To compile Marvin the robot assistant you can run `mix escript.build`. Then you can start the binary by running `./robot`.

Try running some commands. As you can see, Marvin is not that smart yet. He always replies the same thing. Let's solve that by adding some functionality to his converse module in `lib/converse.ex`.

## Part 1

For starters, we could make Marvin _seem_ smarter by having him say a random greeting from a predefined **list** instead of having him repeat himself.

We'll start by defining a module attribute `@greetings`, which will be of type **list** and will contain a list of greetings. We can work with lists by using the built-in Enum module. And it just so happens to include a `random` method. Try using the pipe operator to pass the random greeting to our `say` function.

You might be surprised to see the `grok` function defined multiple times in our module. This is our first encounter with pattern matching. When called, our program will go through the different definitions of `grok` from top to bottom until the arguments with witch the function was called matches the pattern in our function definition. In our case, we have a `grok` to handle "quit", and then a grok that handles all the other cases, the underscore is used as a catchall when we don't really care about the actual value of an argument.

Knowing this, we can now add some new functionality to our converse module. It would be cool if Marvin understood that we were greeting him when typing `hello` in our terminal. Try to make Marvin reply with a greeting we added to our `@greetings` list every time we type hello.

To make Marvin more helpful, he could give us a list of commands he does understands when we type a command he doesn't recognize. We'll start by defining a module attribute `@commands`, which will be a **struct** containing all the supported commands and their description. We can map through the key-value pairs to create strings out of them and pass them to our `say()` function like we did for the greetings.

## Part 2

Now we'd like Marvin to understand more than just his predefined commands. We're gonna want to pass some arguments with some of his commands. The app was refactored a bit to make this possible. Instead of getting strings as arguments in `grok`, we'll now get lists.

We can have Marvin respond to a `repeat` command. Try to create a function for this in our converse module. Here's a tip: You can use the pipe character (`|`) to separate a lists' head (its first element) from its tail (the rest):

```
iex(1)> [head | tail] = [1, 2, 3, 4, 5]
iex(2)> head
1
iex(3)> tail
[2, 3, 4, 5]
```

Try using that along with pattern matching to develop the `repeat` feature.

It might be usefull to give the ability to shout to our Robot. create a shout function that takes a string as an argument and returns it upcased with exclamation marks. Then wire up Marvin to be able to use this new power.

To end Part 2, we might want to clean up after ourselves. Right now, we're defining grok all over the place and it's getting quite messy. See if you can refactor grok and do the pattern matching inside the function's body. You might want to check [the documentation on case](https://hexdocs.pm/elixir/Kernel.SpecialForms.html#case/2)

## Part 3

We already taught Marvin a couple of neat tricks. Now let's try to teach him stuff that is actually usefull. I hear computers are great at maths. Let's create a new module and call it Robot.Maths. In that module, add the following public functions.

- [ ] `add(x, y)`: adds 2 numbers
- [ ] `substract(x, y)`: substracts y from x
- [ ] `multiply(x, y)`: multiply a with b
- [ ] `double(x)`: doubles a number, use `multiply` to create this one
- [ ] `divide/2`: divides a number. Watch out for edge cases!

It might be easier to use iex when developing these features. Running `iex -S mix` in the project's directory will compile all the modules in /lib and make them available to us in the interactive console.

When that's done, make these functionalities available from Marvin's interface. Now might be a good moment to put `grok` in its own module, as it will interpret the commands we give to Marvin and use functions from both the Robot.Converse & Robot.Maths modules.

As a human, I like to go out and have dinner with my friends but I don't like to split the bill. Create a function in our Robots.Maths module that takes a list of prices of arbitrary length and does the following things:

1. Calculate sum of the prices
2. Adds 21% vat
3. Adds 12% tip
4. Splits it by 4 (Conveniently, I always go out with the same number of friends)
5. Rounds the result up to 2 decimal points

## Part 4

So far, our communication with Marvin has been a bit one-sided. We give him commands and Marvin executes. Let's kick things up a notch and make our interactions with Marvin a bit more conversational. Refactor Robot.Grok and the `split_bill` function so that when you're asking Marvin to split a bill, he asks you for the information he needs in order to be able to do his calculation. To keep Robot.Grok clean, you might want to put the logic related to this conversation in its own module.

## Part 5

It would be great if we could ask Marvin for the weather. We can get the weather from the [metaweather API](https://www.metaweather.com/api/#location). Build a module that lets Marvin react when we ask him "weather london". In order to be able to do this, we'll need to install our first dependencies: Poison and HTTPoison. You can add them our project's mix.exs and run `mix deps.get`
