# Stats Page Generator
Lua-based HTML static site generator

## Why?
I wanted to quickly generate a bunch of pages that are basically the same content, except for some specific magic link stuff and strings.
So, I wrote this here quick messy Lua script to basically just wrangle the strings for me from data values.
## What it do though?
It mashes together the "template" HTML inside 'htmltemplates.lua' with the data from 'panels.lua' and then outputs HTML files.
## How can I use this?
Well, it's going to output some pretty hardcoded HTML stuff, so you're better off changing that and removing anything that isn't relevant to you.

To actually execute, just run it through LuaJIT pointed to 'genstats.lua'.
You can modify the 'panels.lua' to add more pages to generate, it also produces an index page with links to all the generated sub-pages.
# Why release this?
I dunno somebody might find small snippets of the code useful, or at least a good example of how NOT to make stuff clean or follow any particular design paradigm.
