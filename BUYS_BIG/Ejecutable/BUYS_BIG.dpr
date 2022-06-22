program BUYS_BIG;

uses
  Vcl.Forms,
  FrmGestion in '..\Fuente\Vista\Gestion\FrmGestion.pas' {ViewGestion},
  DmConnectionDB in '..\Fuente\DataModel\DmConnectionDB.pas' {DmConexion: TDataModule},
  FrmPrincipal in '..\Fuente\Vista\FrmPrincipal.pas' {Form2},
  Control_Gestion in '..\Fuente\Controlador\Gestion\Control_Gestion.pas',
  DmGestion in '..\Fuente\Modelo\Gestion\DmGestion.pas' {DmGestion_Data: TDataModule},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'Face';
  Application.CreateForm(TViewGestion, ViewGestion);
  Application.CreateForm(TDmConexion, DmConexion);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TDmGestion_Data, DmGestion_Data);
  Application.Run;
end.
