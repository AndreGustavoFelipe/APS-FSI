unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, UPrincipal;

type
  TFormLogin = class(TForm)
    pnlLogin: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    lblLogin: TLabel;
    lblSenha: TLabel;
    pnlBtnEntrar: TPanel;
    Panel1: TPanel;
    edtUsuario: TEdit;
    lblUsuario: TLabel;
    Panel5: TPanel;
    edtSenha: TEdit;
    SpeedButton1: TSpeedButton;
    imgCadeado: TImage;
    Image1: TImage;
    procedure FormShow(Sender: TObject);
    procedure imgCadeadoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

procedure TFormLogin.FormShow(Sender: TObject);
begin

  pnlLogin.Margins.Left  := (Trunc(FormLogin.Width/2));
  pnlLogin.Margins.Right := (Trunc(FormLogin.Width/2));

  pnlLogin.Margins.top := (Trunc(FormLogin.height/6) * 2);
  pnlLogin.Margins.bottom := (Trunc(FormLogin.height/6) * 5);

//  pnlBtnEntrar.Margins.Left  := (Trunc(pnlLogin.Margins.Left/2));
//  pnlBtnEntrar.Margins.Right := (Trunc(pnlLogin.Margins.Right/2));

end;

procedure TFormLogin.imgCadeadoClick(Sender: TObject);
var
  picture : TPicture;
  aux : string;

begin

  picture := TPicture.Create;
  try
    if imgCadeado.Tag = 0 then
    begin
      aux := 'imgs\telaLogin\cadeadoAberto.png';
      edtSenha.PasswordChar :=  #0;
      imgCadeado.Tag := 1;
    end
    else
    begin
      aux := 'imgs\telaLogin\cadeadoFechado.png';
      edtSenha.PasswordChar := '*';
      imgCadeado.Tag := 0;
    end;
    picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + aux);
    imgCadeado.Picture.Assign(picture);

  finally
    picture.Free;
  end;

end;

procedure TFormLogin.SpeedButton1Click(Sender: TObject);
begin

  with TFormPrincipal.Create(self) do
  begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;

end;

end.
