unit about;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  Buttons, ComCtrls, LCLIntf, LazUTF8;

type

  { TfAbout }

  TfAbout = class(TForm)
    BitBtn1: TBitBtn;
    Memo3: TMemo;
    TabSheet2: TTabSheet;
    www: TLabel;
    email: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    PageControl1: TPageControl;
    Panel1: TPanel;
    TabSheet1: TTabSheet;
    TabSheet3: TTabSheet;
    procedure BitBtn1Click(Sender: TObject);
    procedure emailMouseLeave(Sender: TObject);
    procedure emailMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer
      );
    procedure Label1Click(Sender: TObject);
    procedure emailMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure wwwClick(Sender: TObject);
    procedure wwwMouseLeave(Sender: TObject);
    procedure wwwMouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure wwwMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private

  public

  end;

var
  fAbout: TfAbout;

implementation

{$R *.lfm}

{ TfAbout }

procedure TfAbout.BitBtn1Click(Sender: TObject);
begin
  fAbout.Close;
end;

procedure TfAbout.emailMouseLeave(Sender: TObject);
begin
   email.Font.Color:=clCaptionText; //kolor czarny
end;

procedure TfAbout.emailMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  email.Font.Color:=clHighlight; //kolor niebieski
end;

procedure SendEmail(const Recipient, Subject, Body: string);
var
  URL: String;
begin
  URL := 'mailto:' + UTF8Encode(Recipient) +
         '?subject=' + UTF8Encode(Subject) +
         '&body=' + UTF8Encode(Body);
  OpenURL(URL);
end;



procedure TfAbout.Label1Click(Sender: TObject);
begin
  SendEmail('programista.art@gmail.com', 'Temat wiadomości', '');
end;

procedure TfAbout.emailMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  email.Font.Color:=ClRed;
end;


procedure TfAbout.SpeedButton1Click(Sender: TObject);
begin

end;

procedure TfAbout.wwwClick(Sender: TObject);
begin
  OpenURL('http://www.dmitriy.pl');
end;

procedure TfAbout.wwwMouseLeave(Sender: TObject);
begin
  www.Font.Color:=clCaptionText; //kolor czarny
end;

procedure TfAbout.wwwMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
  www.Font.Color:=clHighlight; //kolor niebieski
end;

procedure TfAbout.wwwMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  www.Font.Color:=ClRed; //zmiana koloru czcionki
end;

end.

