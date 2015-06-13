## Linear Model Racket
A [linear model](https://en.wikipedia.org/wiki/Linear_model) is an extremely basic form of _statistical machine learning_.

This code strongly based off of [Jeremy Kun's post about linear models](http://jeremykun.com/2013/08/18/linear-regression/). However, after looking around, it seems this method is actually pretty universal.

I'd might eventually extend this to be more useful.

### How to use

`linear-model.rkt` `provide`s a function `get-best-fit`. You hand it a list of `cons y-val x-vals` and it returns the coefficients of the function the funciton itself. For an example, see `housing.rkt`.
