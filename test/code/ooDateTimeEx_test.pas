{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooDateTimeEx_test;

interface

uses
  SysUtils, DateUtils,
  ooDateTimeEx,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};

type
  TDateTimeExTest = class(TTestCase)
  published
    procedure TestYear;
    procedure TestMonth;
    procedure TestDay;
    procedure TestHours;
    procedure TestMinutes;
    procedure TestSeconds;
    procedure TestMilliseconds;
    procedure TestAsString;
    procedure TestAsDateTime;
    procedure TestFromDateTime;
    procedure TestFromZeroDateTime;
    procedure TestFromString;
    procedure TestFromStringOnlyDate;
    procedure TestFromStringOnlyTime;
    procedure TestFromNullString;
  end;

implementation

procedure TDateTimeExTest.TestAsDateTime;
var
  CurrentDateTime: TDateTime;
begin
  CurrentDateTime := Now;
  CheckEquals(CurrentDateTime, TDateTimeEx.New(CurrentDateTime).AsDateTime);
end;

procedure TDateTimeExTest.TestAsString;
var
  CurrentDateTime: TDateTime;
begin
  CurrentDateTime := Now;
{$IFDEF FPC}
  CheckEquals(FormatDateTime('yyyyMMddhhnnssz', CurrentDateTime), TDateTimeEx.New(CurrentDateTime).AsString);
{$ELSE}
  CheckEqualsString(FormatDateTime('yyyyMMddhhnnssz', CurrentDateTime), TDateTimeEx.New(CurrentDateTime).AsString);
{$ENDIF}
end;

procedure TDateTimeExTest.TestFromDateTime;
var
  CurrentDateTime: TDateTime;
begin
  CurrentDateTime := Now;
  CheckEquals(CurrentDateTime, TDateTimeEx.New(CurrentDateTime).AsDateTime);
end;

procedure TDateTimeExTest.TestFromZeroDateTime;
begin
  CheckEquals(0, TDateTimeEx.New(0).AsDateTime);
end;

procedure TDateTimeExTest.TestFromString;
begin
  CheckEquals(StrToDateTime('21/02/2017 16:23:12.34'), TDateTimeEx.New('2017022116231234').AsDateTime);
end;

procedure TDateTimeExTest.TestFromStringOnlyDate;
begin
  CheckEquals(StrToDateTime('21/02/2017'), TDateTimeEx.New('20170221').AsDateTime);
end;

procedure TDateTimeExTest.TestFromStringOnlyTime;
begin
  CheckEquals(StrToDateTime('30/12/1899 20:19:18.176'), TDateTimeEx.New('        201918176').AsDateTime);
end;

procedure TDateTimeExTest.TestFromNullString;
begin
  CheckEquals(StrToDateTime('30/12/1899 0:0:0.0'), TDateTimeEx.New(EmptyStr).AsDateTime);
end;

procedure TDateTimeExTest.TestYear;
begin
  CheckEquals(YearOf(Now), TDateTimeEx.New(Now).Year);
end;

procedure TDateTimeExTest.TestMonth;
begin
  CheckEquals(MonthOf(Now), TDateTimeEx.New(Now).Month);
end;

procedure TDateTimeExTest.TestDay;
begin
  CheckEquals(DayOf(Now), TDateTimeEx.New(Now).Day);
end;

procedure TDateTimeExTest.TestHours;
begin
  CheckEquals(HourOf(Now), TDateTimeEx.New(Now).Hours);
end;

procedure TDateTimeExTest.TestMinutes;
begin
  CheckEquals(MinuteOf(Now), TDateTimeEx.New(Now).Minutes);
end;

procedure TDateTimeExTest.TestSeconds;
begin
  CheckEquals(SecondOf(Now), TDateTimeEx.New(Now).Seconds);
end;

procedure TDateTimeExTest.TestMilliseconds;
var
  CurrentDateTime: TDateTime;
begin
  CurrentDateTime := Now;
  CheckEquals(MilliSecondOf(CurrentDateTime), TDateTimeEx.New(CurrentDateTime).Milliseconds);
end;

initialization

RegisterTest(TDateTimeExTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
