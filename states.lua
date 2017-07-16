local states = {};
states.functionList = {
	"directorydropped",
	"draw",
	"filedropped",
	"focus",
	"gamepadaxis",
	"gamepadpressed",
	"gamepadreleased",
	"joystickadded",
	"joystickaxis",
	"joystickhat",
	"joystickpressed",
	"joystickreleased",
	"joystickremoved",
	"keypressed",
	"keyreleased",
	"load",
	"lowmemory",
	"mousefocus",
	"mousemoved",
	"mousepressed",
	"mousereleased",
	"quit",
	"resize",
	"textedited",
	"textinput",
	"threaderror",
	"touchmoved",
	"touchpressed",
	"touchreleased",
	"update",
	"visibl",
	--"errhand",
	"wheelmoved"
};

states.set = function( path )
	for k = 1 , #states.functionList do
		love[ states.functionList[k] ] = nil;
	end
	dofile( path .. ".lua" );
	if love.load then
		love.load();
	end
end

return states;
