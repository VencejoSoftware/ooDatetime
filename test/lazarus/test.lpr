{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
program test;

uses
  ooRunTest,
  ooDaySpan_test in '..\code\ooDaySpan_test.pas',
  ooDateTimeSpan_test in '..\code\ooDateTimeSpan_test.pas',
  ooMonth_test in '..\code\ooMonth_test.pas',
  ooTimeSpan_test in '..\code\ooTimeSpan_test.pas',
  ooWeek_test in '..\code\ooWeek_test.pas',
  ooYear_test in '..\code\ooYear_test.pas',
  ooDaySpan in '..\..\code\ooDaySpan.pas',
  ooDateTimeSpan in '..\..\code\ooDateTimeSpan.pas',
  ooMonth in '..\..\code\ooMonth.pas',
  ooTimeSpan in '..\..\code\ooTimeSpan.pas',
  ooWeek in '..\..\code\ooWeek.pas',
  ooYear in '..\..\code\ooYear.pas';

{R *.RES}

begin
  Run;

end.
