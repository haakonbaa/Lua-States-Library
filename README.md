# Lua-States-Library
Library for creating simple game-states in the [Love2d framework](https://love2d.org/).
## Notes
This library is very lightweight and probably not that good when it comes to
larger games and programs. Every state is loaded when you call it, even if
the state has been loaded before. This can make your program slow if you have
large states or call your state several times.
<br>
Global variables you create in a state will also be global in all the other states.
Note that the `love.load` function will be called in every state ( if it exists ),
even if it has been called before. I reccomend declaring all your global variables
in your 'main' file.
## Use
To load the library, use the `require` function:
```lua
local states = require('states.lua');
```
To set a state, use `state.set( 'folder/filename' )`:
```lua
states.set( 'states/state1' );
```
Nothe that the state-file has to have a `.lua` extention, and that you don't write
`.lua` when you set a state!
## Example
In this simple example you can change states with the `up` and `down` key. It allso
shows the time in seconds since the program started. Nothe that every time you call
`main.lua`, you reset the timer!
<br>
In `main.lua`:
```lua
function love.load()
	states = require('states');
	time = 0;
end

function love.draw()
	love.graphics.print( 'state: main' , 5 , 5 );
	love.graphics.print( 'time: ' .. time , 5 , 20 );
end

function love.update( dt )
	time = time + 1 * dt;
end

function love.keypressed( key, unicode )
	if key == 'up' then states.set( 'state-1' ); end
	if key == 'down' then states.set( 'state-2' ); end
end
```
In `state-1.lua`:
```lua
function love.draw()
	love.graphics.print( 'state: state-1' , 5 , 5 );
	love.graphics.print( 'time: ' .. time , 5 , 20 );
end

function love.update( dt )
	time = time + 1 * dt;
end

function love.keypressed( key, unicode )
	if key == 'up' then states.set( 'state-2' ); end
	if key == 'down' then states.set( 'main' ); end
end
```
In `state-2.lua`:
```lua
function love.draw()
	love.graphics.print( 'state: state-2' , 5 , 5 );
	love.graphics.print( 'time: ' .. time , 5 , 20 );
end

function love.update( dt )
	time = time + 1 * dt;
end

function love.keypressed( key, unicode )
	if key == 'up' then states.set( 'main' ); end
	if key == 'down' then states.set( 'state-1' ); end
end
```
download the example [here.](https://github.com/haakonbaa/Lua-States-Library/tree/master/example)
