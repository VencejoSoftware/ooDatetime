{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooDay_test;

interface

uses
  SysUtils, DateUtils,
  ooDay,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$IF CompilerVersion > 21}{$DEFINE FormatSettingsScope}{$IFEND}
{$ENDIF};

type
  TDayTest = class(TTestCase)
  published
    procedure NameOfDay_20_7_2017;
    procedure ShortNameOfDay_20_7_2017;
    procedure NumberOfDay_20_7_2017;
    procedure YearDayNumberOfDay_20_7_2017;
    procedure WeekdayOfDay_20_7_2017;
  end;

implementation

procedure TDayTest.NameOfDay_20_7_2017;
begin
  CheckEquals({$IFDEF FormatSettingsScope} FormatSettings.
    {$ENDIF} LongDayNames[5], TDay.New(EncodeDate(2017, 7, 20)).Name);
end;

procedure TDayTest.NumberOfDay_20_7_2017;
begin
  CheckEquals(20, Ord(TDay.New(EncodeDate(2017, 7, 20)).Number));
end;

procedure TDayTest.ShortNameOfDay_20_7_2017;
begin
  CheckEquals({$IFDEF FormatSettingsScope} FormatSettings.
    {$ENDIF} ShortDayNames[5], TDay.New(EncodeDate(2017, 7, 20)).ShortName);
end;

procedure TDayTest.WeekdayOfDay_20_7_2017;
begin
  CheckEquals(5, Ord(TDay.New(EncodeDate(2017, 7, 20)).WeekDay));
end;

procedure TDayTest.YearDayNumberOfDay_20_7_2017;
begin
  CheckEquals(201, Ord(TDay.New(EncodeDate(2017, 7, 20)).YearDayNumber));
end;

initialization

RegisterTest(TDayTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
