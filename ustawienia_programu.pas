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
    ColorBox2: TColorBox;
    ColorBox3: TColorBox;
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
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CBListboxClick(Sender: TObject);
    procedure CBListboxMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ColorBox1CloseUp(Sender: TObject);
    procedure ColorBox2CloseUp(Sender: TObject);
    procedure ColorBox3Change(Sender: TObject);
    procedure ColorBox3CloseUp(Sender: TObject);
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
    //kolor ToolBar
    colorToolBar: TColor;
    //Font
    memoFont: TFont;
    //Kolor w Listbox
    colorListbox: TColor;
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

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
   //Ini_Settings := TIniFile.Create(ExtractFilePath(ParamStr(0))+'settings.ini');
   //try
   // Ini_Settings.WriteInteger('Main','MemoColor', colorUi);
   // Ini_Settings.WriteInteger('Main','ToolBarTop', colorToolBar);
   //finally
   //  Ini_Settings.free;
   //end;
end;

procedure TForm2.Button2Click(Sender: TObject);
begin
  //nadaje wartosci natychnisat
  Form1.ToolBar1.Color:= clBtnFace;
  Form1.Memo1.Font.Name := 'Arial';
  Form1.Memo1.Font.Size := 12;
  Form1.Memo1.Font.Color := clCaptionText;
  Form1.Memo1.Color := clActiveBorder;
  Form1.ListBox1.Color := clBtnHighlight;

  Ini_Settings := TIniFile.Create(ExtractFilePath(ParamStr(0))+'settings.ini');
  try
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
    //zapisuje kolor ListBox slowa kluczowe
    Ini_Settings.WriteInteger('Main','ListBoxKeyWords',clBtnHighlight);
    //MessageDlg('Dane zapisane!' + #10 + 'Zrestartuj program!',mtInformation,[mbOk],0);
  finally
   FreeAndNil(Ini_Settings);
  end;

end;

procedure TForm2.Button3Click(Sender: TObject);
begin
if FontDialog.Execute then
 begin
  memoFont := FontDialog.Font;
  Memo1.Font:= memoFont;
  Form1.Memo1.Font:= memoFont;
  Ini_Settings := TIniFile.Create(ExtractFilePath(ParamStr(0))+'settings.ini');
  try
    //zapisuje nazwe czcionki
    Ini_Settings.WriteString('Main','FontFamily',Memo1.Font.Name);
    //zapisujem rozmiar czcionki
    Ini_Settings.WriteInteger('Main','FontSize',Memo1.Font.Size);
    //zapisujemy kolor czcionki
    Ini_Settings.WriteInteger('Main','FontColor',Memo1.Font.Color);
  finally
    FreeAndNil(Ini_Settings);
  end;
  end
end;

procedure TForm2.CBListboxClick(Sender: TObject);
begin
  // if CBListbox.ColorDialog.Execute then
  //begin
  // LbKeysColor := CBListbox.ColorDialog.Color;
  // //Ustawiam kolor LbKeys
  // LbKeys.Color := LbKeysColor;
  //end;
end;

procedure TForm2.CBListboxMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin



end;

procedure TForm2.ColorBox1CloseUp(Sender: TObject);
begin
  colorToolBar := ColorBox1.Selected;
  ToolBar1.Color:= colorToolBar;
  Form1.ToolBar1.Color:= colorToolBar;
  Ini_Settings := TIniFile.Create(ExtractFilePath(ParamStr(0))+'settings.ini');
  try
    Ini_Settings.WriteInteger('Main','ToolBarTop', colorToolBar);
  finally
    Ini_Settings.free;
  end;
end;

procedure TForm2.ColorBox2CloseUp(Sender: TObject);
begin
  colorUi := ColorBox2.Selected;
  Form1.Memo1.Color:= ColorBox2.Selected;
  Memo1.Color:= ColorBox2.Selected;
   Ini_Settings := TIniFile.Create(ExtractFilePath(ParamStr(0))+'settings.ini');
   try
     Ini_Settings.WriteInteger('Main','MemoColor', colorUi);
   finally
     Ini_Settings.free;
   end;
end;

procedure TForm2.ColorBox3Change(Sender: TObject);
begin

end;

procedure TForm2.ColorBox3CloseUp(Sender: TObject);
begin
  colorListbox := ColorBox3.Selected;
  Form1.ListBox1.Color:= ColorBox3.Selected;
  LbKeys.Color:= ColorBox3.Selected;

  Ini_Settings := TIniFile.Create(ExtractFilePath(ParamStr(0))+'settings.ini');
  try
   Ini_Settings.WriteInteger('Main','ListBoxKeyWords', colorListbox);
  finally
   Ini_Settings.free;
  end;
end;

procedure TForm2.FormCreate(Sender: TObject);
begin

end;

procedure TForm2.ValueListEditor1Click(Sender: TObject);
begin

end;



end.

