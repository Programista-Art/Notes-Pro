unit ustawienia_programu;

{$mode ObjFPC}{$H+}

interface

uses
  Classes,LCLTranslator, DefaultTranslator, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ComCtrls, ColorBox, IniFiles;

type

  { TForm2 }

  TForm2 = class(TForm)
    ButOkSettings: TBitBtn;
    ButCancelSettings: TBitBtn;
    ButResetSettings: TButton;
    ColorBox1Settings: TColorBox;
    ColorBox2Settings: TColorBox;
    ColorBoxSettings: TColorBox;
    ColorDialog1: TColorDialog;
    FontDialog: TFontDialog;
    ImageList1: TImageList;
    LbKeys: TListBox;
    Memo1: TMemo;
    PageControlSettings: TPageControl;
    PageControl: TPageControl;
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
    procedure ButResetSettingsClick(Sender: TObject);
    procedure ButFontSettingsClick(Sender: TObject);
    procedure ColorBox1SettingsCloseUp(Sender: TObject);
    procedure ColorBox2SettingsCloseUp(Sender: TObject);
    procedure ColorBoxSettingsCloseUp(Sender: TObject);
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

resourcestring
  CountLines  = 'Liczba wierszy ';
implementation
uses
  unit1;
{$R *.lfm}

{ TForm2 }


procedure TForm2.ButResetSettingsClick(Sender: TObject);
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

procedure TForm2.ButFontSettingsClick(Sender: TObject);
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

procedure TForm2.ColorBox1SettingsCloseUp(Sender: TObject);
begin
  colorToolBar := ColorBox1Settings.Selected;
  ToolBar1.Color:= colorToolBar;
  Form1.ToolBar1.Color:= colorToolBar;
  Ini_Settings := TIniFile.Create(ExtractFilePath(ParamStr(0))+'settings.ini');
  try
    Ini_Settings.WriteInteger('Main','ToolBarTop', colorToolBar);
  finally
    Ini_Settings.free;
  end;
end;

procedure TForm2.ColorBox2SettingsCloseUp(Sender: TObject);
begin
  colorUi := ColorBox2Settings.Selected;
  Form1.Memo1.Color:= ColorBox2Settings.Selected;
  Memo1.Color:= ColorBox2Settings.Selected;
   Ini_Settings := TIniFile.Create(ExtractFilePath(ParamStr(0))+'settings.ini');
   try
     Ini_Settings.WriteInteger('Main','MemoColor', colorUi);
   finally
     Ini_Settings.free;
   end;
end;

procedure TForm2.ColorBoxSettingsCloseUp(Sender: TObject);
begin
  colorListbox := ColorBoxSettings.Selected;
  Form1.ListBox1.Color:= ColorBoxSettings.Selected;
  LbKeys.Color:= ColorBoxSettings.Selected;

  Ini_Settings := TIniFile.Create(ExtractFilePath(ParamStr(0))+'settings.ini');
  try
   Ini_Settings.WriteInteger('Main','ListBoxKeyWords', colorListbox);
  finally
   Ini_Settings.free;
  end;
end;


end.

