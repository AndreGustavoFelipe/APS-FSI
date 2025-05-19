unit UItensAgendamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, cxDataControllerConditionalFormattingRulesManagerDialog,
  Vcl.StdCtrls, Vcl.ExtCtrls, cxGridCardView, cxGridDBCardView,
  cxGridCustomLayoutView;

type
  TFormItensAgendamento = class(TForm)
    queryItens: TFDQuery;
    dsItens: TDataSource;
    Panel1: TPanel;
    lbServicosAgendamento: TLabel;
    cxGrid1: TcxGrid;
    cxGridAgendamentos: TcxGridDBTableView;
    cxGrid1DBCardView1: TcxGridDBCardView;
    cxGrid1DBCardView1ID: TcxGridDBCardViewRow;
    cxGrid1DBCardView1ID_CLIENTE: TcxGridDBCardViewRow;
    cxGrid1DBCardView1ID_FUNCINARIO: TcxGridDBCardViewRow;
    cxGrid1DBCardView1DATA_AGENDAMENTO: TcxGridDBCardViewRow;
    cxGrid1DBCardView1DATA_AGENDADA: TcxGridDBCardViewRow;
    cxGrid1DBCardView1HORA_AGENDAMENTO: TcxGridDBCardViewRow;
    cxGrid1DBCardView1HORA_ENTREGA: TcxGridDBCardViewRow;
    cxGrid1DBCardView1PLACA: TcxGridDBCardViewRow;
    cxGrid1DBCardView1TIPO_VEICULO: TcxGridDBCardViewRow;
    cxGrid1DBCardView1TIPO_LAVACAO: TcxGridDBCardViewRow;
    cxGrid1DBCardView1STATUS: TcxGridDBCardViewRow;
    cxGrid1Level1: TcxGridLevel;
    queryItensID: TIntegerField;
    queryItensDESCRICAO: TStringField;
    cxGridAgendamentosID: TcxGridDBColumn;
    cxGridAgendamentosDESCRICAO: TcxGridDBColumn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormItensAgendamento: TFormItensAgendamento;

implementation

{$R *.dfm}

uses UDataModule;

 end.
