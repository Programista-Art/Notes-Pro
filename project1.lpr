program project1;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}
  cthreads,
  {$ENDIF}
  {$IFDEF HASAMIGA}
  athreads,
  {$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, Unit1, ustawienia_programu, about, forma2, szyfrowanie
  { you can add units after this };

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Title:='Notes Pro';
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TfAbout, fAbout);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TFszyfrowanie, Fszyfrowanie);
  Application.Run;
end.

