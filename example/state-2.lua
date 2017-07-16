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
 
 