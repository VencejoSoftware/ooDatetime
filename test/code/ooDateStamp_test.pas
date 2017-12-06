{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooDateStamp_test;

interface

uses
  SysUtils, DateUtils,
  ooDateStamp,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TDateStampTest = class(TTestCase)
  published
    procedure Date_20_7_2017;
    procedure WeekNumber_20_7_2017;
  end;

implementation

procedure TDateStampTest.Date_20_7_2017;
begin
  CheckEquals(EncodeDate(2017, 7, 20), TDateStamp.NewFromDate(EncodeDate(2017, 7, 20)).AsDate);
end;

procedure TDateStampTest.WeekNumber_20_7_2017;
begin
  CheckEquals(3, TDateStamp.NewFromDate(EncodeDate(2017, 7, 20)).Week.NumberInMonth);
end;

initialization

RegisterTest(TDateStampTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
