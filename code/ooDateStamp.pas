{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooDateStamp;

interface

uses
  DateUtils,
  ooYear, ooMonth, ooWeek, ooDay;

type
  IDateStamp = interface
    ['{201CAB52-EA6F-444D-9969-C40E5B38D7EE}']
    function Year: IYear;
    function Month: IMonth;
    function Week: IWeek;
    function Day: IDay;
    function AsDate: TDate;
  end;

  TDateStamp = class(TInterfacedObject, IDateStamp)
  strict private
    _Year: IYear;
    _Month: IMonth;
    _Week: IWeek;
    _Day: IDay;
  public
    function Year: IYear;
    function Month: IMonth;
    function Week: IWeek;
    function Day: IDay;
    function AsDate: TDate;

    constructor Create(const YearData: IYear; const MonthData: IMonth; const WeekData: IWeek; const DayData: IDay);

    class function New(const YearData: IYear; const MonthData: IMonth; const WeekData: IWeek;
      const DayData: IDay): IDateStamp;
    class function NewFromDate(const Date: TDate): IDateStamp;
  end;

implementation

function TDateStamp.Day: IDay;
begin
  Result := _Day;
end;

function TDateStamp.Month: IMonth;
begin
  Result := _Month;
end;

function TDateStamp.Week: IWeek;
begin
  Result := _Week;
end;

function TDateStamp.Year: IYear;
begin
  Result := _Year;
end;

function TDateStamp.AsDate: TDate;
begin
  Result := EncodeDateTime(Year.Number, Ord(Month.Number), Ord(Day.Number), 0, 0, 0, 0);
end;

constructor TDateStamp.Create(const YearData: IYear; const MonthData: IMonth; const WeekData: IWeek;
  const DayData: IDay);
begin
  _Year := YearData;
  _Month := MonthData;
  _Week := WeekData;
  _Day := DayData;
end;

class function TDateStamp.New(const YearData: IYear; const MonthData: IMonth; const WeekData: IWeek;
  const DayData: IDay): IDateStamp;
begin
  Result := TDateStamp.Create(YearData, MonthData, WeekData, DayData);
end;

class function TDateStamp.NewFromDate(const Date: TDate): IDateStamp;
begin
  Result := TDateStamp.New(TYear.New(Date), TMonth.New(Date), TWeek.New(Date), TDay.New(Date));
end;

end.
