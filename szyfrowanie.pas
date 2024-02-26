unit szyfrowanie;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls, StdCtrls,
  ComCtrls, Buttons, Menus,  FileUtil;

type

  { TFszyfrowanie }

  TFszyfrowanie = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure KopiujClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem6Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure OczyscClick(Sender: TObject);
  private

  public

  end;
var
  Fszyfrowanie: TFszyfrowanie;
implementation
 uses
 unit1;


{$R *.lfm}

{ TFszyfrowanie }

// Funkcja wykonująca szyfrowanie tekstu
function SzyfrujTekst(tekst: string): string;
var
  i,klucz: integer;
begin
  klucz := 8942323;
  Result := '';
  //for i := 1 to Length(tekst) do
  //  Result := Result + Chr(Ord(tekst[i]) + klucz);
  for i := 1 to Length(tekst) do
  Result := Result + Chr(Ord(tekst[i]) + klucz);

end;


// Funkcja wykonująca deszyfrowanie tekstu
function DeszyfrujTekst(tekst: string): string;
//const
//  klucz = k; // Przesunięcie znaków
var
  i,klucz: integer;
begin
  klucz := 8942323;
  Result := '';
  for i := 1 to Length(tekst) do
    Result := Result + Chr(Ord(tekst[i]) - klucz);
end;




procedure TFszyfrowanie.FormCreate(Sender: TObject);
begin
  BorderIcons:=[(biSystemMenu)];
end;

procedure TFszyfrowanie.KopiujClick(Sender: TObject);
begin

end;

procedure TFszyfrowanie.MenuItem2Click(Sender: TObject);
begin

end;






procedure TFszyfrowanie.MenuItem4Click(Sender: TObject);
begin

end;

procedure TFszyfrowanie.MenuItem5Click(Sender: TObject);
begin

end;



procedure TFszyfrowanie.MenuItem6Click(Sender: TObject);
begin

end;



procedure TFszyfrowanie.MenuItem7Click(Sender: TObject);
begin

end;

procedure TFszyfrowanie.OczyscClick(Sender: TObject);
begin

end;















end.

