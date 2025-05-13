unit ULogin;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.Imaging.pngimage, UPrincipal, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.WinXPickers;

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
    procedure imgCadeadoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    function VerificaLogin(usuario, senha: string): boolean;
    procedure verificaAgendamentosAtrasados;
    { Private declarations }
  public
    idUsuario, nomeUsuario, tipoUsuario : string;
    funcionario : boolean;
  end;

var
  FormLogin: TFormLogin;

implementation

{$R *.dfm}

uses UDataModule;

procedure TFormLogin.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = VK_RETURN.ToString then
    SpeedButton1Click(self);
end;

procedure TFormLogin.FormResize(Sender: TObject);
begin

  pnlLogin.Margins.Left  := Trunc(FormLogin.Width/6);
  pnlLogin.Margins.Right := Trunc(FormLogin.Width/6);

  pnlLogin.Margins.top := (Trunc(FormLogin.height/7));
  pnlLogin.Margins.bottom := Trunc((FormLogin.height/6) * 2.7);

//  pnlBtnEntrar.Margins.Left  := (Trunc(pnlLogin.Margins.Left/2));
//  pnlBtnEntrar.Margins.Right := (Trunc(pnlLogin.Margins.Right/2));

end;

procedure TFormLogin.FormShow(Sender: TObject);
begin
  DM.Con.Connected := False;
  DM.Con.Params.Values['Database'] := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'dados\BDAPSFDSI.FDB';
  DM.Con.Connected := True;
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

function TFormLogin.VerificaLogin(usuario: string; senha: string): boolean;
begin
  Result := False;

  with TFDQuery.Create(self) do
  begin
    try
      Connection := dm.con;

      SQL.Text := 'SELECT * FROM USUARIOS WHERE NOME = :NOME AND SENHA = :SENHA';
      ParamByName('NOME').Value := usuario;
      ParamByName('SENHA').Value := senha;

      Open;

      if FieldByName('tipo').Value = 1 then
        funcionario := true
      else
        funcionario := false;

      if not IsEmpty then
      begin
        // Bloqueia se tipo = 0
        if FieldByName('TIPO').AsString = '0' then
          Exit;

        // Login válido
        idUsuario := FieldByName('ID').AsString;
        nomeUsuario := FieldByName('NOME').AsString;
        tipoUsuario := FieldByName('TIPO').AsString;
        Result := True;
      end;
    finally
      Free;
    end;
  end;
end;



procedure TFormLogin.SpeedButton1Click(Sender: TObject);
begin
  if (edtUsuario.Text <> '') and (edtSenha.Text <> '') then
  begin
    if VerificaLogin(edtUsuario.Text, edtSenha.Text) then
    begin
      edtUsuario.Text := '';
      edtSenha.Text := '';

      with TFormPrincipal.Create(self) do
      begin
        try
          TipoUsuario := Self.tipoUsuario;
          ShowModal;
        finally
          Free;
        end;
      end;
    end
    else
      ShowMessage('Usuário ou senha incorreto!');
  end
  else
    ShowMessage('Preencha todos os campos!');
end;

procedure TFormLogin.verificaAgendamentosAtrasados();
begin
  with TFDQuery.Create(self) do
  begin
    try
      Connection := dm.con;

      SQL.Clear;
      SQL.Add('select * from AGENDAMENTOS where DATA_AGENDADA <= :dataAtual');
      ParamByName('dataAtual').DataType := ftDate;
      ParamByName('dataAtual').AsDate := Now;

      Open;

      last;
      first;

      while not eof do
      begin
        if FieldByName('') then

      end;

    finally
      free;
    end;
  end;
end;

procedure TFormLogin.passaAtrasado();
begin
  with TFDQuery.Create(self) do
  begin
    try
      connection := dm.con;

      sql.Clear;
      sql.Add('update agendamentos');
      sql.Add('set status = :status');
      sql.Add('where id = :id')

    finally
      free;
    end;
  end;
end;

end.
