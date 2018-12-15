{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit Week_test;

interface

uses
  SysUtils, DateUtils,
  Year,
  Week,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TWeekTest = class sealed(TTestCase)
  published
    procedure NumberOf20_7_2017Is29;
    procedure NumberInMonthForWeek29Year2017Is3;
    procedure StartAtOfWeek29Year2017Is17_7_2017;
    procedure EndAtOfWeek29Year2017Is20_7_2017;
  end;

implementation

procedure TWeekTest.NumberOf20_7_2017Is29;
begin
  CheckEquals(29, TWeek.NewByDate(EncodeDate(2017, 7, 20)).Number);
end;

procedure TWeekTest.NumberInMonthForWeek29Year2017Is3;
begin
  CheckEquals(3, TWeek.New(29).NumberInMonth(TYear.New(2017)));
end;

procedure TWeekTest.StartAtOfWeek29Year2017Is17_7_2017;
begin
  CheckEquals(EncodeDate(2017, 7, 17), TWeek.New(29).StartAt(TYear.New(2017)));
end;

procedure TWeekTest.EndAtOfWeek29Year2017Is20_7_2017;
begin
  CheckEquals(EncodeDateTime(2017, 7, 23, 23, 59, 59, 999), TWeek.New(29).EndAt(TYear.New(2017)));
end;

initialization

RegisterTest(TWeekTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
