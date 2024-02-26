unit ustawienia_programu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ComCtrls, ValEdit, IniFiles, about;

type

  { TForm2 }

  TForm2 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ColorDialog1: TColorDialog;
    FontDialog: TFontDialog;
    Memo1: TMemo;
    PageControl1: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    TabSheet1: TTabSheet;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure fontClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var CloseAction: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure ValueListEditor1Click(Sender: TObject);
  private

  public
    var
    Ini_Settings: TIniFile;
    x,y,w,h :Integer;
    r,g,b :Integer;
    c:TColor;

  end;

var
  Form2: TForm2;

implementation
uses
  unit1;


{$R *.lfm}

{ TForm2 }

procedure TForm2.Button1Click(Sender: TObject);
begin
if ColorDialog1.Execute then
begin
//c:=ColorDialog1.Color;
Ini_Settings.WriteInteger('Main','MemoColor', ColorDialog1.Color);   //zapisujemy color tla
Form1.Memo1.Color:=ColorDialog1.Color;
Memo1.Color:=ColorDialog1.Color;
end

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  c:= clActiveBorder;
  Ini_Settings.WriteInteger('Main','MemoColor',c);
  //czcionka
   Ini_Settings.WriteString('Main','FontFamily','Arial');  //zapisujemy nazwa fonta
   Ini_Settings.WriteInteger('Main','FontSize',12);  //zapisujemy rozmiar fonta
   Ini_Settings.WriteInteger('Main','FontColor',clCaptionText);  //zapisujemy color fonta

  MessageDlg('Dane zapisane!' + #10 + 'Zrestartuj program!',mtInformation,[mbOk],0);
end;

procedure TForm2.Button3Click(Sender: TObject);
begin
if FontDialog.Execute then
 begin
Memo1.Font:=FontDialog.Font;
   Ini_Settings.WriteString('Main','FontFamily',Memo1.Font.Name);  //zapisujemy nazwa fonta
   Ini_Settings.WriteInteger('Main','FontSize',Memo1.Font.Size);  //zapisujemy rozmiar fonta
   Ini_Settings.WriteInteger('Main','FontColor',Memo1.Font.Color);  //zapisujemy color fonta
  end
end;





procedure TForm2.fontClick(Sender: TObject);
begin

end;

procedure TForm2.FormClose(Sender: TObject; var CloseAction: TCloseAction);
begin

end;



procedure TForm2.FormCreate(Sender: TObject);
begin
 Ini_Settings := TIniFile.Create(ExtractFilePath(ParamStr(0))+'settings.ini');
end;

procedure TForm2.ValueListEditor1Click(Sender: TObject);
begin

end;



end.

