{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Year definition
  @created(12/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooYear;

interface

uses
  SysUtils, DateUtils;

type
{$REGION 'documentation'}
{
  @abstract(Data type for year number)
}
{$ENDREGION}
  TYearNumber = - 5000 .. 5000;

{$REGION 'documentation'}
{
  @abstract(Year interface)
  Define a interface for year period
  @member(Number Year number)
  @member(IsLeap Checks if is a leap year)
}
{$ENDREGION}

  IYear = interface
    ['{DB932445-75DA-43DB-8568-550AF29B90A1}']
    function Number: TYearNumber;
    function IsLeap: Boolean;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(IYear))
  @member(Number @seealso(IYear.Number))
  @member(IsLeap @seealso(IYear.IsLeap))
  @member(
    Create Object constructor
    @param(Number Year number)
  )
  @member(
    New Create a new @classname as interface using a year number
    @param(Number Year number)
  )
  @member(
    NewByDate Create a new @classname as interface using a date
    @param(Date Date to parse)
  )
}
{$ENDREGION}

  TYear = class sealed(TInterfacedObject, IYear)
  strict private
    _Number: TYearNumber;
  public
    function Number: TYearNumber;
    function IsLeap: Boolean;
    constructor Create(const Number: TYearNumber);
    class function NewByDate(const Date: TDate): IYear;
    class function New(const Number: TYearNumber): IYear;
  end;

implementation

function TYear.Number: TYearNumber;
begin
  Result := _Number;
end;

function TYear.IsLeap: Boolean;
begin
  Result := IsLeapYear(_Number);
end;

constructor TYear.Create(const Number: TYearNumber);
begin
  _Number := Number;
end;

class function TYear.New(const Number: TYearNumber): IYear;
begin
  Result := TYear.Create(Number);
end;

class function TYear.NewByDate(const Date: TDate): IYear;
begin
  Result := TYear.Create(YearOf(Date));
end;

end.
