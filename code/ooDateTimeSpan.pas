{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Date/time span definition
  @created(12/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooDateTimeSpan;

interface

uses
  ooDaySpan,
  ooTimeSpan;

type
{$REGION 'documentation'}
{
  @abstract(Month interface)
  Define a interface for date/time span
  @member(DaySpan Day span object)
  @member(TimeSpan Time span object)
  @member(AsDateTime Cast date/time span objet to native TDateTime)
}
{$ENDREGION}
  IDateTimeSpan = interface
    ['{6A034CB8-7205-470B-88A9-8BB511310EFF}']
    function DaySpan: IDaySpan;
    function TimeSpan: ITimeSpan;
    function AsDateTime: TDateTime;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IDateTimeSpan))
  @member(DaySpan @seealso(IDateTimeSpan.DaySpan))
  @member(TimeSpan @seealso(IDateTimeSpan.TimeSpan))
  @member(AsDateTime @seealso(IDateTimeSpan.AsDateTime))
  @member(
    Create Object constructor
    @param(DaySpan Day span object)
    @param(TimeSpan Time span object)
  )
  @member(
    New Create a new @classname as interface using a year and month number
    @param(DaySpan Day span object)
    @param(TimeSpan Time span object)
  )
  @member(
    NewByDateTime Create a new @classname as interface using a datetime
    @param(DateTime Datetime to parse)
  )
}
{$ENDREGION}

  TDateTimeSpan = class sealed(TInterfacedObject, IDateTimeSpan)
  strict private
    _DaySpan: IDaySpan;
    _TimeSpan: ITimeSpan;
  public
    function DaySpan: IDaySpan;
    function TimeSpan: ITimeSpan;
    function AsDateTime: TDateTime;
    constructor Create(const DaySpan: IDaySpan; const TimeSpan: ITimeSpan);
    class function New(const DaySpan: IDaySpan; const TimeSpan: ITimeSpan): IDateTimeSpan;
    class function NewByDateTime(const DateTime: TDateTime): IDateTimeSpan;
  end;

implementation

function TDateTimeSpan.DaySpan: IDaySpan;
begin
  Result := _DaySpan;
end;

function TDateTimeSpan.TimeSpan: ITimeSpan;
begin
  Result := _TimeSpan;
end;

function TDateTimeSpan.AsDateTime: TDateTime;
begin
  Result := DaySpan.AsDate + TimeSpan.AsTime;
end;

constructor TDateTimeSpan.Create(const DaySpan: IDaySpan; const TimeSpan: ITimeSpan);
begin
  _DaySpan := DaySpan;
  _TimeSpan := TimeSpan;
end;

class function TDateTimeSpan.New(const DaySpan: IDaySpan; const TimeSpan: ITimeSpan): IDateTimeSpan;
begin
  Result := TDateTimeSpan.Create(DaySpan, TimeSpan);
end;

class function TDateTimeSpan.NewByDateTime(const DateTime: TDateTime): IDateTimeSpan;
begin
  Result := TDateTimeSpan.New(TDaySpan.NewByDate(DateTime), TTimeSpan.NewByTime(DateTime));
end;

end.
