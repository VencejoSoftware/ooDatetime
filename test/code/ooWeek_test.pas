{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooWeek_test;

interface

uses
  SysUtils, DateUtils,
  ooWeek,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TWeekTest = class(TTestCase)
  published
    procedure NumberOfWeek_20_7_2017;
    procedure NumberInMonthOfWeek_20_7_2017;
    procedure StartAtOfWeek_20_7_2017;
    procedure EndAtOfWeek_20_7_2017;
  end;

implementation

procedure TWeekTest.EndAtOfWeek_20_7_2017;
begin
  CheckEquals(EncodeDate(2017, 7, 23), TWeek.New(EncodeDate(2017, 7, 20)).EndAt);
end;

procedure TWeekTest.NumberOfWeek_20_7_2017;
begin
  CheckEquals(29, TWeek.New(EncodeDate(2017, 7, 20)).Number);
end;

procedure TWeekTest.NumberInMonthOfWeek_20_7_2017;
begin
  CheckEquals(3, TWeek.New(EncodeDate(2017, 7, 20)).NumberInMonth);
end;

procedure TWeekTest.StartAtOfWeek_20_7_2017;
begin
  CheckEquals(EncodeDate(2017, 7, 17), TWeek.New(EncodeDate(2017, 7, 20)).StartAt);
end;

initialization

RegisterTest(TWeekTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
