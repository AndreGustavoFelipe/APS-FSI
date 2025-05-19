unit UAlteraStatus;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormAlteraStatus = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    lblAlteraStatus: TLabel;
    Panel4: TPanel;
    pnlEmAndamento: TPanel;
    btnEmAndamento: TSpeedButton;
    pnlConcluido: TPanel;
    btnConcluido: TSpeedButton;
    procedure btnEmAndamentoClick(Sender: TObject);
    procedure btnConcluidoClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    procedure AlteraStatus(codigoAgendamento : integer; status : integer);
    { Private declarations }
  public
    codAgendamento : integer;
    { Public declarations }
  end;

var
  FormAlteraStatus: TFormAlteraStatus;

implementation

uses
  FireDAC.Comp.Client, UDataModule;

{$R *.dfm}

procedure TFormAlteraStatus.AlteraStatus(codigoAgendamento : integer; status : integer);
begin
  with TFDQuery.Create(self) do
  begin
    try
      connection := dm.con;

      sql.Add('update agendamentos');
      sql.Add('set status = :status');
      sql.Add('where id = :id');

      ParamByName('id').Value := codigoAgendamento;
      ParamByName('status').Value := status;

      execsql;

    finally
      free;
    end;
  end;

  showmessage('Status alterado com sucesso!');
end;

procedure TFormAlteraStatus.btnEmAndamentoClick(Sender: TObject);
begin
   AlteraStatus(codAgendamento, 1);
   close;
end;

procedure TFormAlteraStatus.btnConcluidoClick(Sender: TObject);
begin
  AlteraStatus(codAgendamento, 2);
  close;
end;

procedure TFormAlteraStatus.FormResize(Sender: TObject);
begin
  if Assigned(lblAlteraStatus) then
  begin
    lblAlteraStatus.Margins.Left  := Trunc(Width / 6);
    lblAlteraStatus.Margins.Right := Trunc(Width / 6);
  end;

  if Assigned(btnEmAndamento) then
  begin
    btnEmAndamento.Margins.Left  := Trunc(Width / 6);
    btnEmAndamento.Margins.Right := Trunc(Width / 6);
  end;

  if Assigned(btnConcluido) then
  begin
    btnConcluido.Margins.Top    := Trunc(Height / 7);
    btnConcluido.Margins.Bottom := Trunc(Height * 2.7);
  end;
end;

end.
