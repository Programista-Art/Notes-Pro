unit text_comparison;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Buttons, ComCtrls, Menus, LCLTranslator, DefaultTranslator;

type

  { TFtext_comparison }

  TFtext_comparison = class(TForm)
    ButAllDelete2_list: TSpeedButton;
    ButOpen2_Lst: TSpeedButton;
    ButSave2_list: TSpeedButton;
    Button1: TButton;
    GroupBox1: TGroupBox;
    ImageList1: TImageList;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    LabInfo: TLabel;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    PMenuList1: TPopupMenu;
    PMenuList2: TPopupMenu;
    PMenuListUnic: TPopupMenu;
    SearchText: TLabeledEdit;
    SearchTextList1: TLabeledEdit;
    ListBox1: TListBox;
    ListBox2: TListBox;
    ListBox3: TListBox;
    OPD: TOpenDialog;
    Panel1: TPanel;
    PanelBocznyPrawy: TPanel;
    ButOpen1_list: TSpeedButton;
    ButSave1_list: TSpeedButton;
    ButAllDelete1_list: TSpeedButton;
    SD: TSaveDialog;
    SearchTextList2: TLabeledEdit;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    ButSearchUnic: TSpeedButton;
    ButSearch1: TSpeedButton;
    ButSearch2: TSpeedButton;
    StatusBar1: TStatusBar;
    procedure ButAllDelete1_listClick(Sender: TObject);
    procedure ButAllDelete2_listClick(Sender: TObject);
    procedure ButOpen1_listClick(Sender: TObject);
    procedure ButOpen2_LstClick(Sender: TObject);
    procedure ButSave1_listClick(Sender: TObject);
    procedure ButSave2_listClick(Sender: TObject);
    procedure ButSearch1Click(Sender: TObject);
    procedure ButSearch2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure isDeleteAllText(list: TListbox);
    procedure ListBox1Click(Sender: TObject);
    procedure ListBox2Click(Sender: TObject);
    procedure ListBox3Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure OpenText(list: TListBox);
    procedure SaveText(list: TListBox; nameText : String);
    procedure CalculateRows(List: TListBox; number: Integer; StBar: TStatusBar);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure ButSearchUnicClick(Sender: TObject);
    procedure SearchTxtinLists(pole: TLabeledEdit; list: TListbox);
  private

  public

  end;

var
  Ftext_comparison: TFtext_comparison;
resourcestring
  CountLines  = 'Liczba wierszy ';
  UniqueList = 'Lista Unikalne';
  NoText = 'Nie ma tekstu';
  TextFound = 'Tekst znaleziony';
  List1 = 'Lista nr 1';
  List2 = 'Lista nr 2';

implementation

{$R *.lfm}

{ TFtext_comparison }

procedure TFtext_comparison.Button1Click(Sender: TObject);
var
i,count: integer;
begin
  ListBox3.Items.AddStrings(ListBox1.Items);
  for i := 0 to ListBox2.Count -1 do
     if ListBox3.Items.IndexOf(ListBox2.Items[i]) <0 then
     begin
     ListBox3.Items.Add(ListBox2.Items[i]);
     CalculateRows(ListBox3,2, StatusBar1);
     //podliczenie unikalnych wierszy
     count := ListBox3.Items.Count;
     LabInfo.Caption := IntToStr(count);
     end;
end;

procedure TFtext_comparison.FormCreate(Sender: TObject);
begin
  //sprawdza ile jest wierszy w każdej liscie
  CalculateRows(ListBox1,0, StatusBar1);
  CalculateRows(ListBox2,1, StatusBar1);
  CalculateRows(ListBox3,2, StatusBar1);
end;

procedure TFtext_comparison.isDeleteAllText(list: TListbox);
var
  r:integer;
begin
  r:=MessageDlg('Czy napewno chcesz usunąć cały tekst?',mtConfirmation,[mbOk,mbCancel],0);
  if r = mrOk then
  begin
   list.Items.Clear;
   //PodliczLinijki(ListBox1, StatusBar2);
  end
  else
  if r = mrCancel then
  //nic nie robimy
end;

procedure TFtext_comparison.ListBox1Click(Sender: TObject);
begin
  CalculateRows(ListBox1,0, StatusBar1);
end;

procedure TFtext_comparison.ListBox2Click(Sender: TObject);
begin
 CalculateRows(ListBox2,1, StatusBar1);
end;

procedure TFtext_comparison.ListBox3Click(Sender: TObject);
begin
  CalculateRows(ListBox3,2, StatusBar1);
end;

procedure TFtext_comparison.MenuItem1Click(Sender: TObject);
begin
  ButAllDelete1_listClick(Sender);
end;

procedure TFtext_comparison.MenuItem2Click(Sender: TObject);
begin
  ButAllDelete2_listClick(Sender);
end;

procedure TFtext_comparison.MenuItem3Click(Sender: TObject);
begin
  SpeedButton1Click(Sender);
end;


procedure TFtext_comparison.OpenText(list: TListBox);
begin
  OPD.FileName:= '';
  OPD.Title:= 'Otwórz istniejący plik';
  if OPD.Execute then
  //if list.Items.Count = 0 then
  begin
  list.Clear;
  list.Items.LoadFromFile(OPD.FileName);
  end;
end;

procedure TFtext_comparison.SaveText(list: TListBox; nameText : String);
begin
  SD.FileName:= nameText;
  SD.Title:= 'Zapisz plik tekstowy';
  if SD.Execute then
  list.Items.SaveToFile(SD.FileName);
end;

procedure TFtext_comparison.CalculateRows(List: TListBox; number: Integer; StBar: TStatusBar);
var
count: Integer;
begin
  count := List.Items.Count;
  StBar.Panels[number].Text:= CountLines + ' ' + IntToStr(count);
end;

procedure TFtext_comparison.SpeedButton1Click(Sender: TObject);
begin
  isDeleteAllText(ListBox3);
end;

procedure TFtext_comparison.SpeedButton2Click(Sender: TObject);
begin
  SaveText(ListBox3, UniqueList );
end;

procedure TFtext_comparison.ButSearchUnicClick(Sender: TObject);
begin
  SearchTxtinLists(SearchText, Listbox3);
end;

procedure TFtext_comparison.SearchTxtinLists(pole: TLabeledEdit; list: TListbox);
var
NumbPos:integer;
begin
  NumbPos := 0;
  NumbPos:= Pos (pole.Text, list.Items.Text);
  if NumbPos = 0 then
   begin
     ShowMessage(NoText);
   end
 else
   begin
  ShowMessage(TextFound);
  list.SetFocus; // aktywne
  //list.ItemIndex := NumbPos -1; // z jakiej pozycji zaczac zanzcaczaс
  if (NumbPos - 1) < list.Items.Count then // Sprawdzenie czy indeks mieści się w zakresie
   begin
      list.SetFocus;
      list.ItemIndex := NumbPos -1 ; // z jakiej pozycji zaczac zaznaczac
      list.Selected[NumbPos -1 ] := True; // zaznaczam tyle ile wynosi długość tekstu
    end
    else
    begin
      //ShowMessage('Błąd: Indeks poza zakresem elementów listy.');
    end;
 end;
end;

procedure TFtext_comparison.ButAllDelete1_listClick(Sender: TObject);
begin
  isDeleteAllText(ListBox1);
end;

procedure TFtext_comparison.ButAllDelete2_listClick(Sender: TObject);
begin
  isDeleteAllText(ListBox2);
end;

procedure TFtext_comparison.ButOpen1_listClick(Sender: TObject);
begin
  OpenText(ListBox1);
  CalculateRows(ListBox1,0, StatusBar1);
end;

procedure TFtext_comparison.ButOpen2_LstClick(Sender: TObject);
begin
  OpenText(ListBox2);
  CalculateRows(ListBox2,1, StatusBar1);
end;

procedure TFtext_comparison.ButSave1_listClick(Sender: TObject);
begin
  SaveText(ListBox1, List1);
end;

procedure TFtext_comparison.ButSave2_listClick(Sender: TObject);
begin
  SaveText(ListBox2,List2);
end;

procedure TFtext_comparison.ButSearch1Click(Sender: TObject);
begin
  SearchTxtinLists(SearchTextList1, Listbox1);
end;

procedure TFtext_comparison.ButSearch2Click(Sender: TObject);
begin
  SearchTxtinLists(SearchTextList2, Listbox2);
end;



end.

