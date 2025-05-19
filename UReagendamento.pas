unit UReagendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPickers, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls, UDataModule, UAgendamentos;

type
  TFormReagendamento = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    lblReagendamento: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    pnlDireito: TPanel;
    btnDireito: TSpeedButton;
    pnlEsquerdo: TPanel;
    btnEsquerdo: TSpeedButton;
    dtDiaReagendamento: TDateTimePicker;
    timePickerHoraReagendamento: TTimePicker;
    procedure FormResize(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnDireitoClick(Sender: TObject);
    procedure btnEsquerdoClick(Sender: TObject);
  private
    { Private declarations }
  public
    codigoReagendamento : integer;
  end;

var
  FormReagendamento: TFormReagendamento;

implementation

uses
  FireDAC.Comp.Client, Data.DB;

{$R *.dfm}

procedure TFormReagendamento.btnDireitoClick(Sender: TObject);
begin

  with TFDQuery.Create(self) do
  begin
    try
      connection := dm.con;

      sql.Add('update agendamentos');
      sql.Add('set DATA_AGENDADA = :DATA_AGENDADA, HORA_AGENDAMENTO = :HORA_AGENDAMENTO, HORA_ENTREGA = :HORA_ENTREGA');
      sql.Add('where id = :id');

      ParamByName('DATA_AGENDADA').DataType :=  ftdate;
      ParamByName('DATA_AGENDADA').asdate :=  dtDiaReagendamento.Date;

      ParamByName('HORA_AGENDAMENTO').DataType := ftTime;
      ParamByName('HORA_AGENDAMENTO').AsTime := timePickerHoraReagendamento.Time;

      ParamByName('HORA_ENTREGA').DataType := ftTime;
      ParamByName('HORA_ENTREGA').Astime := FormAgendamento.HoraEntrega(timePickerHoraReagendamento.Time);

      ParamByName('id').Value := codigoReagendamento;

      ExecSQL;

    finally
      ShowMessage('Atualizado com sucesso!');
      Free;
    end;

  end;

  Close;

end;

procedure TFormReagendamento.btnEsquerdoClick(Sender: TObject);
begin
  Close;
end;

procedure TFormReagendamento.FormResize(Sender: TObject);
begin

  if Assigned(lblReagendamento) then
  begin
    lblReagendamento.Margins.Left  := Trunc(Width / 6);
    lblReagendamento.Margins.Right := Trunc(Width / 6);
  end;

  if Assigned(dtDiaReagendamento) then
  begin
    dtDiaReagendamento.Margins.Left  := Trunc(Width / 6);
    dtDiaReagendamento.Margins.Right := Trunc(Width / 6);
  end;

  if Assigned(timePickerHoraReagendamento) then
  begin
    timePickerHoraReagendamento.Margins.Top    := Trunc(Height / 7);
    timePickerHoraReagendamento.Margins.Bottom := Trunc((Height / 6) * 2.7);
  end;

end;

procedure TFormReagendamento.FormShow(Sender: TObject);
begin

  with TFDQuery.Create(self) do
  begin
    try
      Connection := dm.con;

      sql.Add('select DATA_AGENDADA, hora_agendamento from agendamentos');
      sql.Add('where id = :id');
      ParamByName('id').Value := codigoReagendamento;
      open;

      dtDiaReagendamento.Date := FieldByName('DATA_AGENDADA').Value;
      timePickerHoraReagendamento.Time := FieldByName('hora_agendamento').Value;

    finally
      Free;
    end;
  end;

end;

end.
