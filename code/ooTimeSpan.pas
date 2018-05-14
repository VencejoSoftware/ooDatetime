{$REGION 'documentation'}
{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
{
  Time span definition
  @created(12/05/2018)
  @author Vencejo Software <www.vencejosoft.com>
}
{$ENDREGION}
unit ooTimeSpan;

interface

uses
  SysUtils;

type
{$REGION 'documentation'}
{
  Data type for hour number
}
{$ENDREGION}
  THour = 0 .. 23;
{$REGION 'documentation'}
{
  Data type for minute number
}
{$ENDREGION}
  TMinute = 0 .. 59;
{$REGION 'documentation'}
{
  Data type for second number
}
{$ENDREGION}
  TSecond = TMinute;
{$REGION 'documentation'}
{
  Data type for millisecond number
}
{$ENDREGION}
  TMillisecond = 0 .. 999;

{$REGION 'documentation'}
{
  @abstract(Time interface)
  Define a interface for time span
  @member(Hour Hours of time)
  @member(Minute Minutes  of time)
  @member(Second Seconds of time)
  @member(Millisecond Milliseconds of time)
  @member(AsTime Cast object as native TTime data type)
}
{$ENDREGION}

  ITimeSpan = interface
    ['{8412BD21-7039-496A-B117-1FD2B3B6C6F8}']
    function Hour: THour;
    function Minute: TMinute;
    function Second: TSecond;
    function Millisecond: TMillisecond;
    function AsTime: TTime;
  end;

{$REGION 'documentation'}
{
  @abstract(Implementation of @link(ITimeSpan))
  @member(Hour @seealso(ITimeSpan.Hour))
  @member(Minute @seealso(ITimeSpan.Minute))
  @member(Second @seealso(ITimeSpan.Second))
  @member(Millisecond @seealso(ITimeSpan.Millisecond))
  @member(AsTime @seealso(ITimeSpan.AsTime))
  @member(
    Create Object constructor
    @param(Hour Hours of time)
    @param(Minute Minutes  of time)
    @param(Second Seconds of time)
    @param(Millisecond Milliseconds of time)
  )
  @member(
    New Create a new @classname as interface using a year number
    @param(Hour Hours of time)
    @param(Minute Minutes  of time)
    @param(Second Seconds of time)
    @param(Millisecond Milliseconds of time)
  )
  @member(
    NewByDate Create a new @classname as interface using a time date value
    @param(Value Time to parse)
  )
}
{$ENDREGION}

  TTimeSpan = class sealed(TInterfacedObject, ITimeSpan)
  strict private
    _Hour: THour;
    _Minute: TMinute;
    _Second: TSecond;
    _Millisecond: TMillisecond;
  public
    function Hour: THour;
    function Minute: TMinute;
    function Second: TSecond;
    function Millisecond: TMillisecond;
    function AsTime: TTime;
    constructor Create(const Hour: THour; const Minute: TMinute; const Second: TSecond;
      const Millisecond: TMillisecond);
    class function New(const Hour: THour; const Minute: TMinute; const Second: TSecond; const Millisecond: TMillisecond)
      : ITimeSpan;
    class function NewByTime(const Value: TDateTime): ITimeSpan;
  end;

implementation

function TTimeSpan.Hour: THour;
begin
  Result := _Hour;
end;

function TTimeSpan.Minute: TMinute;
begin
  Result := _Minute;
end;

function TTimeSpan.Second: TSecond;
begin
  Result := _Second;
end;

function TTimeSpan.Millisecond: TMillisecond;
begin
  Result := _Millisecond;
end;

function TTimeSpan.AsTime: TTime;
begin
  Result := EncodeTime(Hour, Minute, Second, Millisecond);
end;

constructor TTimeSpan.Create(const Hour: THour; const Minute: TMinute; const Second: TSecond;
  const Millisecond: TMillisecond);
begin
  _Hour := Hour;
  _Minute := Minute;
  _Second := Second;
  _Millisecond := Millisecond;
end;

class function TTimeSpan.New(const Hour: THour; const Minute: TMinute; const Second: TSecond;
  const Millisecond: TMillisecond): ITimeSpan;
begin
  Result := TTimeSpan.Create(Hour, Minute, Second, Millisecond);
end;

class function TTimeSpan.NewByTime(const Value: TDateTime): ITimeSpan;
var
  Hour, Minute, Second, Millisecond: Word;
begin
  DecodeTime(Value, Hour, Minute, Second, Millisecond);
  Result := TTimeSpan.New(Hour, Minute, Second, Millisecond);
end;

end.
