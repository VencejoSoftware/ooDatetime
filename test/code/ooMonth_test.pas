{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooMonth_test;

interface

uses
  SysUtils, DateUtils,
  ooMonth,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$IF CompilerVersion > 21}{$DEFINE FormatSettingsScope}{$IFEND}
{$ENDIF};

type
  TMonthTest = class(TTestCase)
  published
    procedure NameOfMonth_7_2017;
    procedure ShortNameOfMonth_7_2017;
    procedure NumberOfMonth_7_2017;
    procedure StartAtOfMonth_7_2017;
    procedure EndMonthOfMonth_7_2017;
    procedure DayCountOfMonth_7_2017;
  end;

implementation

procedure TMonthTest.DayCountOfMonth_7_2017;
begin
  CheckEquals(31, TMonth.New(EncodeDate(2016, 7, 1)).DayCount);
end;

procedure TMonthTest.EndMonthOfMonth_7_2017;
begin
  CheckEquals(EncodeDate(2017, 7, 31), TMonth.New(EncodeDate(2017, 7, 1)).EndAt);
end;

procedure TMonthTest.NumberOfMonth_7_2017;
begin
  CheckEquals(7, Ord(TMonth.New(EncodeDate(2017, 7, 1)).Number));
end;

procedure TMonthTest.StartAtOfMonth_7_2017;
begin
  CheckEquals(EncodeDate(2017, 7, 1), TMonth.New(EncodeDate(2017, 7, 1)).StartAt);
end;

procedure TMonthTest.NameOfMonth_7_2017;
begin
  CheckEquals({$IFDEF FormatSettingsScope}FormatSettings.{$ENDIF}LongMonthNames[7],
    TMonth.New(EncodeDate(2017, 7, 1)).Name);
end;

procedure TMonthTest.ShortNameOfMonth_7_2017;
begin
  CheckEquals({$IFDEF FormatSettingsScope}FormatSettings.{$ENDIF}ShortMonthNames[7],
    TMonth.New(EncodeDate(2017, 7, 1)).ShortName);
end;

initialization

RegisterTest(TMonthTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
