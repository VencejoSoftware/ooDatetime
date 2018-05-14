{
  Copyright (c) 2018, Vencejo Software
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
  TYearTest = class sealed(TTestCase)
  published
    procedure YearNumberOf2017Is2017;
    procedure IsLeapOfYear2016IsTrue;
    procedure IsLeapOfYear2017IsFalse;
  end;

implementation

procedure TYearTest.YearNumberOf2017Is2017;
begin
  CheckEquals(2017, TYear.New(2017).Number);
end;

procedure TYearTest.IsLeapOfYear2017IsFalse;
begin
  CheckFalse(TYear.NewByDate(EncodeDate(2017, 1, 1)).IsLeap);
end;

procedure TYearTest.IsLeapOfYear2016IsTrue;
begin
  CheckTrue(TYear.New(2016).IsLeap);
end;

initialization

RegisterTest(TYearTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
