{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooTimeSpan_test;

interface

uses
  SysUtils, DateUtils,
  ooTimeSpan,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TTimeSpanTest = class sealed(TTestCase)
  published
    procedure HourOf_12_38_11_09Is12;
    procedure MinuteOf_12_38_11_09Is38;
    procedure SecondOf_12_38_11_09Is11;
    procedure MillisecondOf_12_38_11_09Is9;
    procedure AsTimeOf_12_38_11_09IsTTime;
  end;

implementation

procedure TTimeSpanTest.HourOf_12_38_11_09Is12;
begin
  CheckEquals(12, TTimeSpan.New(12, 38, 11, 9).Hour);
end;

procedure TTimeSpanTest.MinuteOf_12_38_11_09Is38;
begin
  CheckEquals(38, TTimeSpan.New(12, 38, 11, 9).Minute);
end;

procedure TTimeSpanTest.SecondOf_12_38_11_09Is11;
begin
  CheckEquals(11, TTimeSpan.New(12, 38, 11, 9).Second);
end;

procedure TTimeSpanTest.MillisecondOf_12_38_11_09Is9;
begin
  CheckEquals(9, TTimeSpan.New(12, 38, 11, 9).Millisecond);
end;

procedure TTimeSpanTest.AsTimeOf_12_38_11_09IsTTime;
begin
  CheckEquals(EncodeTime(12, 38, 11, 9), TTimeSpan.NewByTime(EncodeTime(12, 38, 11, 9)).AsTime);
end;

initialization

RegisterTest(TTimeSpanTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
