{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit DateTimeSpan_test;

interface

uses
  SysUtils, DateUtils,
  DateTimeSpan,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TDateTimeSpanTest = class sealed(TTestCase)
  published
    procedure AsDateTimeOf20_7_2017_12_38_11_09IsTDateTime;
  end;

implementation

procedure TDateTimeSpanTest.AsDateTimeOf20_7_2017_12_38_11_09IsTDateTime;
begin
  CheckEquals(EncodeDateTime(2017, 7, 20, 12, 38, 11, 9), TDateTimeSpan.NewByDateTime(EncodeDateTime(2017, 7, 20, 12,
    38, 11, 9)).AsDateTime);
end;

initialization

RegisterTest(TDateTimeSpanTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
