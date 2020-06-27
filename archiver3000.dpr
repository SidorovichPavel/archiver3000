program archiver3000;

uses
  Vcl.Forms,
  mainUnit in 'mainUnit.pas' {MainForm},
  types in 'types.pas',
  win_condition in 'win_condition.pas',
  file_functions in 'file_functions.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
