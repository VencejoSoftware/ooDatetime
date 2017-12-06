{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooTimeStamp_test;

interface

uses
  SysUtils, DateUtils,
  ooTimeStamp,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TTimeStampTest = class(TTestCase)
  published
    procedure HoursOf_12_38_11_09;
    procedure MinutesOf_12_38_11_09;
    procedure SecondsOf_12_38_11_09;
    procedure MillisecondsOf_12_38_11_09;
    procedure TimeOf_12_38_11_09;
  end;

implementation

procedure TTimeStampTest.HoursOf_12_38_11_09;
begin
  CheckEquals(12, TTimeStamp.New(EncodeTime(12, 38, 11, 9)).Hours);
end;

procedure TTimeStampTest.MillisecondsOf_12_38_11_09;
begin
  CheckEquals(9, TTimeStamp.New(EncodeTime(12, 38, 11, 9)).Milliseconds);
end;

procedure TTimeStampTest.MinutesOf_12_38_11_09;
begin
  CheckEquals(38, TTimeStamp.New(EncodeTime(12, 38, 11, 9)).Minutes);
end;

procedure TTimeStampTest.SecondsOf_12_38_11_09;
begin
  CheckEquals(11, TTimeStamp.New(EncodeTime(12, 38, 11, 9)).Seconds);
end;

procedure TTimeStampTest.TimeOf_12_38_11_09;
begin
  CheckEquals(EncodeTime(12, 38, 11, 9), TTimeStamp.New(EncodeTime(12, 38, 11, 9)).AsTime);
end;

initialization

RegisterTest(TTimeStampTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
