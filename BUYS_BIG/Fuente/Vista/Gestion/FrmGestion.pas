unit FrmGestion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.WinXPickers , Control_Gestion,
  Vcl.Grids, Vcl.DBGrids, DmGestion, DmConnectionDB, Vcl.Menus, Vcl.Imaging.jpeg;

type
  TViewGestion = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Label1: TLabel;
    Edit1: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit3: TEdit;
    Edit4: TEdit;
    ComboBox1: TComboBox;
    Edit2: TEdit;
    BitBtn5: TBitBtn;
    BitBtn1: TBitBtn;
    TabSheet5: TTabSheet;
    Label8: TLabel;
    DatePicker1: TDatePicker;
    Label9: TLabel;
    BitBtn6: TBitBtn;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    DBLookupComboBox3: TDBLookupComboBox;
    BitBtn7: TBitBtn;
    BitBtn4: TBitBtn;
    DBGrid1: TDBGrid;
    BitBtn9: TBitBtn;
    Edit8: TEdit;
    DBLookupComboBox4: TDBLookupComboBox;
    Edit9: TEdit;
    Edit10: TEdit;
    Label14: TLabel;
    Label15: TLabel;
    DateTimePicker1: TDateTimePicker;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Timer1: TTimer;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    BitBtn8: TBitBtn;
    TabSheet4: TTabSheet;
    DBGrid2: TDBGrid;
    Edit11: TEdit;
    Edit12: TEdit;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    PopupMenu1: TPopupMenu;
    EliminarFactura1: TMenuItem;
    Image1: TImage;
    DBGrid3: TDBGrid;
    DBLookupComboBox5: TDBLookupComboBox;
    Label26: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    Procedure LimpiaClientes;
    Procedure LimpiaProductos;
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure Edit5Exit(Sender: TObject);
    procedure Edit9Exit(Sender: TObject);
    procedure BitBtn9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

    Procedure ConsultaDepartamento;
    Procedure ConsultaMunicipio;
    Procedure LimpiaFacturacion;
    Procedure LimpiarTraza;

    procedure DBLookupComboBox1Exit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DBLookupComboBox4Exit(Sender: TObject);

    procedure Edit11Exit(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure EliminarFactura1Click(Sender: TObject);
    procedure DBLookupComboBox5Exit(Sender: TObject);
    procedure DBGrid3DblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

   var ViewGestion        : TViewGestion;
       Control_Gestion    : TControl_Gestion;
       DmGestion          : TDmGestion_Data;
       DmConnectionDB     : TDmConexion;


       Factura : Currency;
implementation

{$R *.dfm}

//***    Inicio  ***//
procedure TViewGestion.FormCreate(Sender: TObject);
begin
    //-------- Se instancian la conexion t el modelo de datos.
    DmConnectionDB   := TDmConexion.Create(Nil);

    DmGestion        := TDmGestion_Data.Create(Nil);
    Control_Gestion  := TControl_Gestion.Create;
    DatePicker1.Date := Now();
end;
//------------------ Activacion del Formulario
procedure TViewGestion.FormActivate(Sender: TObject);
begin
   //-------- Acciones de apertura de la Vista, se posiciona en la vista principal.
   PageControl1.Pages[0].TabVisible := True;
   PageControl1.Pages[1].TabVisible := False;
   PageControl1.Pages[2].TabVisible := False;
   PageControl1.Pages[3].TabVisible := False;
   PageControl1.Pages[4].TabVisible := False;
end;
//*** Muestra la  fecha y hora delsistema.
procedure TViewGestion.Timer1Timer(Sender: TObject);
Var Hs : String;
begin
     //------------- Formate la hora actual y la  muetra en tiempo real.
     DateTimeToString(Hs, 'dddd, d ''de'' mmmm ''de'' yyyy  '' '' hh:nn:ss am/pm ''   ',Now);
     Label8.Caption :=  UpperCase(Hs);
end;
//*** Acciones de Cierre del formulario desde la x superior del formulario
procedure TViewGestion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
    Action := TCloseAction.caFree;
end;
//------- Habilita la seccion de Clientes
procedure TViewGestion.BitBtn2Click(Sender: TObject);
begin
     PageControl1.Pages[0].TabVisible := False;
     PageControl1.Pages[1].TabVisible := True;
     LimpiaClientes;
     PageControl1.Pages[2].TabVisible := False;
     PageControl1.Pages[3].TabVisible := False;
     PageControl1.Pages[4].TabVisible := False;
end;
//------- Habilita la seccion de Facturacion
procedure TViewGestion.BitBtn3Click(Sender: TObject);
begin
     PageControl1.Pages[0].TabVisible := False;
     PageControl1.Pages[1].TabVisible := False;
     PageControl1.Pages[2].TabVisible := False;
     PageControl1.Pages[3].TabVisible := True;
     LimpiaFacturacion;
     PageControl1.Pages[4].TabVisible := False;
end;
//------- Habilita la seccion de Prodcutos
procedure TViewGestion.BitBtn1Click(Sender: TObject);
begin
     PageControl1.Pages[0].TabVisible := False;
     PageControl1.Pages[1].TabVisible := False;
     PageControl1.Pages[2].TabVisible := True;
     LimpiaProductos;
     DmGestion.QryCategorias.Close;
     DmGestion.QryCategorias.Open;
     PageControl1.Pages[3].TabVisible := False;
     PageControl1.Pages[4].TabVisible := False;
end;
//------- Habilita la seccion de TRaza por cliente
procedure TViewGestion.BitBtn8Click(Sender: TObject);
begin
     PageControl1.Pages[0].TabVisible := False;
     PageControl1.Pages[1].TabVisible := False;
     PageControl1.Pages[2].TabVisible := False;
     PageControl1.Pages[3].TabVisible := False;
     PageControl1.Pages[4].TabVisible := True;
     LimpiarTraza;
end;
//------- Habilita la seccion de Prodcutos
procedure TViewGestion.LimpiaClientes;
begin
     Edit1.Enabled := True;
     Edit2.Text    := EmptyStr;
     Edit3.Text    := EmptyStr;
     Edit4.Text    := EmptyStr;
     ComboBox1.ItemIndex := -1;
     DBLookupComboBox1.KeyValue := Null;
     DBLookupComboBox2.KeyValue := Null;
     BitBtn5.Caption := 'REGISTRAR CLIENTE';
end;



//***    Clientes  ***//


// **** Limpiar el formulario de registro de clientes.
procedure TViewGestion.BitBtn6Click(Sender: TObject);
begin
    LimpiaClientes;
end;
// **** Ejecuta la consulta de los deparamentos, relacionados en la base de datos.
procedure TViewGestion.ConsultaDepartamento;
begin
    DmGestion.QryDepartamentos.Close;
    DmGestion.QryDepartamentos.Open;
end;
// **** Ejecuta la consulta de los municipios asociados a un departamento, relacionados en la base de datos.
procedure TViewGestion.ConsultaMunicipio;
begin
    If ( DBLookupComboBox1.KeyValue <> Null ) then
     Begin
        DmGestion.QryCiudades.Close;
        DmGestion.QryCiudades.Parameters[0].Value := DBLookupComboBox1.KeyValue;
        DmGestion.QryCiudades.Open;
     End;
end;
//****** Asigna lo datos del registro seleccionado en los campos de edicion de procutos.
procedure TViewGestion.DBGrid3DblClick(Sender: TObject);
begin
   Edit5.Text := DmGestion.QryConsultaProductosXCategoriaPRODUCTO.Value;
   Edit7.Text := FloatToStr(DmGestion.QryConsultaProductosXCategoriaVALOR.Value);
   Edit6.Text := DmGestion.QryConsultaProductosXCategoriaNOMBRE_PRODUCTO.Value;

   DBLookupComboBox3.KeyValue := DmGestion.QryConsultaProductosXCategoriaCATEGORIA.Value;
   BitBtn7.Caption := 'ACTUALIZAR PRODUCTO';
end;

// **** Consulta los minucipios asociados  a un departamento.
procedure TViewGestion.DBLookupComboBox1Exit(Sender: TObject);
begin
    ConsultaMunicipio;
end;

// **** Validacion de la Existencia de un cliente en la BD
procedure TViewGestion.Edit1Exit(Sender: TObject);
begin
 If (Trim(Edit1.Text) <> EmptyStr ) Then
  Begin
      Control_Gestion := TControl_Gestion.Create;
      Try
          ConsultaDepartamento;
          ConsultaMunicipio;
          If ( Control_Gestion.ValidarClienteBD(StrToCurrDef(Trim(Edit1.Text),99999)) <> EmptyStr ) Then
           Begin
              BitBtn5.Caption := 'ACTUALIZAR CLIENTE';
              Edit1.Enabled := False;

              Edit1.Text := CurrToStr(Control_Gestion.Clie_Identificacion);
              Edit2.Text := Control_Gestion.Clie_Nombre;
              Edit3.Text := CurrToStr(Control_Gestion.Clie_Telefono);
              Edit4.Text := Control_Gestion.Clie_Direccion;

              If ( Control_Gestion.Clie_Sexo = 'F' ) Then
              Begin
              ComboBox1.ItemIndex := 0;
              End Else Begin  ComboBox1.ItemIndex := 1; End;

              ConsultaDepartamento;
              DBLookupComboBox1.KeyValue := Control_Gestion.Clie_Departamento;

              ConsultaMunicipio;
              DBLookupComboBox2.KeyValue := Control_Gestion.Clie_Municipio;

              DatePicker1.Date           := Control_Gestion.Clie_FechaNacimiento;
              MessageDlg('El cliente ya esta registrado, si desea puede actualizar datos', mtInformation,[mbOk], 0, mbOk); Exit;
           End
             Else
                Begin
                    Edit1.Enabled := True; // Edit1.Text := EmptyStr;
                    LimpiaClientes;
                End;
      Finally
        Control_Gestion.Free;
      End;
  End
end;
// *** Aciones y validaciones para el registro  de un cliente.
procedure TViewGestion.BitBtn5Click(Sender: TObject);
begin
    // la validacion se realiza de acuerdo al caption que indica la activiada a relizar.
    If ( Trim(Edit1.Text) = EmptyStr ) then
     Begin
         MessageDlg('Debe ingresar la identificacion del Cliente', mtInformation,[mbOk], 0, mbOk);
         Edit1.SetFocus; Exit;
     End;
    If ( Trim(Edit2.Text) = EmptyStr ) then
     Begin
         MessageDlg('Debe ingresar el nombre  del Cliente', mtInformation,[mbOk], 0, mbOk);
         Edit1.SetFocus; Exit;
     End;
    If ( ComboBox1.ItemIndex = -1 ) then
     Begin
         MessageDlg('Debe seleccionar el sexo  del Cliente', mtInformation,[mbOk], 0, mbOk);
         ComboBox1.SetFocus; Exit;
     End;
    If ( DBLookupComboBox1.KeyValue = Null ) then
     Begin
         MessageDlg('Debe seleccionar el departamento de residencia  del Cliente', mtInformation,[mbOk], 0, mbOk);
         DBLookupComboBox1.SetFocus; Exit;
     End;
    If ( DBLookupComboBox2.KeyValue = Null ) then
     Begin
         MessageDlg('Debe seleccionar el Municipio de residencia  del Cliente', mtInformation,[mbOk], 0, mbOk);
         DBLookupComboBox2.SetFocus; Exit;
     End;
    If ( Trim(Edit3.Text) = EmptyStr ) then
     Begin
         MessageDlg('Debe ingresar el Telefono de contactoa  del Cliente', mtInformation,[mbOk], 0, mbOk);
         Edit3.SetFocus; Exit;
     End;
    If ( DatePicker1.Date > Now ) then
     Begin
         MessageDlg('La fecha de nacimiento no puede ser mayor a hoy.', mtInformation,[mbOk], 0, mbOk);
         DatePicker1.SetFocus; Exit;
     End;
    If ( Trim(Edit4.Text) = EmptyStr ) then
     Begin
         MessageDlg('Debe ingresar la direccion de residencia del Cliente', mtInformation,[mbOk], 0, mbOk);
         Edit4.SetFocus; Exit;
     End;

    Control_Gestion := TControl_Gestion.Create;
    Try
       Control_Gestion.Clie_Identificacion  := StrToCurrDef(Edit1.Text,999);
       Control_Gestion.Clie_Nombre          := UpperCase(Edit2.Text);
       Control_Gestion.Clie_Direccion       := UpperCase(Edit2.Text);
       Control_Gestion.Clie_Sexo            := Copy(ComboBox1.Text,1,1);
       Control_Gestion.Clie_Departamento    := DBLookupComboBox1.KeyValue;
       Control_Gestion.Clie_Municipio       := DBLookupComboBox2.KeyValue;
       Control_Gestion.Clie_Telefono        := StrToCurrDef(Edit3.Text,999);
       Control_Gestion.Clie_FechaNacimiento := DatePicker1.Date;
       Control_Gestion.Clie_Direccion       := UpperCase(Edit4.Text);

       If ( Control_Gestion.RegistrarClienteBD(BitBtn5.Caption) <> 'Error.' ) Then
       Begin
           MessageDlg('Operacion Exitosa.', mtInformation,[mbOk], 0, mbOk);
           LimpiaClientes; Edit1.Text := EmptyStr;
       End
         Else
            Begin
               MessageDlg('Se presentaron errores.', mtError,[mbOk], 0, mbOk);
               Exit;
            End;

    Finally
      Control_Gestion.Free;
    End;
end;




//***    Productos  ***//


//------- Limpia la seccion de Prodcutos
procedure TViewGestion.LimpiaProductos;
begin
     Edit5.Enabled := True;
     Edit6.Text := EmptyStr;
     Edit7.Text := EmptyStr;
     DBLookupComboBox3.KeyValue := Null;
     BitBtn7.Caption := 'REGISTRAR PRODUCTO';
end;
procedure TViewGestion.LimpiarTraza;
begin
     Edit11.Text := EmptyStr;
     Edit12.Text := EmptyStr;

     DmGestion.QryTrazaCliente.Close;
end;

//------- Limpia la seccion de Facturacion
procedure TViewGestion.LimpiaFacturacion;
begin
     Edit9.Text := EmptyStr;
     Edit10.Text := EmptyStr;
     Edit8.Text := EmptyStr;
     Label21.Caption := '****';
     DBLookupComboBox4.KeyValue := Null;
      DmGestion.QryDetalleFactura.Close;
end;




// *** Limpia los campos para el registro y/o actualizacion de otro prodcuto.
procedure TViewGestion.BitBtn4Click(Sender: TObject);
begin
   Edit5.Text := EmptyStr;
   LimpiaProductos;
   BitBtn7.Caption := 'REGISTRAR PRODUCTO';
end;

// *** consulta si existe un registro asociado al codigo.
procedure TViewGestion.Edit5Exit(Sender: TObject);
begin
 If (Trim(Edit5.Text) <> EmptyStr ) Then
  Begin
    Control_Gestion := TControl_Gestion.Create;
    Try
        If ( Control_Gestion.ValidarProductoBD(Trim(Edit5.Text)) <> EmptyStr ) Then
         Begin
             BitBtn7.Caption := 'ACTUALIZAR PRODUCTO';
             Edit5.Enabled   := False;
             Edit5.Text                 := Control_Gestion.Pro_Codigo;
             DBLookupComboBox3.KeyValue := Control_Gestion.Pro_Categoria;
             Edit6.Text                 := Control_Gestion.Pro_Nombre;
             Edit7.Text                 := CurrToStr(Control_Gestion.Pro_Valor);
             MessageDlg('El Producto ya esta registrado, si desea puede actualizar datos', mtInformation,[mbOk], 0, mbOk); Exit;
         End
           Else
              Begin
                  Edit1.Enabled := True; LimpiaClientes;
              End;
    Finally
      Control_Gestion.Free;
    End;
  End
end;
// **** Registro y/o Actualizacion de un producto.
procedure TViewGestion.BitBtn7Click(Sender: TObject);
begin
    // la validacion se realiza de acuerdo al caption que indica la activiada a relizar.
    If ( Trim(Edit6.Text) = EmptyStr ) then
     Begin
         MessageDlg('Debe ingresar el nombre del Producto', mtInformation,[mbOk], 0, mbOk);
         Edit6.SetFocus; Exit;
     End;
    If ( Trim(Edit7.Text) = EmptyStr ) then
     Begin
         MessageDlg('Debe ingresar el Valor  del Producto', mtInformation,[mbOk], 0, mbOk);
         Edit7.SetFocus; Exit;
     End;
    If ( DBLookupComboBox3.KeyValue = Null ) then
     Begin
         MessageDlg('Debe seleccionar la categoria del Producto', mtInformation,[mbOk], 0, mbOk);
         DBLookupComboBox3.SetFocus; Exit;
     End;

    Control_Gestion := TControl_Gestion.Create;
    Try
       Control_Gestion.Pro_Codigo     := Edit5.Text;
       Control_Gestion.Pro_Categoria  := DBLookupComboBox3.KeyValue;
       Control_Gestion.Pro_Nombre     := UpperCase(Edit6.Text);
       Control_Gestion.Pro_Valor      := StrToCurrDef(Edit7.Text,999);

       If ( Control_Gestion.RegistrarProductoBD(BitBtn7.Caption) <> 'Error.' ) Then
       Begin
           MessageDlg('Operacion Exitosa.', mtInformation,[mbOk], 0, mbOk);
           DBLookupComboBox5.KeyValue := Control_Gestion.Pro_Categoria;
           DBLookupComboBox5Exit(Sender);
           BitBtn4Click(Sender); Edit1.Text := EmptyStr;
       End
         Else
            Begin
               MessageDlg('Se presentaron errores.', mtError,[mbOk], 0, mbOk); Exit;
            End;
    Finally
      Control_Gestion.Free;
    End;
end;






//***    Facturacion  ***//






//**** Ingrese de la identificacion del clinete a facturear.
procedure TViewGestion.Edit9Exit(Sender: TObject);
begin
     If (Trim(Edit9.Text) <> EmptyStr ) Then
      Begin
        Control_Gestion := TControl_Gestion.Create;
        Try
          If ( Control_Gestion.ValidarClienteBD(StrToCurrDef(Trim(Edit9.Text),99999)) <> EmptyStr ) Then
           Begin
               Edit9.Text  := CurrToStr(Control_Gestion.Clie_Identificacion);
               Edit10.Text := Control_Gestion.Clie_Nombre;
               DBLookupComboBox4.Enabled := True;  Edit8.Enabled     := True;
               BitBtn8.Enabled           := True;  BitBtn9.Enabled   := True;

               If ( DmGestion.GenerarNumeroFactura(Control_Gestion) = True    ) Then
                Begin
                     If Control_Gestion.Tipo_Factura = 'PENDIENTE' then
                      Begin
                           If MessageDlg('El cliente seleccionado tiene un factura en proceso ' + sLineBreak +
                           'Si desea puede seguir en el proceso de facturacion de la misma ('+FormatFloat('0000',Control_Gestion.Cons_Factura)+'), o de lo contrario debera eliminar la factura para poder generar una nueva.' + sLineBreak +
                           'Desea seguir editando la factura?' ,mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
                             Begin

                                 Factura                := Control_Gestion.Cons_Factura;
                                 DateTimePicker1.Date   := Control_Gestion.Fecha_Temporal;
                                 DmGestion.ConsultaDetalle(Factura);
                             End
                               Else
                                  Begin
                                      Exit;
                                  End;
                      End
                        Else
                           Begin

                               Factura              := Control_Gestion.Cons_Factura;
                               DateTimePicker1.Date := Control_Gestion.Fecha_Temporal;
                               DmGestion.ConsultaDetalle(Factura);
                               Label21.Caption  := FormatFloat('0000',Factura);
                           End;

                     DmGestion.ProdcutosDisponibles(Factura);
                     DmGestion.ConsultaDetalle(Factura);
                End
                  Else
                      Begin
                         MessageDlg('No es posible iniciar el proceso de facturación por favor cierre e intente de nuevo, o comuníquese con el administrador del sistema ', mtInformation,[mbOk], 0, mbOk);
                         Exit;
                      End;

           End
             Else
                Begin
                    If MessageDlg('PARA PODER REALIZAR UNA FACTURA EL CLIENTE DEBE ESTAR REGISTRADO, DESEA REGISTRARLO ? '  ,mtConfirmation, [mbYes, mbNo], 0 ) = mrYes then
                     Begin
                         BitBtn2Click(Sender);
                         Edit1.Text :=  Trim(Edit9.Text);
                     End
                       Else
                          Begin
                              Exit;
                          End;
                          DBLookupComboBox4.Enabled := False; Edit8.Enabled     := False;
                          BitBtn8.Enabled           := False; BitBtn9.Enabled   := False;
                End;
        Finally
          Control_Gestion.Free;
        End;
      End
end;



//------- Aliementa los datos  con el producto seleccionado.
procedure TViewGestion.DBLookupComboBox4Exit(Sender: TObject);
begin
    Control_Gestion.Pro_Codigo   := DBLookupComboBox4.KeyValue;
    Control_Gestion.Valor_Pro    := DmGestion.QryProductosVALOR.Value;
end;
//************** Consulta los productos asociados a la categoria selccioonada, ya sea para actualziar o verificar.
procedure TViewGestion.DBLookupComboBox5Exit(Sender: TObject);
begin
    If DBLookupComboBox5.KeyValue <> Null then
     Begin
        ///*** Activa la consulta de los productos relacionados por la categoria seleccionada.
        Control_Gestion.Pro_Categoria :=     DBLookupComboBox5.KeyValue;
        DmGestion.ConsultaProxCategoria(Control_Gestion);
     End;
end;

// **** Adicion de Servicios a la factura.
procedure TViewGestion.BitBtn9Click(Sender: TObject);

begin
   If ( Edit10.Text = EmptyStr ) Then
    Begin
        MessageDlg('Para poder registrar productos debe Ingresar el cliente.', mtInformation,[mbOk], 0, mbOk); Exit;
        Edit10.SetFocus; Exit;
    End;
   If ( DBLookupComboBox4.KeyValue = EmptyStr ) Then
    Begin
        MessageDlg('Debe seleccione el producto a registrar.', mtInformation,[mbOk], 0, mbOk); Exit;
        DBLookupComboBox4.SetFocus; Exit;
    End;

   If ( Edit8.Text = EmptyStr ) Then
    Begin
        MessageDlg('Ingrese la cantidad a registrar de los productos.', mtInformation,[mbOk], 0, mbOk); Exit;
        Edit8.SetFocus; Exit;
    End;

   If ( StrToCurrDef( (Edit8.Text),9999)  = 9999 ) Then
    Begin
        MessageDlg('Solo se permite el Ingreso de numeros.', mtInformation,[mbOk], 0, mbOk); Exit;
        Edit8.SetFocus; Exit;
    End;

   If ( ( StrToCurr(Edit8.Text) <= 0 ) Or ( StrToCurr(Edit8.Text) > 9998 )  )Then
    Begin
        MessageDlg('La cantidad por producto a registrar debe estar entre 1 y 9998.', mtInformation,[mbOk], 0, mbOk); Exit;
        Edit8.SetFocus; Exit;
    End;

    Control_Gestion.Cant_Pro      := StrToCurr(Edit8.Text);
    Control_Gestion.Num_Factura   := Factura;
    Control_Gestion.Fecha_Factura := DateTimePicker1.Date;

    If  DmGestion.FacturarProducto(Control_Gestion) = True Then
     Begin
          DmGestion.ConsultaDetalle(Factura);
          DmGestion.ProdcutosDisponibles(Factura);
          Edit8.Text := EmptyStr;
          DBLookupComboBox4.SetFocus;
     End
       Else
          Begin
              MessageDlg('Error al momento de ingresar el servicio.', mtInformation,[mbOk], 0, mbOk); Exit;
          End;

    Label21.Caption  := FormatFloat('0000',Factura);
    Label22.Caption  := 'VALOR TOTAL : $'+  formatfloat('#,##0', Control_Gestion.Valor_Total );
end;




// ******** TRAZABILIDAD DE COMPRAS  ****** //


//**** Consulta el cliente y su informacion de compras.
procedure TViewGestion.Edit11Exit(Sender: TObject);
begin
    // *** Consulta la existencia del cliente y las compras realziadad (Facturas).
 If (Trim(Edit11.Text) <> EmptyStr ) Then
  Begin
      Control_Gestion := TControl_Gestion.Create;
      Try
          If ( Control_Gestion.ValidarClienteBD(StrToCurrDef(Trim(Edit11.Text),99999)) <> EmptyStr ) Then
           Begin

              Edit11.Text := CurrToStr(Control_Gestion.Clie_Identificacion);
              Edit12.Text := Control_Gestion.Clie_Nombre;

              DmGestion.QryTrazaCliente.Close;
              DmGestion.QryTrazaCliente.Parameters[0].Value := Control_Gestion.Clie_Identificacion;
              DmGestion.QryTrazaCliente.Open;

              If ( DmGestion.QryTrazaCliente.RecordCount = 0  ) Then
               Begin
                   MessageDlg('Cliente sin trazabilidad de facturacion.', mtInformation,[mbOk], 0, mbOk);
                   Exit;
               End;
           End
             Else
                Begin
                    MessageDlg('El cliente no esta registrado en la base de datos.', mtInformation,[mbOk], 0, mbOk);
                    Exit;
                End;
      Finally
        Control_Gestion.Free;
      End;
  End



end;
//****** Validacion para Apertura de la opcioon del    PopupMenu
procedure TViewGestion.PopupMenu1Popup(Sender: TObject);
begin
    DmGestion.QryTrazaCliente.Close;
    DmGestion.QryTrazaCliente.Parameters[0].Value := Control_Gestion.Clie_Identificacion;
    DmGestion.QryTrazaCliente.Open;
    { Debe existir minimo una factura para poder habilitar la opcion de eliminacion
     de lo contrario se oculta la opcion }
    If ( DmGestion.QryTrazaCliente.RecordCount = 0  ) Then
     Begin
         EliminarFactura1.Visible := False;
     End
       Else
          Begin
              EliminarFactura1.Visible := True;
          End;
end;

//**** Eliminacion de una factura.
procedure TViewGestion.EliminarFactura1Click(Sender: TObject);
begin

    If ( DmGestion.EliminarTraza( Control_Gestion.Clie_Identificacion ,
    StrToCurr(DmGestion.QryTrazaClienteNUMERO_FACTURA.Value) ) = True )  Then
      Begin
          DmGestion.QryTrazaCliente.Close;
          DmGestion.QryTrazaCliente.Parameters[0].Value := Control_Gestion.Clie_Identificacion;
          DmGestion.QryTrazaCliente.Open;

          MessageDlg('Factura eliminada con exito', mtInformation,[mbOk], 0, mbOk);
          Exit;
      End
        Else
            Begin
               MessageDlg('No fue posible eliminar la factura.', mtInformation,[mbOk], 0, mbOk);
               Exit;
            End;
end;




end.
