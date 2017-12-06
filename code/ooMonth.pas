{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooMonth;

interface

uses
  SysUtils, DateUtils;
{$IFNDEF FPC}
{$IF CompilerVersion > 21}{$DEFINE FormatSettingsScope}{$IFEND}
{$ENDIF}

type
  TMonthNumber = (mynJanuary, mynFebruary, mynMarch, mynApril, mynMay, mynJune, mynJuly, mynAugust, mynSeptember,
    mynOctober, mynNovember, mynDecember);

  IMonth = interface
    ['{D496116A-B179-4249-A857-4372444F03FD}']
    function Name: String;
    function ShortName: String;
    function Number: TMonthNumber;
    function StartAt: TDate;
    function EndAt: TDate;
    function DayCount: ShortInt;
  end;

  TMonth = class(TInterfacedObject, IMonth)
  strict private
    _Number: TMonthNumber;
    _StartAt: TDate;
    _EndAt: TDate;
    _DayCount: ShortInt;
  public
    function Name: String;
    function ShortName: String;
    function Number: TMonthNumber;
    function StartAt: TDate;
    function EndAt: TDate;
    function DayCount: ShortInt;

    constructor Create(const Date: TDate);

    class function New(const Date: TDate): IMonth;
  end;

implementation

function TMonth.Name: String;
begin
  Result := {$IFDEF FormatSettingsScope}FormatSettings.{$ENDIF} LongMonthNames[Ord(_Number)];
end;

function TMonth.ShortName: String;
begin
  Result := {$IFDEF FormatSettingsScope} FormatSettings.{$ENDIF} ShortMonthNames[Ord(_Number)];
end;

function TMonth.Number: TMonthNumber;
begin
  Result := _Number;
end;

function TMonth.StartAt: TDate;
begin
  Result := _StartAt;
end;

function TMonth.EndAt: TDate;
begin
  Result := _EndAt;
end;

function TMonth.DayCount: ShortInt;
begin
  Result := _DayCount;
end;

constructor TMonth.Create(const Date: TDate);
begin
  _Number := TMonthNumber(MonthOf(Date));
  _StartAt := StartOfTheMonth(Date);
  _EndAt := Trunc(EndOfTheMonth(Date));
  _DayCount := Trunc(DaysInMonth(Date));
end;

class function TMonth.New(const Date: TDate): IMonth;
begin
  Result := TMonth.Create(Date);
end;

end.
