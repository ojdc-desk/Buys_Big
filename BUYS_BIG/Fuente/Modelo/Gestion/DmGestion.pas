unit DmGestion;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB, Control_Gestion;

type
  TDmGestion_Data = class(TDataModule)
    QryClientes: TADOQuery;
    QryProductos: TADOQuery;
    QryProductosPRODUCTO: TStringField;
    QryProductosCATEGORIA: TStringField;
    QryProductosNOMBRE_PRODUCTO: TStringField;
    QryProductosVALOR: TFloatField;
    QryCiudades: TADOQuery;
    DsDepartamento: TDataSource;
    DsCiudades: TDataSource;
    QryDepartamentos: TADOQuery;
    QryDepartamentosNUM_DEPARTAMENTO: TStringField;
    QryDepartamentosNOMBRE_DEPARTAMENTO: TStringField;
    QryCiudadesNUM_DEPARTAMENTO: TStringField;
    QryCiudadesNUM_CIUDAD: TStringField;
    QryCiudadesNOMBRE_CIUDAD: TStringField;
    QryCiudadesCLAVE: TStringField;
    QryCategorias: TADOQuery;
    DsCategorias: TDataSource;
    QryCategoriasCATEGORIA: TStringField;
    QryCategoriasNOMBRE_CATEGORIA: TStringField;
    QryCuentaProductos: TADOQuery;
    QryCuentaProductosCANT_PRODUCTOS: TIntegerField;
    DsProductos: TDataSource;
    QryCabezaFactura: TADOQuery;
    QryDetalleFactura: TADOQuery;
    DsDetalleFactura: TDataSource;
    QryClientesCLIENTE: TBCDField;
    QryClientesNOMBRE_CLIENTE: TStringField;
    QryClientesSEXO: TStringField;
    QryClientesFECHA_NACIMIENTO: TWideStringField;
    QryClientesNUM_DEPARTAMENTO: TStringField;
    QryClientesNUM_CIUDAD: TStringField;
    QryClientesDIRECCION: TStringField;
    QryClientesNUM_TELEFONICO: TBCDField;
    QryCabezaFacturaNUMERO: TBCDField;
    QryCabezaFacturaFECHA: TDateTimeField;
    QryCabezaFacturaCLIENTE: TBCDField;
    QryCabezaFacturaTOTAL: TFloatField;
    QryProductosDisponibles: TADOQuery;
    QryProductosDisponiblesPRODUCTO: TStringField;
    QryProductosDisponiblesNOMBRE_PRODUCTO: TStringField;
    DsProductosDisponibles: TDataSource;
    QryDetalleFacturaITEM: TLargeintField;
    QryDetalleFacturaNOMBRE_PRODUCTO: TStringField;
    QryDetalleFacturaVALOR_TOTAL: TWideStringField;
    QryDetalleFacturaNUMERO: TBCDField;
    QryDetalleFacturaNUMERO_ITEM: TBCDField;
    QryDetalleFacturaPRODUCTO: TStringField;
    QryDetalleFacturaCANTIDAD: TBCDField;
    QryDetalleFacturaVALOR: TFloatField;
    QryDetalleFacturaVALOR_UNIDAD: TWideStringField;
    ValidaNumeroFactura: TADOQuery;
    ValidaNumeroFacturaTIPO_FACTURA: TStringField;
    ValidaNumeroFacturaNUM_FACTURA: TBCDField;
    ValidaNumeroFacturaFEC_FACTURA: TDateTimeField;
    QrySuplente: TADOQuery;
  private
    { Private declarations }
  public

    Public Function RegistrarClienteBD(Datos:TControl_Gestion;Actividad:String):Currency;
    Public Function ValidarClienteBD(Datos:TControl_Gestion;Cliente_Id:Currency):Boolean;

    Public Function RegistrarProducto(Datos:TControl_Gestion;Actividad:String):Currency;
    Public Function ValidarProdcutoBD(Datos:TControl_Gestion;Producto_Id:String):Boolean;

    Public Function FacturarProducto(Datos:TControl_Gestion):Boolean;

    Public Procedure ConsultaDetalle(Factura:Currency);
    Public Procedure ProdcutosDisponibles(Factura:Currency);

    Public Function GenerarNumeroFactura(Datos:TControl_Gestion):Boolean;

    { Public declarations }
  end;
var
  DmGestion_Data: TDmGestion_Data;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses DmConnectionDB;

{$R *.dfm}
//*** Validacion de un Cliente en la base de datos.
Function TDmGestion_Data.ValidarClienteBD(Datos:TControl_Gestion;Cliente_Id:Currency):Boolean;
begin
    QryClientes.Close;
    QryClientes.Parameters[0].Value := Cliente_Id;
    QryClientes.Open;

    If ( QryClientes.RecordCount = 1 ) Then
     Begin
         Datos.Clie_Identificacion  := QryClientesCLIENTE.Value;
         Datos.Clie_Nombre          := QryClientesNOMBRE_CLIENTE.Value;
         Datos.Clie_Sexo            := QryClientesSEXO.Value;
         Datos.Clie_FechaNacimiento := QryClientesFECHA_NACIMIENTO.Value;
         Datos.Clie_Departamento    := QryClientesNUM_DEPARTAMENTO.Value;
         Datos.Clie_Municipio       := QryClientesNUM_CIUDAD.Value;
         Datos.Clie_Direccion       := QryClientesDIRECCION.Value;
         Datos.Clie_Telefono        := QryClientesNUM_TELEFONICO.Value;
         Result                     := True;
     End
       Else
          Begin Result := False; End;
end;
//*** Registro de un Cliente en la base de datos.
Function TDmGestion_Data.RegistrarClienteBD(Datos:TControl_Gestion;Actividad:String):Currency;
begin
   Try
     DmConexion.AdoConexionBd.BeginTrans;

     QryClientes.Close;
     QryClientes.Parameters[0].Value := Datos.Clie_Identificacion;
     QryClientes.Open;

     If ( Actividad = 'REGISTRAR CLIENTE' ) Then
      Begin
         QryClientes.Insert;
         QryClientesCLIENTE.Value          :=  Datos.Clie_Identificacion;
      End Else Begin  QryClientes.Edit;  End;
         QryClientesNOMBRE_CLIENTE.Value   := UpperCase(Datos.Clie_Nombre);
         QryClientesSEXO.Value             := Datos.Clie_Sexo;
         QryClientesFECHA_NACIMIENTO.Value := Datos.Clie_FechaNacimiento;
         QryClientesNUM_DEPARTAMENTO.Value := Datos.Clie_Departamento;
         QryClientesNUM_CIUDAD.Value       := Datos.Clie_Municipio;
         QryClientesDIRECCION.Value        := UpperCase(Datos.Clie_Direccion);
         QryClientesNUM_TELEFONICO.Value   := Datos.Clie_Telefono;
         QryClientes.Post;
      DmConexion.AdoConexionBd.CommitTrans;

      Result   :=  1;
   Except
      Result   :=  2;
      DmConexion.AdoConexionBd.RollbackTrans;
   End;
end;
//*** Validacion de un Cliente en la base de datos.
Function TDmGestion_Data.ValidarProdcutoBD(Datos:TControl_Gestion;Producto_Id:String):Boolean;
begin
    QryProductos.Close;
    QryProductos.Parameters[0].Value := Producto_Id;
    QryProductos.Open;

    If ( QryProductos.RecordCount = 1 ) Then
     Begin
         Datos.Pro_Codigo    := QryProductosPRODUCTO.Value;
         Datos.Pro_Categoria := QryProductosCATEGORIA.Value;
         Datos.Pro_Nombre    := QryProductosNOMBRE_PRODUCTO.Value;
         Datos.Pro_Valor     := QryProductosVALOR.Value;
         Result              := True;
     End
       Else
          Begin Result := False; End;
end;
//*** Registro de un Cliente en la base de datos.
Function TDmGestion_Data.RegistrarProducto(Datos:TControl_Gestion;Actividad:String):Currency;
 Var CodProductoNuevo : String;
begin
   Try
     DmConexion.AdoConexionBd.BeginTrans;

     QryProductos.Close;
     QryProductos.Parameters[0].Value := Datos.Pro_Codigo;
     QryProductos.Open;

     If ( Actividad = 'REGISTRAR PRODUCTO' ) Then
      Begin
         QryCuentaProductos.Close;
         QryCuentaProductos.Open;
         CodProductoNuevo :=  Datos.Pro_Categoria + FormatFloat('0000000000',QryCuentaProductosCANT_PRODUCTOS.Value+1);
         QryProductos.Insert;
         QryProductosPRODUCTO.Value         :=  CodProductoNuevo;
      End Else Begin  QryClientes.Edit;  End;
         QryProductosCATEGORIA.Value        := Datos.Pro_Categoria;
         QryProductosNOMBRE_PRODUCTO.Value  := UpperCase(Datos.Pro_Nombre);
         QryProductosVALOR.Value            := Datos.Pro_Valor;
         QryProductos.Post;

      DmConexion.AdoConexionBd.CommitTrans;
      Result   :=  1;
   Except
      Result   :=  2;
      DmConexion.AdoConexionBd.RollbackTrans;
   End;
end;



//*** Consulta el detalle de una factura.
procedure TDmGestion_Data.ConsultaDetalle(Factura: Currency);
begin
     QryDetalleFactura.Close;
     QryDetalleFactura.Parameters[0].Value := Factura ;
     QryDetalleFactura.Open;
end;
//*** Consulta los productos disponibles.
procedure TDmGestion_Data.ProdcutosDisponibles(Factura: Currency);
begin
     QryProductosDisponibles.Close;
     QryProductosDisponibles.Parameters[0].Value := Factura ;
     QryProductosDisponibles.Open;
end;

//*** Registro de un producto en la factura.
function TDmGestion_Data.FacturarProducto(Datos: TControl_Gestion): Boolean;
begin
       Try
         DmConexion.AdoConexionBd.BeginTrans;

         ConsultaDetalle(Datos.Num_Factura);

         QryProductos.Close;
         QryProductos.Parameters[0].Value := Datos.Pro_Codigo;
         QryProductos.Open;

         //--------- Si no retorna resultados, damos por sentado que es el primer producto por lo cual se registrar
         //--------- primero el emcabezado y luego del detalle.

         If ( QryDetalleFactura.RecordCount = 0 ) Then
          Begin
              QryCabezaFactura.Close;
              QryCabezaFactura.Parameters[0].Value :=  Datos.Num_Factura;
              QryCabezaFactura.Open;

              QryCabezaFactura.Insert;
              QryCabezaFacturaNUMERO.Value   := Datos.Num_Factura;
              QryCabezaFacturaFECHA.Value    := Datos.Fecha_Factura;
              QryCabezaFacturaCLIENTE.Value  := Datos.Clie_Identificacion;
              QryCabezaFacturaTOTAL.Value    := QryProductosVALOR.Value*Datos.Cant_Pro;
              QryCabezaFactura.Post;

                 //------ Registro del detalle del producto seleccionado.
                 QryDetalleFactura.Insert;
                 QryDetalleFacturaNUMERO.Value       := Datos.Num_Factura;                //--- Numero Factura
                 QryDetalleFacturaNUMERO_ITEM.Value  := QryDetalleFactura.RecordCount+1;  //--- Itme Adicionado
                 QryDetalleFacturaPRODUCTO.Value     := Datos.Pro_Codigo;                 //--- Codigo Producto
                 QryDetalleFacturaCANTIDAD.Value     := Datos.Cant_Pro;                   //--- Cantidad Producto
                 QryDetalleFacturaVALOR.Value        := QryProductosVALOR.Value;          //--- Valor Producto
                 QryDetalleFactura.Post;
          End
             Else
                 Begin   //------- Registro de la tabla detalle factura.

                     QryCabezaFactura.Close;
                     QryCabezaFactura.Parameters[0].Value := Datos.Num_Factura;
                     QryCabezaFactura.Open;

                     QryDetalleFactura.Insert;
                     QryDetalleFacturaNUMERO.Value       := Datos.Num_Factura;                //--- Numero Factura
                     QryDetalleFacturaNUMERO_ITEM.Value  := QryDetalleFactura.RecordCount+1;  //--- Itme Adicionado
                     QryDetalleFacturaPRODUCTO.Value     := Datos.Pro_Codigo;                 //--- Codigo Producto
                     QryDetalleFacturaCANTIDAD.Value     := Datos.Cant_Pro;                   //--- Codigo Producto
                     QryDetalleFacturaVALOR.Value        := QryProductosVALOR.Value;          //--- Valor  Producto
                     QryDetalleFactura.Post;

                     QryCabezaFactura.Edit;
                     QryCabezaFacturaTOTAL.Value   := QryCabezaFacturaTOTAL.Value + (QryProductosVALOR.Value*Datos.Cant_Pro);
                     QryCabezaFactura.Post;
                 End;

          DmConexion.AdoConexionBd.CommitTrans;

          Datos.Valor_Total := QryCabezaFacturaTOTAL.Value;

          Result   :=  True;
       Except
          Result   :=  False;
          DmConexion.AdoConexionBd.RollbackTrans;
       End;
end;





 //***** Validar si el cliente tiene numero de facturas en  ceros,
function TDmGestion_Data.GenerarNumeroFactura(Datos: TControl_Gestion): Boolean;
begin
    { Si elcliente tiene facturas en cero, se da por entendido que la factura sigue en proceso y se debe cargar productos y
      finalizar el procesode facturacion  o dirigirce a la seccion de eliminacion de facturas.  }
    Try
            ValidaNumeroFactura.Close;
            ValidaNumeroFactura.Parameters[0].Value := DATOS.Clie_Identificacion;
            ValidaNumeroFactura.Open;

            If ( ValidaNumeroFactura.RecordCount <> 0 ) Then
            Begin
               Datos.Tipo_Factura   := ValidaNumeroFacturaTIPO_FACTURA.Value;
               Datos.Cons_Factura   := ValidaNumeroFacturaNUM_FACTURA.Value;
               Datos.Fecha_Temporal := ValidaNumeroFacturaFEC_FACTURA.Value;
             End
               Else
                   Begin
                       QrySuplente.Close;
                       QrySuplente.SQL.Clear;
                       QrySuplente.SQL.Add( ' SELECT COUNT(*)+1 AS NUM_FACTURA FROM CABEZA_FACTURA ');
                       QrySuplente.Open;

                       Datos.Tipo_Factura   := 'NUEVA';
                       Datos.Cons_Factura   := QrySuplente.FieldByName('NUM_FACTURA').Value;
                       Datos.Fecha_Temporal := Now();
                   End;
      Result := True;
    Finally
      Result := False;
    End;


  Result := True;
end;

end.
