program prj;

uses
  Vcl.Forms,
  ULogin in 'ULogin.pas' {FormLogin},
  UPrincipal in 'UPrincipal.pas' {FormPrincipal},
  UUsuarios in 'UUsuarios.pas' {FormUsuarios};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormLogin, FormLogin);
  Application.CreateForm(TFormUsuarios, FormUsuarios);
  Application.Run;
end.
