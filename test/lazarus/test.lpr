{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
program test;

uses
  RunTest,
  DaySpan_test in '..\code\DaySpan_test.pas',
  DateTimeSpan_test in '..\code\DateTimeSpan_test.pas',
  Month_test in '..\code\Month_test.pas',
  TimeSpan_test in '..\code\TimeSpan_test.pas',
  Week_test in '..\code\Week_test.pas',
  Year_test in '..\code\Year_test.pas',
  DaySpan in '..\..\code\DaySpan.pas',
  DateTimeSpan in '..\..\code\DateTimeSpan.pas',
  Month in '..\..\code\Month.pas',
  TimeSpan in '..\..\code\TimeSpan.pas',
  Week in '..\..\code\Week.pas',
  Year in '..\..\code\Year.pas';

{R *.RES}

begin
  Run;

end.
