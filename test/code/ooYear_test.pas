{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooYear_test;

interface

uses
  SysUtils, DateUtils,
  ooYear,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TYearTest = class(TTestCase)
  published
    procedure YearNumber_2017;
    procedure YearIsLeap_2016;
    procedure YearIsNotLeap_2017;
  end;

implementation

procedure TYearTest.YearIsNotLeap_2017;
begin
  CheckFalse(TYear.New(EncodeDate(2017, 1, 1)).IsLeap);
end;

procedure TYearTest.YearIsLeap_2016;
begin
  CheckTrue(TYear.New(EncodeDate(2016, 1, 1)).IsLeap);
end;

procedure TYearTest.YearNumber_2017;
begin
  CheckEquals(2017, TYear.New(EncodeDate(2017, 1, 1)).Number);
end;

initialization

RegisterTest(TYearTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
