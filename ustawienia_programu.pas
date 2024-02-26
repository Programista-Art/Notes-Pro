unit ustawienia_programu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ComCtrls, ValEdit, ColorBox, IniFiles, about;

type

  { TForm2 }

  TForm2 = class(TForm)
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ColorBox1: TColorBox;
    CBListbox: TColorButton;
    ColorDialog1: TColorDialog;
    FontDialog: TFontDialog;
    ImageList1: TImageList;
    LbKeys: TListBox;
    Memo1: TMemo;
    PageControl1: TPageControl;
    PageControl2: TPageControl;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    ToolBar1: TToolBar;
    ToolBar2: TToolBar;
    ToolButton1: TToolButton;
    ToolButton10: TToolButton;
    ToolButton11: TToolButton;
    ToolButton12: TToolButton;
    ToolButton13: TToolButton;
    ToolButton14: TToolButton;
    ToolButton2: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    ToolButton5: TToolButton;
    ToolButton6: TToolButton;
    ToolButton7: TToolButton;
    ToolButton8: TToolButton;
    ToolButton9: TToolButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CBListboxClick(Sender: TObject);
    procedure CBListboxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ColorBox1Change(Sender: TObject);
    procedure ColorBox1Click(Sender: TObject);
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
    //c:TColor;
    colorUi: TColor;
    //kolor Listbox w ustawieniach
    LbKeysColor: TColor;
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
  colorUi :=  ColorDialog1.Color;
  //zapisujemy color tla
  Ini_Settings.WriteInteger('Main','MemoColor', colorUi);
  Ini_Settings.WriteInteger('Main','ToolBarTop', colorUi);
  Form1.Memo1.Color:=ColorDialog1.Color;
  Memo1.Color:=ColorDialog1.Color;
  //Górny panel z ikonkami
  Form1.ToolBar1.Color:= colorUi;
end

end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  //nadaje wartosci natychnisat
  Form1.ToolBar1.Color:= clBtnFace;
  Form1.Memo1.Font.Name := 'Arial';
  Form1.Memo1.Font.Size := 12;
  Form1.Memo1.Font.Color := clCaptionText;
  Form1.Memo1.Color := clActiveBorder;

  Ini_Settings.WriteInteger('Main','MemoColor',clActiveBorder);
  //czcionka
  //zapisuje nazwa fonta
  Ini_Settings.WriteString('Main','FontFamily','Arial');
  //zapisuje rozmiar fonta
  Ini_Settings.WriteInteger('Main','FontSize',12);
  //zapisuje color fonta
  Ini_Settings.WriteInteger('Main','FontColor',clCaptionText);
  //zapisuje kolor paneli ikonek
  Ini_Settings.WriteInteger('Main','ToolBarTop',clBtnFace);

  //MessageDlg('Dane zapisane!' + #10 + 'Zrestartuj program!',mtInformation,[mbOk],0);
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

procedure TForm2.CBListboxClick(Sender: TObject);
begin
   if CBListbox.ColorDialog.Execute then
  begin
   LbKeysColor := CBListbox.ColorDialog.Color;
   //Ustawiam kolor LbKeys
   LbKeys.Color := LbKeysColor;
  end;
end;

procedure TForm2.CBListboxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin



end;

procedure TForm2.ColorBox1Change(Sender: TObject);
begin
  // poprawic kod
  // if ColorBox1.ColorDialog.Execute then
  // begin
  // LbKeysColor := ColorBox1.ColorDialog.Color;
  // //Ustawiam kolor LbKeys
  // LbKeys.Color := LbKeysColor;
  // // Ustawiam kolor dla ToolBar1 w obecnej formie
  // ToolBar1.Color := ColorBox1.ColorDialog.Color;
  // //ToolBar1.Color:= colorUi;
  // //Form1.ToolBar1.Color:= colorUi;
  // if Assigned(Form1) then
  //    Form1.ToolBar1.Color := ColorBox1.ColorDialog.Color;
  //end;
end;

procedure TForm2.ColorBox1Click(Sender: TObject);
begin

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

