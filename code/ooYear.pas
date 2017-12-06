{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooYear;

interface

uses
  SysUtils, DateUtils;

type
  IYear = interface
    ['{DB932445-75DA-43DB-8568-550AF29B90A1}']
    function Number: Integer;
    function IsLeap: Boolean;
  end;

  TYear = class(TInterfacedObject, IYear)
  strict private
    _Number: Integer;
  public
    function Number: Integer;
    function IsLeap: Boolean;

    constructor Create(const Date: TDate);

    class function New(const Date: TDate): IYear;
  end;

implementation

function TYear.Number: Integer;
begin
  Result := _Number;
end;

constructor TYear.Create(const Date: TDate);
begin
  _Number := YearOf(Date);
end;

function TYear.IsLeap: Boolean;
begin
  Result := IsLeapYear(_Number);
end;

class function TYear.New(const Date: TDate): IYear;
begin
  Result := TYear.Create(Date);
end;

end.
