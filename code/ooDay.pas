{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooDay;

interface

uses
  SysUtils, DateUtils,
  ooWeek, ooMonth, ooYear;
{$IFNDEF FPC}
{$IF CompilerVersion > 21}{$DEFINE FormatSettingsScope}{$IFEND}
{$ENDIF}

type
  TDayNumber = 1 .. 31;

  IDay = interface
    ['{B2E6B92D-CAD4-42FA-AE6C-7E47E6E5A3F8}']
    function Name: string;
    function ShortName: string;
    function Number: TDayNumber;
    function YearDayNumber: Word;
    function WeekDay: TWeekDay;
  end;

  TDay = class(TInterfacedObject, IDay)
  strict private
    _Number: TDayNumber;
    _YearDayNumber: Word;
    _WeekDay: TWeekDay;
  public
    function Name: string;
    function ShortName: string;
    function Number: TDayNumber;
    function YearDayNumber: Word;
    function WeekDay: TWeekDay;

    constructor Create(const Date: TDate);

    class function New(const Date: TDate): IDay;
  end;

implementation

function TDay.Name: string;
begin
  Result := {$IFDEF FormatSettingsScope}FormatSettings.{$ENDIF}LongDayNames[Ord(WeekDay)];
end;

function TDay.ShortName: string;
begin
  Result := {$IFDEF FormatSettingsScope}FormatSettings.{$ENDIF}ShortDayNames[Ord(WeekDay)];
end;

function TDay.Number: TDayNumber;
begin
  Result := _Number;
end;

function TDay.YearDayNumber: Word;
begin
  Result := _YearDayNumber;
end;

function TDay.WeekDay: TWeekDay;
begin
  Result := _WeekDay;
end;

constructor TDay.Create(const Date: TDate);
begin
  _Number := DayOf(Date);
  _WeekDay := TWeekDay(DayOfWeek(Date));
  _YearDayNumber := DayOfTheYear(Date);
end;

class function TDay.New(const Date: TDate): IDay;
begin
  Result := TDay.Create(Date);
end;

end.
