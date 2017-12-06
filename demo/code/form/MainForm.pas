{
  Copyright (c) 2016, Vencejo Software
  Distributed under the terms of the Modified BSD License
  The full license is distributed with this software
}
unit MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls,
  ooYear, ooMonth, ooWeek, ooDay, ooDateStamp, ooTimeStamp, ooDateTimeStamp;

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
  DateStamp: IDateStamp;
  DateTimeStamp: IDateTimeStamp;
begin
  Memo1.Clear;
  DateStamp := TDateStamp.NewFromDate(Now);
  Memo1.Lines.Append(Format('Year: %d, IsLeap: %s', [DateStamp.Year.Number, BoolToStr(DateStamp.Year.IsLeap)]));
  Memo1.Lines.Append(Format('Month: %d, Name: %s, ShortName: %s, Start: %s, End: %s, Days: %d',
      [Ord(DateStamp.Month.Number), DateStamp.Month.Name, DateStamp.Month.ShortName, FormatDateTime('dd/mm/yyyy',
        DateStamp.Month.StartAt), FormatDateTime('dd/mm/yyyy', DateStamp.Month.EndAt), DateStamp.Month.DayCount]));
  Memo1.Lines.Append(Format('Number: %d, NumberInMonth: %d, Start: %s, End: %s', [DateStamp.Week.Number,
      DateStamp.Week.NumberInMonth, FormatDateTime('dd/mm/yyyy', DateStamp.Week.StartAt), FormatDateTime('dd/mm/yyyy',
        DateStamp.Week.EndAt)]));
  Memo1.Lines.Append(Format('Day: %d, Name: %s, ShortName: %s, YearDay: %d, WeekDay: %d', [Ord(DateStamp.Day.Number),
      DateStamp.Day.Name, DateStamp.Day.ShortName, DateStamp.Day.YearDayNumber, Ord(DateStamp.Day.WeekDay)]));
  DateTimeStamp := TDateTimeStamp.Create(DateStamp, TTimeStamp.New(Now));
  with DateTimeStamp do
  begin
    Memo1.Lines.Append(Format('Day: %d/%d/%d Time: %d:%d:%d.%d', [Ord(DateStamp.Day.Number),
        Ord(DateStamp.Month.Number), DateStamp.Year.Number, TimeStamp.Hours, TimeStamp.Minutes, TimeStamp.Seconds,
        TimeStamp.Milliseconds]));
  end;
end;

end.
