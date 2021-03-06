unit Control_Gestion;


interface

Type
  TControl_Gestion = class
  private
    { Private declarations }
    public

    Clie_Identificacion : Currency;
    Clie_Nombre         : String;
    Clie_Sexo           : String;
    Clie_FechaNacimiento: TDateTime;
    Clie_Departamento   : String;
    Clie_Municipio      : String;
    Clie_Direccion      : String;
    Clie_Telefono       : Currency;


    Pro_Codigo          : String;
    Num_Factura         : Currency;
    Valor_Pro           : Currency;
    Cant_Pro            : Currency;
    Fecha_Factura       : TDateTime;
    Valor_Total         : Currency;

         Pro_Categoria : String;
         Pro_Nombre    : String;
         Pro_Valor     : Currency;


         Tipo_Factura   : String;
         Cons_Factura   : Currency;
         Fecha_Temporal : TDateTime;

    Public Function RegistrarClienteBD(Actividad:String):String;
    Public Function ValidarClienteBD(Cliente_Id:Currency):String;


    Public Function RegistrarProductoBD(Actividad:String):String;
    Public Function ValidarProductoBD(Producto_Id:String):String;

    { Public declarations }
  end;


  implementation

  uses DmGestion;

// ****** Validacion de Existencia del numero del cliente ingresaro en base de datos.
Function TControl_Gestion.ValidarClienteBD(Cliente_Id:Currency):String;
    Var Modelo_Gestion : TDmGestion_Data;
begin
    DmGestion_Data := TDmGestion_Data.Create(Nil);
    Try
        If ( DmGestion_Data.ValidarClienteBD(Self,Cliente_Id) = True ) Then
         Begin
            Result := 'El Cliente ya se encuentra registrado en la base de datos.';
         End Else Begin Result := '' ; End;
    Finally
      DmGestion_Data.Free;
    End;
end;



//**** Acciones y validaciones para el insert o update de un registro en la tabla cliente.
Function TControl_Gestion.RegistrarClienteBD(Actividad:String):String;
    Var Modelo_Gestion : TDmGestion_Data;
begin
    DmGestion_Data := TDmGestion_Data.Create(Nil);
    Try
      If ( DmGestion_Data.RegistrarClienteBD(Self,Actividad) = 2 ) Then
      Begin
          Result := 'Error.';
      End
        Else
            Begin
                Result := 'Ok';
            End;
    Finally
      DmGestion_Data.Free;
    End;
end;


 //******* Validacion de Existencia de un producto por codigoPro, ingresaro en base de datos.
Function TControl_Gestion.ValidarProductoBD(Producto_Id:String):String;
    Var Modelo_Gestion : TDmGestion_Data;
begin
    DmGestion_Data := TDmGestion_Data.Create(Nil);
    Try
        If ( DmGestion_Data.ValidarProdcutoBD(Self,Producto_Id) = True ) Then
         Begin
            Result := 'El Producto ya se encuentra registrado en la base de datos.';
         End Else Begin Result := '' ; End;
    finally
      DmGestion_Data.Free;
    end;
end;

//**** Acciones y validaciones para el insert o update de un registro en la tabla cliente.
Function TControl_Gestion.RegistrarProductoBD(Actividad:String):String;
    Var Modelo_Gestion : TDmGestion_Data;
begin
    DmGestion_Data := TDmGestion_Data.Create(Nil);
    Try
      If ( DmGestion_Data.RegistrarProducto(Self,Actividad) = 2 ) Then
      Begin
          Result := 'Error.';
      End
        Else
            Begin
                Result := 'Ok';
            End;
    Finally
      DmGestion_Data.Free;
    End;
end;









end.
