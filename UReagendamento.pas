unit UReagendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls;

type
  TFormReagendamento = class(TForm)
    Panel6: TPanel;
    Panel10: TPanel;
    btnSalvarReagendamento: TSpeedButton;
    Panel12: TPanel;
    btnCancelarReagendamento: TSpeedButton;
    Panel5: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    Panel2: TPanel;
    DateTimePicker1: TDateTimePicker;
    lblReagendar: TLabel;
    procedure btnCancelarReagendamentoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormReagendamento: TFormReagendamento;

implementation

{$R *.dfm}

procedure TFormReagendamento.btnCancelarReagendamentoClick(Sender: TObject);
begin
  Close;
end;

end.
