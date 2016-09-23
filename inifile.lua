local INI = {};

function trim(s)
  return (s:gsub("^%s*(.-)%s*$", "%1"))
end

function INI.load(fileName)
	assert(type(fileName) == 'string', 'Parameter "fileName" must be a string.');
	local f = assert(file.open(fileName, 'r'), 'Error loading file : ' .. fileName);
	local data = {};
	local section;
	line = file.readline()
	while(line~=nil) do
		line = trim(line)
		local tempSection = string.match(line,('^%[([^%[%]]+)%]$'));
		
		if(tempSection)then
			section = tonumber(tempSection) and tonumber(tempSection) or tempSection;
			data[section] = data[section] or {};
		end
		local param, value = string.match(line,('^([%w|_]+)%s-=%s-(.+)$'));
		
		if(param and value ~= nil)then
			if(tonumber(value))then
				value = tonumber(value);
			elseif(value == 'true')then
				value = true;
			elseif(value == 'false')then
				value = false;
			end
			if(tonumber(param))then
				param = tonumber(param);
			end
			data[section][param] = value;
		end
		line = file.readline()
	end
	file.close();
	return data;
end

function INI.save(fileName, data)
	assert(type(fileName) == 'string', 'Parameter "fileName" must be a string.');
	assert(type(data) == 'table', 'Parameter "data" must be a table.');
	assert(file.open(fileName, 'w'), 'Error loading file :' .. fileName);
	for section, param in pairs(data) do
		file.writeline(('[%s]'):format(section));
		for key, value in pairs(param) do
			file.writeline(('%s=%s'):format(key, tostring(value)));
		end
	end
	file.close();
end

return INI;