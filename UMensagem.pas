unit UMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TFormMensagem = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    pnlDireito: TPanel;
    btnDireito: TSpeedButton;
    pnlEsquerdo: TPanel;
    btnEsquerdo: TSpeedButton;
    lblTituloMensagem: TLabel;
    lblCorpoMensagem: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMensagem: TFormMensagem;

implementation

{$R *.dfm}

end.
