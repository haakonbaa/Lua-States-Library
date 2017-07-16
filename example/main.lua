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