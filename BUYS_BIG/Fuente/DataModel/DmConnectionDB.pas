unit DmConnectionDB;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TDmConexion = class(TDataModule)
    AdoConexionBd: TADOConnection;
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  DmConexion: TDmConexion;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
