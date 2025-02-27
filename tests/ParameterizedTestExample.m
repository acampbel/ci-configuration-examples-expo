classdef ParameterizedTestExample < matlab.unittest.TestCase
    % Creates 12 test points, one for the 15th day of every month of 2021
    
	% Copyright 2021 The MathWorks, Inc.
	
    properties (TestParameter)
        monthNum = num2cell(1:12);
        dayNum = {1, 5, 10, 15, 20, 25, 28};
        yearNum = {1970, 2000, 2010, 2015, 2023, 2030, 2050};
    end
    
    methods (Test)
        function testDayofyear(testCase,monthNum,dayNum,yearNum)
            % Convert numeric values to mm/dd/yyyy string
            % Note: MATLAB will automatically convert numbers to strings
            % when performing number+string arithmetic
	    % pause(rand);
            dateStr = monthNum + "/" + dayNum + "/" + yearNum;
            
            % Compute expected result
            dt = datetime(dateStr,"Format","MM/dd/uuuu");
            doyExpected = day(dt,"dayofyear");
            
            % Compute actual result
            doyActual = dayofyear(dateStr);
            
            % Verify that the actual result matches the expected result
            testCase.verifyEqual(doyActual,doyExpected)
        end
    end
    
end

