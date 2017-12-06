{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooDateTimeStamp_test;

interface

uses
  SysUtils, DateUtils,
  ooDateTimeStamp,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TDateTimeStampTest = class(TTestCase)
  published
    procedure DateTime_20_7_2017_12_38_11_09;
  end;

implementation

procedure TDateTimeStampTest.DateTime_20_7_2017_12_38_11_09;
begin
  CheckEquals(EncodeDateTime(2017, 7, 20, 12, 38, 11, 9),
    TDateTimeStamp.NewFromDate(EncodeDateTime(2017, 7, 20, 12, 38, 11, 9)).AsDateTime);
end;

initialization

RegisterTest(TDateTimeStampTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
