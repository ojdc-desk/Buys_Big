object DmGestion_Data: TDmGestion_Data
  OldCreateOrder = False
  Height = 402
  Width = 585
  object QryClientes: TADOQuery
    Connection = DmConexion.AdoConexionBd
    CursorType = ctStatic
    Parameters = <
      item
        Name = '000'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      ''
      ''
      ''
      'SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED'
      #9'SELECT  *  FROM  CLIENTES   WITH (NOLOCK)'
      ''
      #9'WHERE CLIENTE =:"000"')
    Left = 40
    Top = 40
    object QryClientesCLIENTE: TBCDField
      FieldName = 'CLIENTE'
      Precision = 18
      Size = 0
    end
    object QryClientesNOMBRE_CLIENTE: TStringField
      FieldName = 'NOMBRE_CLIENTE'
      Size = 500
    end
    object QryClientesSEXO: TStringField
      FieldName = 'SEXO'
      FixedChar = True
      Size = 1
    end
    object QryClientesFECHA_NACIMIENTO: TWideStringField
      FieldName = 'FECHA_NACIMIENTO'
      Size = 10
    end
    object QryClientesNUM_DEPARTAMENTO: TStringField
      FieldName = 'NUM_DEPARTAMENTO'
      Size = 2
    end
    object QryClientesNUM_CIUDAD: TStringField
      FieldName = 'NUM_CIUDAD'
      Size = 3
    end
    object QryClientesDIRECCION: TStringField
      FieldName = 'DIRECCION'
      Size = 500
    end
    object QryClientesNUM_TELEFONICO: TBCDField
      FieldName = 'NUM_TELEFONICO'
      Precision = 10
      Size = 0
    end
  end
  object QryProductos: TADOQuery
    Connection = DmConexion.AdoConexionBd
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'CODproduc'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      'SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED'
      
        #9'SELECT  * FROM PRODUCTOS   WITH (NOLOCK) WHERE PRODUCTO =:"CODp' +
        'roduc"')
    Left = 360
    Top = 56
    object QryProductosPRODUCTO: TStringField
      FieldName = 'PRODUCTO'
      Size = 15
    end
    object QryProductosCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 5
    end
    object QryProductosNOMBRE_PRODUCTO: TStringField
      FieldName = 'NOMBRE_PRODUCTO'
      Size = 800
    end
    object QryProductosVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object QryCiudades: TADOQuery
    Connection = DmConexion.AdoConexionBd
    CursorType = ctStatic
    Parameters = <
      item
        Name = '73'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      ''
      #9'SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED'
      
        #9'SELECT CONCAT (NUM_DEPARTAMENTO,NUM_CIUDAD) AS CLAVE , * FROM C' +
        'IUDADES   WITH (NOLOCK)'
      #9'WHERE NUM_DEPARTAMENTO =:"73"'
      ''
      ''
      '')
    Left = 360
    Top = 248
    object QryCiudadesNUM_DEPARTAMENTO: TStringField
      FieldName = 'NUM_DEPARTAMENTO'
      Size = 2
    end
    object QryCiudadesNUM_CIUDAD: TStringField
      FieldName = 'NUM_CIUDAD'
      Size = 3
    end
    object QryCiudadesNOMBRE_CIUDAD: TStringField
      FieldName = 'NOMBRE_CIUDAD'
      Size = 500
    end
    object QryCiudadesCLAVE: TStringField
      FieldName = 'CLAVE'
      ReadOnly = True
      Size = 5
    end
  end
  object DsDepartamento: TDataSource
    DataSet = QryDepartamentos
    Left = 440
    Top = 192
  end
  object DsCiudades: TDataSource
    DataSet = QryCiudades
    Left = 440
    Top = 248
  end
  object QryDepartamentos: TADOQuery
    Connection = DmConexion.AdoConexionBd
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ''
      'SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED'
      #9'SELECT  * FROM DEPARTAMENTOS   WITH (NOLOCK)')
    Left = 360
    Top = 192
    object QryDepartamentosNUM_DEPARTAMENTO: TStringField
      FieldName = 'NUM_DEPARTAMENTO'
      Size = 2
    end
    object QryDepartamentosNOMBRE_DEPARTAMENTO: TStringField
      FieldName = 'NOMBRE_DEPARTAMENTO'
      Size = 500
    end
  end
  object QryCategorias: TADOQuery
    Connection = DmConexion.AdoConexionBd
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      ''
      ''
      'SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED'
      #9'SELECT  * FROM CATEGORIAS_DE_PRODUCTOS   WITH (NOLOCK)'
      '')
    Left = 360
    Top = 136
    object QryCategoriasCATEGORIA: TStringField
      FieldName = 'CATEGORIA'
      Size = 5
    end
    object QryCategoriasNOMBRE_CATEGORIA: TStringField
      FieldName = 'NOMBRE_CATEGORIA'
      Size = 200
    end
  end
  object DsCategorias: TDataSource
    DataSet = QryCategorias
    Left = 440
    Top = 136
  end
  object QryCuentaProductos: TADOQuery
    Connection = DmConexion.AdoConexionBd
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED'
      
        #9'SELECT  COUNT(*) AS CANT_PRODUCTOS FROM PRODUCTOS   WITH (NOLOC' +
        'K) '
      #9)
    Left = 128
    Top = 40
    object QryCuentaProductosCANT_PRODUCTOS: TIntegerField
      FieldName = 'CANT_PRODUCTOS'
      ReadOnly = True
    end
  end
  object DsProductos: TDataSource
    DataSet = QryProductos
    Left = 440
    Top = 56
  end
  object QryCabezaFactura: TADOQuery
    Connection = DmConexion.AdoConexionBd
    CursorType = ctStatic
    Parameters = <
      item
        Name = '1'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      #9'SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED'
      #9'SELECT *  FROM CABEZA_FACTURA   WITH (NOLOCK)'
      #9'WHERE NUMERO =:"1"')
    Left = 160
    Top = 160
    object QryCabezaFacturaNUMERO: TBCDField
      FieldName = 'NUMERO'
      Precision = 18
      Size = 0
    end
    object QryCabezaFacturaFECHA: TDateTimeField
      FieldName = 'FECHA'
    end
    object QryCabezaFacturaCLIENTE: TBCDField
      FieldName = 'CLIENTE'
      Precision = 18
      Size = 0
    end
    object QryCabezaFacturaTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object QryDetalleFactura: TADOQuery
    Connection = DmConexion.AdoConexionBd
    CursorType = ctStatic
    Parameters = <
      item
        Name = '1'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      #9'SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED'
      
        #9'SELECT ROW_NUMBER() OVER(PARTITION BY T0.NUMERO ORDER BY T0.NUM' +
        'ERO DESC) AS '#39'ITEM'#39','
      #9'T1.NOMBRE_PRODUCTO ,'
      ''
      
        #9'FORMAT (T0.VALOR*T0.CANTIDAD,'#39'##,###'#39') AS VALOR_TOTAL, T0.*  , ' +
        'FORMAT (T0.VALOR,'#39'##,###'#39') AS VALOR_UNIDAD'
      #9'FROM DETALLE_FACTURA T0  WITH (NOLOCK)'
      #9'INNER JOIN PRODUCTOS T1  ON T0.PRODUCTO = T1.PRODUCTO'
      #9'WHERE NUMERO = :"1"')
    Left = 160
    Top = 208
    object QryDetalleFacturaITEM: TLargeintField
      FieldName = 'ITEM'
      ReadOnly = True
    end
    object QryDetalleFacturaNOMBRE_PRODUCTO: TStringField
      FieldName = 'NOMBRE_PRODUCTO'
      Size = 800
    end
    object QryDetalleFacturaVALOR_TOTAL: TWideStringField
      FieldName = 'VALOR_TOTAL'
      ReadOnly = True
      Size = 4000
    end
    object QryDetalleFacturaNUMERO: TBCDField
      FieldName = 'NUMERO'
      Precision = 18
      Size = 0
    end
    object QryDetalleFacturaNUMERO_ITEM: TBCDField
      FieldName = 'NUMERO_ITEM'
      Precision = 18
      Size = 0
    end
    object QryDetalleFacturaPRODUCTO: TStringField
      FieldName = 'PRODUCTO'
      Size = 15
    end
    object QryDetalleFacturaCANTIDAD: TBCDField
      FieldName = 'CANTIDAD'
      Precision = 18
      Size = 0
    end
    object QryDetalleFacturaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object QryDetalleFacturaVALOR_UNIDAD: TWideStringField
      FieldName = 'VALOR_UNIDAD'
      ReadOnly = True
      Size = 4000
    end
  end
  object DsDetalleFactura: TDataSource
    DataSet = QryDetalleFactura
    Left = 224
    Top = 208
  end
  object QryProductosDisponibles: TADOQuery
    Connection = DmConexion.AdoConexionBd
    CursorType = ctStatic
    Parameters = <
      item
        Name = 'factura'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      ''
      #9'SELECT T.PRODUCTO, T.NOMBRE_PRODUCTO FROM PRODUCTOS T'
      
        #9'WHERE   NOT EXISTS (SELECT '#39'X'#39' FROM  DETALLE_FACTURA TR WHERE T' +
        'R.NUMERO =:"factura" AND TR.PRODUCTO = T.PRODUCTO )'
      '')
    Left = 160
    Top = 112
    object QryProductosDisponiblesPRODUCTO: TStringField
      FieldName = 'PRODUCTO'
      Size = 15
    end
    object QryProductosDisponiblesNOMBRE_PRODUCTO: TStringField
      FieldName = 'NOMBRE_PRODUCTO'
      Size = 800
    end
  end
  object DsProductosDisponibles: TDataSource
    DataSet = QryProductosDisponibles
    Left = 224
    Top = 112
  end
  object ValidaNumeroFactura: TADOQuery
    Connection = DmConexion.AdoConexionBd
    CursorType = ctStatic
    Parameters = <
      item
        Name = '10'
        Size = -1
        Value = Null
      end>
    SQL.Strings = (
      '  Declare @Num_IdCliente Numeric(18,0);'
      '  Declare @NumFactura    Numeric(18,0);'
      '  Declare @FechaFac      DateTime;'
      '  Declare @TipoFactura   Varchar(50);'
      ''
      '  Set @Num_IdCliente =:"10";'
      '  Set @TipoFactura   = '#39'NUEVA'#39';'
      ''
      
        '  SELECT  TOP 1  @NumFactura = NUMERO , @FechaFac = FECHA  FROM ' +
        'CABEZA_FACTURA  WHERE CLIENTE = @Num_IdCliente AND TOTAL = 0 OR ' +
        'TOTAL IS NULL'
      '  '#9
      '  IF @@ROWCOUNT > 0'
      #9'BEGIN '
      #9#9'SET @TipoFactura   = '#39'PENDIENTE'#39';'
      
        #9'    SELECT @TipoFactura AS TIPO_FACTURA ,@NumFactura AS NUM_FAC' +
        'TURA, @FechaFac AS FEC_FACTURA'
      #9'END'
      #9'  Else'
      #9'     Begin'
      
        #9#9#9' SET   @NumFactura = (SELECT TOP 1 NUMERO  FROM CABEZA_FACTUR' +
        'A   WITH (NOLOCK) )+1;'
      #9#9#9' SET   @FechaFac   = GETDATE();'
      
        #9#9#9' SELECT @TipoFactura AS TIPO_FACTURA ,@NumFactura AS NUM_FACT' +
        'URA, @FechaFac AS FEC_FACTURA'
      #9#9' End;')
    Left = 384
    Top = 344
    object ValidaNumeroFacturaTIPO_FACTURA: TStringField
      FieldName = 'TIPO_FACTURA'
      ReadOnly = True
      Size = 50
    end
    object ValidaNumeroFacturaNUM_FACTURA: TBCDField
      FieldName = 'NUM_FACTURA'
      ReadOnly = True
      Precision = 18
      Size = 0
    end
    object ValidaNumeroFacturaFEC_FACTURA: TDateTimeField
      FieldName = 'FEC_FACTURA'
      ReadOnly = True
    end
  end
  object QrySuplente: TADOQuery
    Connection = DmConexion.AdoConexionBd
    Parameters = <>
    Left = 64
    Top = 304
  end
end
