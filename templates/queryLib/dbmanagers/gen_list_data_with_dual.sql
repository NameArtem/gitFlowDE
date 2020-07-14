
select 
	level id
	, substr(
		-- column returned from inline view
		myvals 
		-- get the starting position 
		-- note leading comma required in data
		,instr(myvals,',',1,level)+1 
		-- calculate length from starting position and end position
		-- substract to account for comma
		-- note that level keyword is what gives position in string
		, instr(myvals,',',1,level+1) - instr(myvals,',',1,level)-1
	)
from ( select ',one,two,three,four,five,six,seven,eight,nine,ten,' myvals from dual )
connect by level<=10
/



