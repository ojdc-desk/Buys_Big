unit FrmGestion;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Data.Win.ADODB, Vcl.StdCtrls,
  Vcl.Buttons, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.DBCtrls, Vcl.WinXPickers , Control_Gestion,
  Vcl.Grids, Vcl.DBGrids;

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
    BitBtn8: TBitBtn;
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
    procedure DBLookupComboBox1Exit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

   var ViewGestion     : TViewGestion;
       Control_Gestion : TControl_Gestion;
implementation

{$R *.dfm}

uses DmGestion; // Control_Gestion;

procedure TViewGestion.FormActivate(Sender: TObject);
begin
   //-------- Acciones de apertura de la Vista
   PageControl1.Pages[0].TabVisible := True;
   PageControl1.Pages[1].TabVisible := False;
   PageControl1.Pages[2].TabVisible := False;
   PageControl1.Pages[3].TabVisible := False;
   //-------  Actualiza la Hora en todo momento
end;

//*** Muestra la  fecha y hora delsistema.
procedure TViewGestion.Timer1Timer(Sender: TObject);
Var Hs : String;
begin
     DateTimeToString(Hs, 'dddd, d ''de'' mmmm ''de'' yyyy  '' '' hh:nn:ss am/pm ''   ',Now);
     Label8.Caption :=  UpperCase(Hs);
end;

procedure TViewGestion.FormClose(Sender: TObject; var Action: TCloseAction);
begin  //  Acciones de Cierre del formulario desde la x superior del formulario
   Action := TCloseAction.caFree;
end;

procedure TViewGestion.BitBtn2Click(Sender: TObject);
begin  // Habilita la seccion de Clientes
   PageControl1.Pages[0].TabVisible := False;
   PageControl1.Pages[1].TabVisible := True;
   PageControl1.Pages[2].TabVisible := False;
   PageControl1.Pages[3].TabVisible := False;
end;
procedure TViewGestion.BitBtn3Click(Sender: TObject);
begin // Habilita la seccion de Facturacion
   PageControl1.Pages[0].TabVisible := False;
   PageControl1.Pages[1].TabVisible := False;
   PageControl1.Pages[2].TabVisible := False;
   PageControl1.Pages[3].TabVisible := True;
end;
procedure TViewGestion.BitBtn1Click(Sender: TObject);
begin  // Habilita la seccion de Prodcutos
   PageControl1.Pages[0].TabVisible := False;
   PageControl1.Pages[1].TabVisible := False;
   PageControl1.Pages[2].TabVisible := True;
   PageControl1.Pages[3].TabVisible := False;
end;
procedure TViewGestion.LimpiaClientes;
begin  // Habilita la seccion de Prodcutos
   Edit1.Enabled := True;
   Edit2.Text    := EmptyStr;
   Edit3.Text    := EmptyStr;
   Edit4.Text    := EmptyStr;
   ComboBox1.ItemIndex := -1;
   DBLookupComboBox1.KeyValue := Null;
   DBLookupComboBox2.KeyValue := Null;
   BitBtn5.Caption := 'REGISTRAR CLIENTE';
end;
procedure TViewGestion.LimpiaProductos;
begin  // Habilita la seccion de Prodcutos
   Edit5.Enabled := True;
   Edit6.Text := EmptyStr;
   Edit7.Text := EmptyStr;
   DBLookupComboBox3.KeyValue := Null;
   BitBtn7.Caption := 'REGISTRAR PRODUCTO';
end;


// **** Adicion de la consulta que lista losdepartamentos de la tabladereferencia.
procedure TViewGestion.ConsultaDepartamento;
begin
    DmGestion_Data.QryDepartamentos.Close;
    DmGestion_Data.QryDepartamentos.Open;
end;
// *** Consulta los minucipios asociados  a un departamento.
procedure TViewGestion.ConsultaMunicipio;
begin
   If DBLookupComboBox1.KeyValue <> Null Then
    Begin
       DmGestion_Data.QryCiudades.Close;
       DmGestion_Data.QryCiudades.Parameters[0].Value :=  DBLookupComboBox1.KeyValue;
       DmGestion_Data.QryCiudades.Open;
    End;
end;

procedure TViewGestion.DBLookupComboBox1Exit(Sender: TObject);
begin
    ConsultaMunicipio;
end;

// Limpiar el formulario de registro de clientes.
procedure TViewGestion.BitBtn6Click(Sender: TObject);
begin
   LimpiaClientes;
end;

// ***** Validacion de la Existencia de un cliente en la BD
procedure TViewGestion.Edit1Exit(Sender: TObject);
begin
 If (Trim(Edit1.Text) <> EmptyStr ) Then
  Begin
    Control_Gestion := TControl_Gestion.Create;
    Try
        ConsultaDepartamento;

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

              DBLookupComboBox1.KeyValue := Control_Gestion.Clie_Departamento;

              ConsultaMunicipio;

              DBLookupComboBox2.KeyValue := Control_Gestion.Clie_Departamento + Control_Gestion.Clie_Municipio;

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
       Control_Gestion.Clie_Municipio       := Copy(DBLookupComboBox2.KeyValue,3,6);
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
// *** Busqueda de un producto.
procedure TViewGestion.BitBtn4Click(Sender: TObject);
begin
     Edit5.Enabled := True;
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
           LimpiaClientes; Edit1.Text := EmptyStr;
       End
         Else
            Begin
               MessageDlg('Se presentaron errores.', mtError,[mbOk], 0, mbOk); Exit;
            End;
    Finally
      Control_Gestion.Free;
    End;
end;

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

           DBLookupComboBox4.Enabled := True;  Edit8.Enabled             := True;
           BitBtn8.Enabled           := True;  BitBtn9.Enabled           := True;

       End
         Else
            Begin
                DBLookupComboBox4.Enabled := False; Edit8.Enabled             := False;
                BitBtn8.Enabled           := False; BitBtn9.Enabled           := False;
                MessageDlg('la identificacion ingresada no esta registrada. Verifique e intente de nuevo', mtInformation,[mbOk], 0, mbOk); Exit;
                Exit;
            End;
    Finally
      Control_Gestion.Free;
    End;
  End

end;
// **** Adicion de Servicios a la factura.
procedure TViewGestion.BitBtn9Click(Sender: TObject);
 Var Itemns         :   Currency;
     ValorFactura   :   Currency;
begin
   If ( Edit10.Text = EmptyStr ) then
    Begin
        MessageDlg('Para poder ingresar productos debe Ingresar el cliente.', mtInformation,[mbOk], 0, mbOk); Exit;
        Edit10.SetFocus;
    End;
   If ( Edit8.Text = EmptyStr ) then
    Begin
        MessageDlg('Ingrese la cantidad a registrar de los productos.', mtInformation,[mbOk], 0, mbOk); Exit;
        Edit10.SetFocus;
    End;
   If ( DBLookupComboBox4.KeyValue = EmptyStr ) then
    Begin
        MessageDlg('Seleccione el producto a registrar.', mtInformation,[mbOk], 0, mbOk); Exit;
        DBLookupComboBox4.SetFocus;
    End;
   Itemns := DBGrid1.DataSource.DataSet.RecordCount;
   If MessageDlg('Desea Iniciar el proceso de facturacion.?', mtConfirmation, [mbYes, mbNo], 0, mbYes) = mrYes  then
    Begin
        MessageDlg('Saliendo del sistema.', mtInformation, [mbOk], 0, mbOk); Close;

    End;
end;








end.
