{
  Copyright (c) 2018 Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  Year, Month, Week, DaySpan, TimeSpan, DateTimeSpan;

type
  TMainForm = class(TForm)
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
  end;

var
  NewMainForm: TMainForm;

implementation

{$R *.dfm}

procedure TMainForm.FormCreate(Sender: TObject);
var
  DaySpan: IDaySpan;
  DateTimeSpan: IDateTimeSpan;
begin
  Memo1.Clear;
  DaySpan := TDaySpan.NewByDate(Now);
  Memo1.Lines.Append(Format('Year: %d, IsLeap: %s', [DaySpan.Year.Number, BoolToStr(DaySpan.Year.IsLeap)]));
  Memo1.Lines.Append(Format('Month: %d, Name: %s, ShortName: %s, Start: %s, End: %s, Days: %d',
    [Ord(DaySpan.Month.Number), DaySpan.Month.Name, DaySpan.Month.ShortName, FormatDateTime('dd/mm/yyyy',
    DaySpan.Month.StartAt(DaySpan.Year)), FormatDateTime('dd/mm/yyyy', DaySpan.Month.EndAt(DaySpan.Year)),
    DaySpan.Month.DayCount(DaySpan.Year)]));
  Memo1.Lines.Append(Format('Number: %d, NumberInMonth: %d, Start: %s, End: %s',
    [DaySpan.Week.Number, DaySpan.Week.NumberInMonth(DaySpan.Year), FormatDateTime('dd/mm/yyyy',
    DaySpan.Week.StartAt(DaySpan.Year)), FormatDateTime('dd/mm/yyyy', DaySpan.Week.EndAt(DaySpan.Year))]));
  Memo1.Lines.Append(Format('Day: %d, Name: %s, ShortName: %s, YearDay: %d, WeekDay: %d',
    [Ord(DaySpan.Number), DaySpan.Name, DaySpan.ShortName, DaySpan.YearDayNumber, Ord(DaySpan.WeekDay)]));
  DateTimeSpan := TDateTimeSpan.Create(DaySpan, TTimeSpan.NewByTime(Now));
  with DateTimeSpan do
  begin
    Memo1.Lines.Append(Format('Day: %d/%d/%d Time: %d:%d:%d.%d', [Ord(DaySpan.Number), Ord(DaySpan.Month.Number),
      DaySpan.Year.Number, TimeSpan.Hour, TimeSpan.Minute, TimeSpan.Second, TimeSpan.Millisecond]));
  end;
end;

end.
