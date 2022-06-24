object DmConexion: TDmConexion
  OldCreateOrder = False
  Height = 129
  Width = 194
  object AdoConexionBd: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=SQLOLEDB.1;Password=123;Persist Security Info=True;User' +
      ' ID=sa;Initial Catalog=BUYS_BIG;Data Source=DESKTOP-7P3IRE9;Use ' +
      'Procedure for Prepare=1;Auto Translate=True;Packet Size=4096;Wor' +
      'kstation ID=DESKTOP-7P3IRE9;Use Encryption for Data=False;Tag wi' +
      'th column collation when possible=False'
    Provider = 'SQLOLEDB.1'
    Left = 80
    Top = 40
  end
end
