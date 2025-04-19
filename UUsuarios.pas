unit UUsuarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Data.DB,
  Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls;

type
  TFormUsuarios = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel8: TPanel;
    btnNovoUsuario: TSpeedButton;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    Panel4: TPanel;
    btnExcluir: TSpeedButton;
    pgControl: TPageControl;
    tabListagem: TTabSheet;
    DBGrid1: TDBGrid;
    tabCad: TTabSheet;
    Panel5: TPanel;
    edtCadSenha: TEdit;
    Panel6: TPanel;
    edtCadUsuario: TEdit;
    rdGroupTipos: TRadioGroup;
    imgCadeado: TImage;
    Panel7: TPanel;
    pnlSalvar: TPanel;
    btnSalvar: TSpeedButton;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    procedure imgCadeadoClick(Sender: TObject);
    procedure btnNovoUsuarioClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormUsuarios: TFormUsuarios;

implementation

{$R *.dfm}

procedure TFormUsuarios.btnCancelarClick(Sender: TObject);
begin
   // limpa campos da tab usuario
   pgControl.TabIndex := 0;
end;

procedure TFormUsuarios.btnNovoUsuarioClick(Sender: TObject);
begin
  pgControl.TabIndex := 1;
end;

procedure TFormUsuarios.btnSalvarClick(Sender: TObject);
begin
  ShowMessage('Cadastrado com Sucesso!');
end;

procedure TFormUsuarios.FormShow(Sender: TObject);
begin
  pgControl.TabIndex := 0;
end;

procedure TFormUsuarios.imgCadeadoClick(Sender: TObject);
var
  picture : TPicture;
  aux : string;
begin
  picture := TPicture.Create;
  try
    if imgCadeado.Tag = 0 then
    begin
      aux := 'imgs\telaLogin\cadeadoAberto.png';
      edtCadSenha.PasswordChar :=  #0;
      imgCadeado.Tag := 1;
    end
    else
    begin
      aux := 'imgs\telaLogin\cadeadoFechado.png';
      edtCadSenha.PasswordChar := '*';
      imgCadeado.Tag := 0;
    end;
    picture.LoadFromFile(ExtractFilePath(ParamStr(0)) + aux);
    imgCadeado.Picture.Assign(picture);

  finally
    picture.Free;
  end;
end;

procedure TFormUsuarios.SpeedButton1Click(Sender: TObject);
begin
  pgControl.TabIndex := 1;
end;

end.
