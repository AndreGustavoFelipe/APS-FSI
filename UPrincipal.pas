unit UPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.Buttons, Vcl.StdCtrls, UUsuarios, Vcl.ComCtrls, Data.DB, Vcl.Grids,
<<<<<<< Updated upstream
  Vcl.DBGrids, UDashboard;
=======
  Vcl.DBGrids, UServicos;
>>>>>>> Stashed changes

type
  TFormPrincipal = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Image2: TImage;
    Label1: TLabel;
    Panel8: TPanel;
    btnUsuarios: TSpeedButton;
    Panel2: TPanel;
    btnDashboard: TSpeedButton;
    Panel9: TPanel;
    imgSair: TImage;
    btnSair: TSpeedButton;
    pnlBtnBuscar: TPanel;
    DBGrid1: TDBGrid;
    Panel12: TPanel;
    SpeedButton2: TSpeedButton;
    EditColaborador: TEdit;
    DateTimePicker1: TDateTimePicker;
    ComboBox1: TComboBox;
    btnBuscar: TSpeedButton;
    procedure btnUsuariosClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
<<<<<<< Updated upstream
    procedure btnDashboardClick(Sender: TObject);
=======
    procedure SpeedButton2Click(Sender: TObject);
>>>>>>> Stashed changes
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormPrincipal: TFormPrincipal;

implementation

{$R *.dfm}

uses ULogin;

procedure TFormPrincipal.btnUsuariosClick(Sender: TObject);
begin

  with TFormUsuarios.Create(Self) do
  begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;

end;

<<<<<<< Updated upstream
procedure TFormPrincipal.btnDashboardClick(Sender: TObject);
begin

  with TFormRelatorio.Create(Self) do
=======
procedure TFormPrincipal.SpeedButton2Click(Sender: TObject);
begin
  with TFormServicos.Create(self) do
>>>>>>> Stashed changes
  begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;
<<<<<<< Updated upstream

=======
>>>>>>> Stashed changes
end;

procedure TFormPrincipal.btnSairClick(Sender: TObject);
begin

  with TFormLogin.Create(Self) do
  begin
    try
      ShowModal;
    finally
      Free;
    end;
  end;

end;

end.
