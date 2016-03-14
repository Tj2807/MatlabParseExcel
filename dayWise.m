%Project takes as an input an excel file with 10950 rows and 4 columns(One
%for each timescale.
%It stores a data in a 3 Dimensional Matrix dayWiseAnswer.
%In matlab, a 3D matrix is stored as (row,col,page)
%There are total 7 pages in o/p matrix, one for each day.
%On each page, there are 4 columns ( One for each scale) and corresponding
%no. of rows.
%For eg. To access the rainfall on all the sundays of timescale 1961-2010,
%>>dayWiseAnswer(:,1,7)      
%^That is and example of (row,col,page) format.
%Numbering of days starts from Monday, Monday given 1.
%There are 4 timescales numbered accordingly, 1961-2010 given 1.

%It also gives a excel file, storing each day in one sheet in above format.

clc
clear
    B = xlsread('trial'); 
    startDay=[6;5;1;3]; %Storing starting days of 1961,2011,2041,2071 0 based****
    dayName={'Monday','Tuesday','Wednesday','Thursday','Friday','Saturday','Sunday' };
    timeScales = {'1961-2010','2011-2040','2041-2070','2071-3000'};
    %dayWiseAnswer = [];
    dayWiseAnswer=zeros(2000,4,7);
    dayCntScaleOne = startDay(1)+1;
    dayCntScaleTwo = startDay(2)+1;
    dayCntScaleThree = startDay(3)+1;
    dayCntScaleFour = startDay(4)+1;
    indexCount = ones(7,4); %stores indexes for page,timescale
    for a=1:10950
        dayWiseAnswer(indexCount(dayCntScaleOne,1),1,dayCntScaleOne)=B(a,1);
        indexCount(dayCntScaleOne,1)= indexCount(dayCntScaleOne,1) +1;
        dayWiseAnswer(indexCount(dayCntScaleTwo,2),2,dayCntScaleTwo)=B(a,2);
        indexCount(dayCntScaleTwo,2)= indexCount(dayCntScaleTwo,1) +1;
        dayWiseAnswer(indexCount(dayCntScaleThree,3),3,dayCntScaleThree)=B(a,3);
        indexCount(dayCntScaleThree,3)= indexCount(dayCntScaleThree,1) +1;
        dayWiseAnswer(indexCount(dayCntScaleFour,4),4,dayCntScaleFour)=B(a,4);
        indexCount(dayCntScaleFour,4)= indexCount(dayCntScaleFour,1) +1;
        dayCntScaleOne= mod((dayCntScaleOne),7)+1;
        dayCntScaleTwo= mod((dayCntScaleTwo),7)+1;
        dayCntScaleThree= mod((dayCntScaleThree),7)+1;
        dayCntScaleFour= mod((dayCntScaleFour),7)+1;
    end
    
   xlswrite('dayWiseSeparated.xls',dayWiseAnswer(:,:,1),1); %Store Monday on sheet 1
   xlswrite('dayWiseSeparated.xls',dayWiseAnswer(:,:,2),2); %Store Tuesday on sheet 2
   xlswrite('dayWiseSeparated.xls',dayWiseAnswer(:,:,3),3); %Store Wednesday on sheet 3
   xlswrite('dayWiseSeparated.xls',dayWiseAnswer(:,:,4),4); %Store Thursdday on sheet 4
   xlswrite('dayWiseSeparated.xls',dayWiseAnswer(:,:,5),5); %Store Friday on sheet 5
   xlswrite('dayWiseSeparated.xls',dayWiseAnswer(:,:,6),6); %Store Saturday on sheet 6
   xlswrite('dayWiseSeparated.xls',dayWiseAnswer(:,:,7),7); %Store sunday on sheet 7
