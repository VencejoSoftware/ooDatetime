{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooDateTimeEx;

interface

uses
  SysUtils;

type
  IDateTimeEx = interface
    ['{62832073-CFD2-4ACD-AECF-C71A394FADDF}']
    function Year: Word;
    function Month: Word;
    function Day: Word;
    function Hours: Word;
    function Minutes: Word;
    function Seconds: Word;
    function Milliseconds: Word;
    function AsString: String;
    function AsDateTime: TDateTime;

    procedure FromDateTime(const DateTime: TDateTime);
    procedure FromString(const Text: String);
  end;

  TDateTimeEx = class(TInterfacedObject, IDateTimeEx)
  strict private
    _DateTime: String;
  public
    function Year: Word;
    function Month: Word;
    function Day: Word;
    function Hours: Word;
    function Minutes: Word;
    function Seconds: Word;
    function Milliseconds: Word;
    function AsString: String;
    function AsDateTime: TDateTime;

    procedure FromDateTime(const DateTime: TDateTime);
    procedure FromString(const Text: String);

    class function New(const DateTime: TDateTime): IDateTimeEx; overload; static;
    class function New(const Text: String): IDateTimeEx; overload; static;
  end;

implementation

function TDateTimeEx.Year: Word;
begin
  try
    Result := StrToInt(Copy(AsString, 1, 4));
  except
    Result := 1899;
  end;
end;

function TDateTimeEx.Month: Word;
begin
  try
    Result := StrToInt(Copy(AsString, 5, 2));
  except
    Result := 12;
  end;
end;

function TDateTimeEx.Day: Word;
begin
  try
    Result := StrToInt(Copy(AsString, 7, 2));
  except
    Result := 30;
  end;
end;

function TDateTimeEx.Hours: Word;
begin
  try
    Result := StrToInt(Copy(AsString, 9, 2));
  except
    Result := 0;
  end;
end;

function TDateTimeEx.Minutes: Word;
begin
  try
    Result := StrToInt(Copy(AsString, 11, 2));
  except
    Result := 0;
  end;
end;

function TDateTimeEx.Seconds: Word;
begin
  try
    Result := StrToInt(Copy(AsString, 13, 2));
  except
    Result := 0;
  end;
end;

function TDateTimeEx.Milliseconds: Word;
begin
  try
    Result := StrToInt(Copy(AsString, 15, Length(AsString) - 14));
  except
    Result := 0;
  end;
end;

function TDateTimeEx.AsString: String;
begin
  Result := _DateTime;
end;

function TDateTimeEx.AsDateTime: TDateTime;
begin
  Result := EncodeDate(Year, Month, Day) + EncodeTime(Hours, Minutes, Seconds, Milliseconds);
end;

procedure TDateTimeEx.FromDateTime(const DateTime: TDateTime);
var
  iYear, iMonth, iDay: Word;
  iHour, iMin, iSec, iMSec: Word;
begin
  DecodeDate(DateTime, iYear, iMonth, iDay);
  DecodeTime(DateTime, iHour, iMin, iSec, iMSec);
  FromString(Format('%.4d%.2d%.2d%.2d%.2d%.2d%d', [iYear, iMonth, iDay, iHour, iMin, iSec, iMSec]));
end;

procedure TDateTimeEx.FromString(const Text: String);
begin
  _DateTime := TrimRight(Text);
end;

class function TDateTimeEx.New(const DateTime: TDateTime): IDateTimeEx;
begin
  Result := TDateTimeEx.Create;
  Result.FromDateTime(DateTime);
end;

class function TDateTimeEx.New(const Text: String): IDateTimeEx;
begin
  Result := TDateTimeEx.Create;
  Result.FromString(Text);
end;

end.
