# NOTES ON RB101

1. In 2.18, they say blocks create a new scope for local variables. In "The Well-Grounded Rubyist" they say (I think) the opposite. Who is right?

It seems a bit of both. Local variables initialized in the block have block scope. But you can access local variables initialized outside the block.

The case of constants maybe clarifies things. Constants initialized in a block are accessible outside. Why? Maybe because they're in the same scope, i.e. blocks don't create a new scope.