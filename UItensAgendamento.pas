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
  cxGridCustomView, cxGrid;

type
  TFormItensAgendamento = class(TForm)
    cxGridItensAgendamento: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    queryItens: TFDQuery;
    dsItens: TDataSource;
    queryItensID: TIntegerField;
    queryItensDESCRICAO: TStringField;
    cxGridItensAgendamentoID: TcxGridDBColumn;
    cxGridItensAgendamentoDESCRICAO: TcxGridDBColumn;
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
