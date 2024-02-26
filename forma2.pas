unit forma2;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm3 }

  TForm3 = class(TForm)
    Button1: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Edit1: TEdit;
    Panel1: TPanel;
    procedure Button10Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: char);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private

  public

  end;

var
  Form3: TForm3;
  a,b,c:real;
  d:char;

implementation

{$R *.lfm}

{ TForm3 }



procedure TForm3.FormCreate(Sender: TObject);
begin
  Left:=0;
  Top:=26;
end;

procedure TForm3.FormDestroy(Sender: TObject);
begin

end;

procedure TForm3.Button9Click(Sender: TObject);
begin

end;

procedure TForm3.Edit1KeyPress(Sender: TObject; var Key: char);
begin
case key of
 '-',',','0'..'9',#8: else key:=chr(0);
 end;
end;

procedure TForm3.Button12Click(Sender: TObject);
begin
 b:=StrtoFloat(Edit1.Text);
 case  d of
 '-': c:=a-b;
 '+': c:=a+b;
 '*': c:=a*b;
 '/': c:=a/b;
 end;
 Edit1.Text:=FloatToStr(c);
end;

procedure TForm3.Button16Click(Sender: TObject);
begin
   a:=StrToFloat(Edit1.Text);
   Edit1.Clear;
   case(Sender as Tbutton).Tag of
   1:  d:='-';
   2:  d:='+';
   3:  d:='*';
   4:  d:='/';
   end;
end;

procedure TForm3.Button17Click(Sender: TObject);
begin
    Edit1.Clear;
end;

procedure TForm3.Button18Click(Sender: TObject);
var
  s:String;
begin
   s:=Edit1.Text;
  if s='' then exit;
  delete(s,length(s),1);
  Edit1.Text:=s;
end;

procedure TForm3.Button10Click(Sender: TObject);
begin
   Edit1.text:=Edit1.text +(Sender as Tbutton).Caption;
end;

end.

