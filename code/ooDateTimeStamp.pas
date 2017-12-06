{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooDateTimeStamp;

interface

uses
  ooDateStamp, ooTimeStamp;

type
  IDateTimeStamp = interface
    ['{6A034CB8-7205-470B-88A9-8BB511310EFF}']
    function DateStamp: IDateStamp;
    function TimeStamp: ITimeStamp;
    function AsDateTime: TDateTime;
  end;

  TDateTimeStamp = class(TInterfacedObject, IDateTimeStamp)
  strict private
    _DateStamp: IDateStamp;
    _TimeStamp: ITimeStamp;
  public
    function DateStamp: IDateStamp;
    function TimeStamp: ITimeStamp;
    function AsDateTime: TDateTime;

    constructor Create(const DateStampData: IDateStamp; const TimeStampData: ITimeStamp);

    class function New(const DateStampData: IDateStamp; const TimeStampData: ITimeStamp): IDateTimeStamp;
    class function NewFromDate(const Date: TDate): IDateTimeStamp;
  end;

implementation

function TDateTimeStamp.DateStamp: IDateStamp;
begin
  Result := _DateStamp;
end;

function TDateTimeStamp.TimeStamp: ITimeStamp;
begin
  Result := _TimeStamp;
end;

function TDateTimeStamp.AsDateTime: TDateTime;
begin
  Result := DateStamp.AsDate + TimeStamp.AsTime;
end;

constructor TDateTimeStamp.Create(const DateStampData: IDateStamp; const TimeStampData: ITimeStamp);
begin
  _DateStamp := DateStampData;
  _TimeStamp := TimeStampData;
end;

class function TDateTimeStamp.New(const DateStampData: IDateStamp; const TimeStampData: ITimeStamp): IDateTimeStamp;
begin
  Result := TDateTimeStamp.Create(DateStampData, TimeStampData);
end;

class function TDateTimeStamp.NewFromDate(const Date: TDate): IDateTimeStamp;
begin
  Result := TDateTimeStamp.New(TDateStamp.NewFromDate(Date), TTimeStamp.New(Date));
end;

end.
