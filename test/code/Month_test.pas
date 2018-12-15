{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit Month_test;

interface

uses
  SysUtils, DateUtils,
  Year,
  Month,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$IF CompilerVersion > 21}{$DEFINE FormatSettingsScope}{$IFEND}
{$ENDIF};

type
  TMonthTest = class sealed(TTestCase)
  published
    procedure JulyMonthNumberIs7;
    procedure JulyMonthShortNameIsJul;
    procedure JulyMonthShortNameIsJuly;
    procedure DayCountOfJuly2017Is31;
    procedure StartAtJuly2017Is1_7_2017;
    procedure EndAtJuly2017Is31_7_2017;
  end;

implementation

procedure TMonthTest.JulyMonthNumberIs7;
begin
  CheckEquals(7, Ord(TMonth.New(TMonthNumber.July).Number));
end;

procedure TMonthTest.JulyMonthShortNameIsJul;
begin
  CheckEquals({$IFDEF FormatSettingsScope}FormatSettings.{$ENDIF}LongMonthNames[7], TMonth.New(TMonthNumber.July).Name);
end;

procedure TMonthTest.JulyMonthShortNameIsJuly;
begin
  CheckEquals({$IFDEF FormatSettingsScope}FormatSettings.{$ENDIF}ShortMonthNames[7],
    TMonth.New(TMonthNumber.July).ShortName);
end;

procedure TMonthTest.DayCountOfJuly2017Is31;
begin
  CheckEquals(31, TMonth.New(TMonthNumber.July).DayCount(TYear.New(2016)));
end;

procedure TMonthTest.StartAtJuly2017Is1_7_2017;
begin
  CheckEquals(EncodeDate(2017, 7, 1), TMonth.NewByDate(EncodeDate(2017, 7, 1)).StartAt(TYear.New(2017)));
end;

procedure TMonthTest.EndAtJuly2017Is31_7_2017;
begin
  CheckEquals(EncodeDateTime(2017, 7, 31, 23, 59, 59, 999), TMonth.New(TMonthNumber.July).EndAt(TYear.New(2017)));
end;

initialization

RegisterTest(TMonthTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
