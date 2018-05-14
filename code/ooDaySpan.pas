{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Day span definition
  @created(12/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooDaySpan;

interface

uses
  DateUtils, SysUtils,
  ooYear,
  ooMonth,
  ooWeek;
{$IFNDEF FPC}
{$IF CompilerVersion > 21}{$DEFINE FormatSettingsScope}{$IFEND}
{$ENDIF}

type
{$REGION 'documentation'}
{
  Data type for weekday
  @value Sunday
  @value Monday
  @value Tuesday
  @value Wednesday
  @value Thursday
  @value Friday
  @value Saturday
}
{$ENDREGION}
  TWeekDay = (Sunday = 1, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday);
{$REGION 'documentation'}
{
  Set of week day
}
{$ENDREGION}
  TWeekDaySet = set of TWeekDay;

{$REGION 'documentation'}
{
  Data type for day number
}
{$ENDREGION}
  TDayNumber = 1 .. 31;

{$REGION 'documentation'}
{
  @abstract(Day span interface)
  Define a interface for day span
  @member(Name Month name)
  @member(ShortName Month short name)
  @member(Number Number of month)
  @member(YearDayNumber Number of day in the year)
  @member(WeekDay Week day)
  @member(Week Week object part)
  @member(Month Month object part)
  @member(Year Year object part)
  @member(AsDate Cast day span objet to native TDate)
}
{$ENDREGION}

  IDaySpan = interface
    ['{201CAB52-EA6F-444D-9969-C40E5B38D7EE}']
    function Name: string;
    function ShortName: string;
    function Number: TDayNumber;
    function YearDayNumber: Word;
    function WeekDay: TWeekDay;
    function Week: IWeek;
    function Month: IMonth;
    function Year: IYear;
    function AsDate: TDate;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IDaySpan))
  @member(Name @seealso(IDaySpan.Name))
  @member(ShortName @seealso(IDaySpan.ShortName))
  @member(Number @seealso(IDaySpan.Number))
  @member(YearDayNumber @seealso(IDaySpan.YearDayNumber))
  @member(WeekDay @seealso(IDaySpan.WeekDay))
  @member(Week @seealso(IDaySpan.Week))
  @member(Month @seealso(IDaySpan.Month))
  @member(Year @seealso(IDaySpan.Year))
  @member(AsDate @seealso(IDaySpan.AsDate))


  @member(
    Create Object constructor
    @param(Number Day number)
    @param(Month Day month owner object)
    @param(Year Day year owner object)
  )
  @member(
    New Create a new @classname as interface using a year and month number
    @param(Number Day number)
    @param(Month Day month owner object)
    @param(Year Day year owner object)
  )
  @member(
    NewByDate Create a new @classname as interface using a date
    @param(Date Date to parse)
  )
}
{$ENDREGION}

  TDaySpan = class(TInterfacedObject, IDaySpan)
  strict private
    _Number: TDayNumber;
    _Month: IMonth;
    _Year: IYear;
  public
    function Name: string;
    function ShortName: string;
    function Number: TDayNumber;
    function YearDayNumber: Word;
    function WeekDay: TWeekDay;
    function Week: IWeek;
    function Month: IMonth;
    function Year: IYear;
    function AsDate: TDate;
    constructor Create(const Number: TDayNumber; const Month: IMonth; const Year: IYear);
    class function New(const Number: TDayNumber; const Month: IMonth; const Year: IYear): IDaySpan;
    class function NewByDate(const Date: TDate): IDaySpan;
  end;

implementation

function TDaySpan.Name: string;
begin
  Result := {$IFDEF FormatSettingsScope}FormatSettings.{$ENDIF}LongDayNames[Ord(WeekDay)];
end;

function TDaySpan.ShortName: string;
begin
  Result := {$IFDEF FormatSettingsScope}FormatSettings.{$ENDIF}ShortDayNames[Ord(WeekDay)];
end;

function TDaySpan.Number: TDayNumber;
begin
  Result := _Number;
end;

function TDaySpan.YearDayNumber: Word;
begin
  Result := DayOfTheYear(AsDate);
end;

function TDaySpan.WeekDay: TWeekDay;
begin
  Result := TWeekDay(DayOfWeek(AsDate));
end;

function TDaySpan.Week: IWeek;
begin
  Result := TWeek.NewByDate(AsDate);
end;

function TDaySpan.Month: IMonth;
begin
  Result := _Month;
end;

function TDaySpan.Year: IYear;
begin
  Result := _Year;
end;

function TDaySpan.AsDate: TDate;
begin
  Result := EncodeDate(Year.Number, Ord(Month.Number), Number);
end;

constructor TDaySpan.Create(const Number: TDayNumber; const Month: IMonth; const Year: IYear);
begin
  _Number := Number;
  _Month := Month;
  _Year := Year;
end;

class function TDaySpan.New(const Number: TDayNumber; const Month: IMonth; const Year: IYear): IDaySpan;
begin
  Result := TDaySpan.Create(Number, Month, Year);
end;

class function TDaySpan.NewByDate(const Date: TDate): IDaySpan;
var
  Day, Month, Year: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := TDaySpan.New(Day, TMonth.New(TMonthNumber(Month)), TYear.New(Year));
end;

end.
