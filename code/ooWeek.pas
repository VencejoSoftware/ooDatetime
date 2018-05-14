{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Week definition
  @created(12/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION
}unit ooWeek;

interface

uses
  DateUtils,
  ooYear;

type
{$REGION 'documentation'}
{
  @abstract(Data type for week number)
}
{$ENDREGION}
  TWeekNumber = 1 .. 52;
{$REGION 'documentation'}
{
  @abstract(Data type for week number into month)
}
{$ENDREGION}
  TWeekMonthNumber = 1 .. 4;

{$REGION 'documentation'}
{
  @abstract(Week interface)
  Define a interface for week period
  @member(Number Week number)
  @member(
    NumberInMonth Week number into month
    @param(Year Year object)
    @return(Number with number in month)
  )
  @member(
    StartAt Week date start
    @param(Year Year object)
    @return(Native date type)
  )
  @member(
    EndAt Week date end
    @param(Year Year object)
    @return(Native date type)
  )
}
{$ENDREGION}

  IWeek = interface
    ['{E8533C0E-10C7-4A86-ADCB-CFB965A44D72}']
    function Number: TWeekNumber;
    function NumberInMonth(const Year: IYear): TWeekMonthNumber;
    function StartAt(const Year: IYear): TDate;
    function EndAt(const Year: IYear): TDate;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IWeek))
  @member(Number @seealso(IWeek.Number))
  @member(NumberInMonth @seealso(IWeek.NumberInMonth))
  @member(StartAt @seealso(IWeek.StartAt))
  @member(EndAt @seealso(IWeek.EndAt))
  @member(
    Create Object constructor
    @param(Number Week number)
  )
  @member(
    New Create a new @classname as interface using a week number and year
    @param(Number Week number)
  )
  @member(
    NewByDate Create a new @classname as interface using a date
    @param(Date Date to parse)
  )
}
{$ENDREGION}

  TWeek = class sealed(TInterfacedObject, IWeek)
  strict private
    _Number: TWeekNumber;
  public
    function Number: TWeekNumber;
    function NumberInMonth(const Year: IYear): TWeekMonthNumber;
    function StartAt(const Year: IYear): TDate;
    function EndAt(const Year: IYear): TDate;
    constructor Create(const Number: TWeekNumber);
    class function NewByDate(const Date: TDate): IWeek;
    class function New(const Number: TWeekNumber): IWeek;
  end;

implementation

function TWeek.Number: TWeekNumber;
begin
  Result := _Number;
end;

function TWeek.NumberInMonth(const Year: IYear): TWeekMonthNumber;
begin
  Result := DateUtils.WeekOfTheMonth(StartAt(Year));
end;

function TWeek.StartAt(const Year: IYear): TDate;
begin
  Result := StartOfAWeek(Year.Number, Number);
end;

function TWeek.EndAt(const Year: IYear): TDate;
begin
  Result := EndOfAWeek(Year.Number, Number);
end;

constructor TWeek.Create(const Number: TWeekNumber);
begin
  _Number := Number;
end;

class function TWeek.New(const Number: TWeekNumber): IWeek;
begin
  Result := TWeek.Create(Number);
end;

class function TWeek.NewByDate(const Date: TDate): IWeek;
begin
  Result := TWeek.New(DateUtils.WeekOfTheYear(Date));
end;

end.
