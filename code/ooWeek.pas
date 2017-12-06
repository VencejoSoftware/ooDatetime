{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooWeek;

interface

uses
  DateUtils;

type
  TWeekDay = (wdnSunday = 1, wdnMonday = 2, wdnTuesday = 3, wdnWednesday = 4, wdnThursday = 5, wdnFriday = 6,
    wdnSaturday = 7);
  TWeekDaySet = set of TWeekDay;
  TWeekInYear = 1 .. 52;
  TWeekInMonth = 1 .. 4;

  IWeek = interface
    ['{E8533C0E-10C7-4A86-ADCB-CFB965A44D72}']
    function Number: TWeekInYear;
    function NumberInMonth: TWeekInMonth;
    function StartAt: TDate;
    function EndAt: TDate;
  end;

  TWeek = class(TInterfacedObject, IWeek)
  strict private
    _Number: TWeekInYear;
    _NumberInMonth: TWeekInMonth;
    _StartAt: TDate;
    _EndAt: TDate;
  public
    function Number: TWeekInYear;
    function NumberInMonth: TWeekInMonth;
    function StartAt: TDate;
    function EndAt: TDate;

    constructor Create(const Date: TDate);

    class function New(const Date: TDate): IWeek;
  end;

implementation

function TWeek.StartAt: TDate;
begin
  Result := _StartAt;
end;

function TWeek.EndAt: TDate;
begin
  Result := _EndAt;
end;

function TWeek.Number: TWeekInYear;
begin
  Result := _Number;
end;

function TWeek.NumberInMonth: TWeekInMonth;
begin
  Result := _NumberInMonth;
end;

constructor TWeek.Create(const Date: TDate);
begin
  _Number := DateUtils.WeekOfTheYear(Date);
  _NumberInMonth := DateUtils.WeekOfTheMonth(Date);
  _StartAt := Trunc(StartOfTheWeek(Date));
  _EndAt := Trunc(EndOfTheWeek(Date));
end;

class function TWeek.New(const Date: TDate): IWeek;
begin
  Result := TWeek.Create(Date);
end;

end.
