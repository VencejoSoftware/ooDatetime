{
  Copyright (c) 2018, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit ooDaySpan_test;

interface

uses
  SysUtils,
  ooDaySpan,
  ooWeek,
  ooMonth,
  ooYear,
{$IFDEF FPC}
  fpcunit, testregistry
{$ELSE}
  TestFramework
{$ENDIF};
{$IFNDEF FPC}
{$IF CompilerVersion > 21}{$DEFINE FormatSettingsScope}{$IFEND}
{$ENDIF}

type
  TDaySpanTest = class sealed(TTestCase)
  published
    procedure NameOf20_7_2017IsThursday;
    procedure ShortNameOf20_7_2017IsThursday;
    procedure NumberOf20_7_2017Is20;
    procedure YearDayNumberOf20_7_2017Is201;
    procedure WeekdayOf20_7_2017Is5;
    procedure WeekNumberOf20_7_2017Is3;
    procedure AsDateOf20_7_2017IsTDate;
  end;

implementation

procedure TDaySpanTest.NameOf20_7_2017IsThursday;
begin
  CheckEquals({$IFDEF FormatSettingsScope} FormatSettings.
{$ENDIF} LongDayNames[5], TDaySpan.New(20, TMonth.New(TMonthNumber.July), TYear.New(2017)).Name);
end;

procedure TDaySpanTest.ShortNameOf20_7_2017IsThursday;
begin
  CheckEquals({$IFDEF FormatSettingsScope} FormatSettings.
{$ENDIF} ShortDayNames[5], TDaySpan.New(20, TMonth.New(TMonthNumber.July), TYear.New(2017)).ShortName);
end;

procedure TDaySpanTest.NumberOf20_7_2017Is20;
begin
  CheckEquals(20, TDaySpan.New(20, TMonth.New(TMonthNumber.July), TYear.New(2017)).Number);
end;

procedure TDaySpanTest.YearDayNumberOf20_7_2017Is201;
begin
  CheckEquals(201, TDaySpan.New(20, TMonth.New(TMonthNumber.July), TYear.New(2017)).YearDayNumber);
end;

procedure TDaySpanTest.WeekdayOf20_7_2017Is5;
begin
  CheckEquals(5, Ord(TDaySpan.New(20, TMonth.New(TMonthNumber.July), TYear.New(2017)).WeekDay));
end;

procedure TDaySpanTest.WeekNumberOf20_7_2017Is3;
begin
  CheckEquals(3, TDaySpan.NewByDate(EncodeDate(2017, 7, 20)).Week.NumberInMonth(TYear.New(2017)));
end;

procedure TDaySpanTest.AsDateOf20_7_2017IsTDate;
begin
  CheckEquals(EncodeDate(2017, 7, 20), TDaySpan.NewByDate(EncodeDate(2017, 7, 20)).AsDate);
end;

initialization

RegisterTest(TDaySpanTest {$IFNDEF FPC}.Suite {$ENDIF});

end.
