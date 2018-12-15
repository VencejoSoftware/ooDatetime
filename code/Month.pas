{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Month definition
  @created(12/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit Month;

interface

uses
  SysUtils, DateUtils,
  Year;
{$IFNDEF FPC}
{$IF CompilerVersion > 21}{$DEFINE FormatSettingsScope}{$IFEND}
{$ENDIF}

type
{$REGION 'documentation'}
{
  Data type for month number
  @value January
  @value February
  @value March
  @value April
  @value May
  @value June
  @value July
  @value August
  @value August
  @value September
  @value October
  @value November
  @value December
}
{$ENDREGION}
  TMonthNumber = (January = 1, February, March, April, May, June, July, August, September, October, November, December);

{$REGION 'documentation'}
{
  @abstract(Data type for day count)
}
{$ENDREGION}
  TDayCount = 1 .. 31;

{$REGION 'documentation'}
{
  @abstract(Month interface)
  Define a interface for month period
  @member(Name Month name)
  @member(ShortName Month short name)
  @member(Number Number of month)
  @member(StartAt Month start date
    @param(Year Year object)
    @return(Native date type)
  )
  @member(EndAt Month end date
    @param(Year Year object)
    @return(Native date type)
  )
  @member(
    DayCount Number of day in month
    @param(Year Year object)
    @return(Number with day amount)
  )
}
{$ENDREGION}

  IMonth = interface
    ['{D496116A-B179-4249-A857-4372444F03FD}']
    function Name: String;
    function ShortName: String;
    function Number: TMonthNumber;
    function StartAt(const Year: IYear): TDate;
    function EndAt(const Year: IYear): TDate;
    function DayCount(const Year: IYear): TDayCount;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IMonth))
  @member(Name @seealso(IMonth.Name))
  @member(ShortName @seealso(IMonth.ShortName))
  @member(Number @seealso(IMonth.Number))
  @member(StartAt @seealso(IMonth.StartAt))
  @member(EndAt @seealso(IMonth.EndAt))
  @member(DayCount @seealso(IMonth.DayCount))
  @member(
    Create Object constructor
    @param(Number Month number)
  )
  @member(
    New Create a new @classname as interface using a year and month number
    @param(Number Month number)
  )
  @member(
    NewByDate Create a new @classname as interface using a date
    @param(Date Date to parse)
  )
}
{$ENDREGION}

  TMonth = class sealed(TInterfacedObject, IMonth)
  strict private
    _Number: TMonthNumber;
  public
    function Name: String;
    function ShortName: String;
    function Number: TMonthNumber;
    function StartAt(const Year: IYear): TDate;
    function EndAt(const Year: IYear): TDate;
    function DayCount(const Year: IYear): TDayCount;
    constructor Create(const Number: TMonthNumber);
    class function New(const Number: TMonthNumber): IMonth;
    class function NewByDate(const Date: TDate): IMonth;
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

function TMonth.StartAt(const Year: IYear): TDate;
begin
  Result := EncodeDate(Year.Number, Ord(Number), 1);
end;

function TMonth.EndAt(const Year: IYear): TDate;
begin
  Result := EncodeDateTime(Year.Number, Ord(Number), DayCount(Year), 23, 59, 59, 999);
end;

function TMonth.DayCount(const Year: IYear): TDayCount;
begin
  Result := DaysInMonth(StartAt(Year));
end;

constructor TMonth.Create(const Number: TMonthNumber);
begin
  _Number := Number;
end;

class function TMonth.New(const Number: TMonthNumber): IMonth;
begin
  Result := TMonth.Create(Number);
end;

class function TMonth.NewByDate(const Date: TDate): IMonth;
begin
  Result := TMonth.New(TMonthNumber(MonthOf(Date)));
end;

end.
