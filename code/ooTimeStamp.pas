{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooTimeStamp;

interface

uses
  SysUtils;

type
  ITimeStamp = interface
    ['{8412BD21-7039-496A-B117-1FD2B3B6C6F8}']
    function Hours: Word;
    function Minutes: Word;
    function Seconds: Word;
    function Milliseconds: Word;
    function AsTime: TTime;
  end;

  TTimeStamp = class(TInterfacedObject, ITimeStamp)
  strict private
    _Hours: Word;
    _Minutes: Word;
    _Seconds: Word;
    _Milliseconds: Word;
  public
    function Hours: Word;
    function Minutes: Word;
    function Seconds: Word;
    function Milliseconds: Word;
    function AsTime: TTime;

    constructor Create(const TimeData: TDateTime);

    class function New(const TimeData: TDateTime): ITimeStamp;
  end;

implementation

function TTimeStamp.Hours: Word;
begin
  Result := _Hours;
end;

function TTimeStamp.Milliseconds: Word;
begin
  Result := _Milliseconds;
end;

function TTimeStamp.Minutes: Word;
begin
  Result := _Minutes;
end;

function TTimeStamp.Seconds: Word;
begin
  Result := _Seconds;
end;

function TTimeStamp.AsTime: TTime;
begin
  Result := EncodeTime(Hours, Minutes, Seconds, Milliseconds);
end;

constructor TTimeStamp.Create(const TimeData: TDateTime);
begin
  DecodeTime(TimeData, _Hours, _Minutes, _Seconds, _Milliseconds);
end;

class function TTimeStamp.New(const TimeData: TDateTime): ITimeStamp;
begin
  Result := TTimeStamp.Create(TimeData);
end;

end.
