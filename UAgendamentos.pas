unit UAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  Vcl.ComCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.DBCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxClasses,
  cxGridCustomView, cxGrid, Vcl.WinXPickers, cxGridCardView, cxGridDBCardView,
  cxGridCustomLayoutView, DateUtils, UUsuarios, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinTheBezier, dxSkinsDefaultPainters,
  dxSkinValentine, dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, cxDataControllerConditionalFormattingRulesManagerDialog;

type
  TFormAgendamento = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    Panel7: TPanel;
    edtModelo: TEdit;
    Panel8: TPanel;
    edtPlaca: TEdit;
    Panel5: TPanel;
    pnlSalvar: TPanel;
    btnSalvar: TSpeedButton;
    pnlCancelar: TPanel;
    btnCancelar: TSpeedButton;
    queryFuncionarios: TFDQuery;
    dsFuncionarios: TDataSource;
    queryServicos: TFDQuery;
    queryServicosID: TIntegerField;
    queryServicosDESCRICAO: TStringField;
    queryServicosVALOR: TSingleField;
    dsServicos: TDataSource;
    Panel6: TPanel;
    cxGrid1: TcxGrid;
    cxGridServicos: TcxGridDBTableView;
    cxGridServicosID: TcxGridDBColumn;
    cxGridServicosDESCRICAO: TcxGridDBColumn;
    cxGridServicosVALOR: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    Panel4: TPanel;
    dtDiaAgendamento: TDateTimePicker;
    Panel9: TPanel;
    cbTipoVeiculo: TComboBox;
    queryFuncionariosID: TIntegerField;
    queryFuncionariosNOME: TStringField;
    queryFuncionariosSENHA: TStringField;
    queryFuncionariosTIPO: TSmallintField;
    timePicker: TTimePicker;
    Panel10: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Panel11: TPanel;
    cxGrid2: TcxGrid;
    cxGridFuncionarios: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid1DBCardView1: TcxGridDBCardView;
    cxGrid1DBCardView1ID: TcxGridDBCardViewRow;
    cxGrid1DBCardView1DESCRICAO: TcxGridDBCardViewRow;
    cxGrid1DBCardView1VALOR: TcxGridDBCardViewRow;
    cxGridFuncionariosID: TcxGridDBColumn;
    cxGridFuncionariosNOME: TcxGridDBColumn;
    cxGridFuncionariosSENHA: TcxGridDBColumn;
    cxGridFuncionariosTIPO: TcxGridDBColumn;
    Panel1: TPanel;
    cxGrid3: TcxGrid;
    cxGridClientes: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    queryClientes: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    SmallintField1: TSmallintField;
    dsClientes: TDataSource;
    cxGridClientesID: TcxGridDBColumn;
    cxGridClientesNOME: TcxGridDBColumn;
    cxGridClientesSENHA: TcxGridDBColumn;
    cxGridClientesTIPO: TcxGridDBColumn;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    function VerificaCampos: boolean;
    { Private declarations }
  public
    operacao : integer; // 0 -> Cadastro // 1 -> Edição // 2 -> Exclusão
    function HoraEntrega(hora: TTime): TTime;
  end;

var
  FormAgendamento: TFormAgendamento;

implementation

{$R *.dfm}

uses UDataModule, UPrincipal, ULogin;

procedure TFormAgendamento.btnCancelarClick(Sender: TObject);
begin
  Close;
end;

function TFormAgendamento.VerificaCampos() : boolean;
begin
  if edtPlaca.Text = '' then
  begin
    showmessage('Informe uma placa!');
    result := false;
  end
  else if edtModelo.Text = '' then
  begin
    showmessage('Informe um modelo!');
    result := false;
  end
  else if cbTipoVeiculo.ItemIndex = -1 then
  begin
    showmessage('Selecione algum tipo de veiculo!');
    result := false;
  end
  else if cxGridClientes.Controller.SelectedRowCount <= 0  then
  begin
    showmessage('Selecione um cliente!');
    result := false;
  end
  else if cxGridFuncionarios.Controller.SelectedRowCount <= 0  then
  begin
    showmessage('Selecione um funcionario!');
    result := false;
  end
  else if cxGridServicos.Controller.SelectedRowCount <= 0 then
  begin
    showmessage('Selecione ao menos um serviço!');
    result := false;
  end

  else
    result := true;
end;

function TFormAgendamento.HoraEntrega(hora: TTime): TTime;
begin
  Result := IncHour(hora, 1);
end;


procedure TFormAgendamento.btnSalvarClick(Sender: TObject);
var
  idAgendamento, i : integer;
begin

  if VerificaCampos then
  begin

    with TFDQuery.Create(Self) do
    begin
      try
        connection := dm.con;

        sql.Add('insert into AGENDAMENTOS(ID_CLIENTE, ID_FUNCINARIO, DATA_AGENDAMENTO, DATA_AGENDADA, HORA_AGENDAMENTO, HORA_ENTREGA, PLACA, TIPO_VEICULO, STATUS, MODELO)');
        sql.Add('values (:ID_CLIENTE, :ID_FUNCINARIO, :DATA_AGENDAMENTO, :DATA_AGENDADA, :HORA_AGENDAMENTO, :HORA_ENTREGA, :PLACA, :TIPO_VEICULO, :STATUS, :MODELO)');
        sql.Add('returning id');

        ParamByName('ID_CLIENTE').Value := cxGridClientes.DataController.DataSet.FieldByName('ID').Value;
        ParamByName('ID_FUNCINARIO').Value := cxGridFuncionarios.DataController.DataSet.FieldByName('ID').Value;

        ParamByName('DATA_AGENDAMENTO').DataType :=  ftdate;
        ParamByName('DATA_AGENDAMENTO').asdate := now;

        ParamByName('DATA_AGENDADA').DataType :=  ftdate;
        ParamByName('DATA_AGENDADA').asdate :=  dtDiaAgendamento.Date;

        ParamByName('HORA_AGENDAMENTO').DataType := ftTime;
        ParamByName('HORA_AGENDAMENTO').AsTime := timePicker.Time;

        ParamByName('HORA_ENTREGA').DataType := ftTime;
        ParamByName('HORA_ENTREGA').Astime := HoraEntrega(timePicker.Time);

        ParamByName('PLACA').Value := edtPlaca.Text;
        ParamByName('TIPO_VEICULO').Value := cbTipoVeiculo.ItemIndex;
        ParamByName('MODELO').Value := edtModelo.Text;
        ParamByName('STATUS').Value := '0';

        Open;

        idAgendamento := FieldByName('ID').Value;

        with cxGridServicos do
        begin
          for I := 0 to pred(Controller.SelectedRowCount) do
          begin
            SQL.Clear;
            SQL.Add('insert into ITENS_AGENDAMENTO(id, id_agendamento)');
            sql.Add('values(:id, :id_agendamento)');

            parambyname('id').Value := DataController.Values[DataController.GetSelectedRowIndex(i), cxGridServicosID.Index];
            parambyname('id_agendamento').Value := idAgendamento;

            execsql;
          end;
        end;

      finally

        showmessage('Agendamento realizado com sucesso!');

        Free;

      end;
    end;

    close;
  end;

end;

procedure TFormAgendamento.FormShow(Sender: TObject);
begin
  if FormLogin.funcionario then
  begin
    with queryFuncionarios do
    begin
      sql.Clear;
      sql.Add('select * from usuarios where id = :id');
      ParamByName('id').Value := FormLogin.idUsuario;
      open;
    end;
  end
  
  else
    queryFuncionarios.Open;
  queryServicos.Open;
  queryClientes.Open;
end;

end.
