unit frCustRegister;
{
Om Swastuiastu, Namah Shivaya
بسم الله الرحمن الرحيم
Rahayu Sagung Dumadi
(c) 202211 Created By Jaya Lukita
Functinoal : Entry Register Kenaggotaan Koperasi
Tecno;ogi  : API

History Library ==
20221128; Create

}
interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask,Vcl.ExtCtrls,
  Data.DB, DateUtils,Vcl.ComCtrls,Vcl.Grids,System.Actions, Vcl.ActnList,

  //FireDac
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Stan.StorageBin,
  FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Stan.StorageJSON, //20200401

  //20230227
  //API RestClient MVC Daniel
  MVCFramework.RESTClient.Intf,
  MVCFramework.SystemJSONUtils,
  MVCFramework.RESTClient,
  MVCFramework.RESTClient.Commons,

  JsonDataObjects,

  //20221029 :component bawaan delphi
  REST.Client, System.JSON, REST.Types, REST.Consts,

  //Additional Class
  System.IOUtils, IdCoderMIME,


  AESObj,  //CryptBase, MiscObj,

  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg,Vcl.ExtDlgs,

  //FireDAC.Stan.StorageJSON,
  //FireDAC.Comp.BatchMove, FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.BatchMove.Text,

  //AlmDev Sc
  scControls,scCalendar, scGPControls, scExtControls, scGPPagers,
  scGPExtControls, scModernControls, scGPFontControls,
  scAdvancedControls, scStyledForm, //scDBControls, scGPDBControls,

  //Ehlib
  //MemTableDataEh, MemTableEh,

  //TMS
  AdvMetroTaskDialog,AdvEdit,AdvCombo, ColCombo,MoneyEdit, AdvMoneyEdit,
  AdvSmoothStepControl,

  Vcl.DBCtrls,


  //DevExpress
  cxGraphics, cxControls, cxLookAndFeels,
  cxStyles, cxEdit, cxDataControllerConditionalFormattingRulesManagerDialog,
  cxVGrid, cxInplaceContainer, cxDBVGrid,
  cxLookAndFeelPainters, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxCurrencyEdit, cxCalendar, cxSpinEdit,
  cxLabel,
  cxClasses, dxmdaset, cxSplitter, cxGridLevel, cxGridCustomTableView,
  cxGridTableView, cxGridBandedTableView, cxGridDBBandedTableView,
  cxGridCustomView, cxGrid, cxProgressBar, dxCore,
  cxContainer, dxWheelPicker, dxNumericWheelPicker,dxDateTimeWheelPicker,
  cxEditRepositoryItems, cxExtEditRepositoryItems,cxGridDBTableView,
  cxMaskEdit, cxCalc,

  dxSkinsCore, dxDateRanges,dxSkinsDefaultPainters, dxPSGlbl, dxPSUtl,
  dxPSEngn, dxPrnPg,dxBkgnd, dxWrap, dxPrnDev, dxPSCompsProvider,
  dxPSFillPatterns,dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils,dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer,dxPScxGridLnk, dxPScxGridLayoutViewLnk,
  dxPScxEditorProducers,dxPScxExtEditorProducers, dxPSCore, dxPScxCommon,
  cxGridExportLink,

  {last:20200401}
  cxTextEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxCheckBox,dxLayoutContainer,cxGridInplaceEditForm, cxTimeEdit, cxDateUtils,

  //Clever Internet Suite
  clHttpRequest, clTcpClient, clTcpClientTls, clHttp,

  //XLSReadWrite

  //TMS Security

  //CSV Project



  //FastReport
//  frxDesgn, frxClass, frxDBSet,frxBarcode,frxPrinter,
  scDevExStyleAdapter, AdvSplitter, AdvDateTimePicker, scDBControls,
  scGPImages

  ,CodeSiteLogging,CodeSiteJsonLogging
  ;
  

  //MemTableDataEh, MemTableEh,
type
 TitTYPES=(itJPG,itPNG,itBMP);

Type TEndPointVA = Record

  LoanH_dDrop    : String;
  LoanH_nPlafond : String;
  LoanH_nAngsuran: String;
  Status         : String;

end;

Const
  FCustomer_CIF        = 0;
  FCustomer_Nama       = 1;
  FCustomer_Telepon    = 8;

  VACustomer_No         = 0;
  VACustomer_Status     = 1;
  VACustomer_Nominal    = 2;
  VACustomer_ExpDate    = 3;
  VACustomer_Descript   = 4;
  VACustomer_CustomerID = 5;
  VACustomer_Message    = 9;

type

  TFCustRegister = class(TForm)
    PanelMaster: TscGPPanel;
    scPageCentral: TscPageViewer;
    AdvMetroTaskDialog1: TAdvMetroTaskDialog;
    scCabangLook: TscDBLookupComboBox;
    scPanel23: TscPanel;
    scLabelCharImage: TscGPCharImage;
    CaptionLabel: TscLabel;
    scButtonPayment: TscGPCharGlyphButton;
    scButtonGroup: TscGPCharGlyphButton;
    scStyledForm1: TscStyledForm;
    dsVA_CheckSaldoRelasi: TDataSource;
    OpenDialog1: TOpenDialog;
    btBRI_Statement: TscGPCharGlyphButton;
    btCreateBilling: TscGPCharGlyphButton;
    FDQ: TFDQuery;
    dsFDQLite: TDataSource;
    cxStyleRepository1: TcxStyleRepository;
    cxNotProcessed: TcxStyle;
    cxNotProcessedFocused: TcxStyle;
    cxDefault: TcxStyle;
    styleSelected: TcxStyle;
    cxCurrency: TcxStyle;
    scLabel25: TscLabel;
    scSplitView1: TscSplitView;
    scLabel23: TscLabel;
    sCVA_p1: TscGPPanel;
    sCVA_p2: TscGPPanel;
    eMemoVAInfo: TscMemo;
    scPageRegister: TscPageViewerPage;
    scPageAAA: TscPageViewerPage;
    btBRIVA_Manage: TscGPCharGlyphButton;
    scGPPanel1: TscGPPanel;
    cbKategoryRek: TcxComboBox;
    cxLabel4: TcxLabel;
    cxLabel2: TcxLabel;
    edLoadiD: TscGPEdit;
    btCheckVA: TscGPCharGlyphButton;
    GridP_Billing: TGridPanel;
    hbill_1: TscLabel;
    btBillDel: TscGPCharGlyphButton;
    scGPPanel3: TscGPPanel;
    cxLabel3: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel6: TcxLabel;
    pnProsesAp: TscGPPanel;
    btAppCreate: TscGPCharGlyphButton;
    asgProfile: TStringGrid;
    cxSplitter1: TcxSplitter;
    asgLoan: TStringGrid;
    hFotoKtp: TscGPImage;
    OpenPictureDialog1: TOpenPictureDialog;
    scGPPanel2: TscGPPanel;
    pnGambarLampiran: TscGPPanel;
    scGPCharGlyphButton1: TscGPCharGlyphButton;
    scGPCharGlyphButton2: TscGPCharGlyphButton;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure scButtonGroupClick(Sender: TObject);
    procedure btCheckVAClick(Sender: TObject);
    procedure ButtonSplitClik(Sender: TObject);

    procedure frxrLabelVAGetValue(const VarName: string; var Value: Variant);
    procedure cbKategoryRekPropertiesEditValueChanged(Sender: TObject);
    procedure edLoadiDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edLoadiDRightButtonClick(Sender: TObject);
    procedure scGPCharGlyphButton1Click(Sender: TObject);

  private
    isLoadData : Boolean;
    VACustomer : TEndPointVA;
    
    { Privat page 4 Bulk csv Payment History Update }
    //FCurrentCSVReader: TnvvCSVReader;
    FInitialDirectory: string;

    //checkBox_FieldCount_AutoDetect : boolean;

    { Private declarations }
    inProccessing: boolean;
    inSaved      : boolean;
    SaveStarRow  : Integer;

    procedure InitialProfileClear;

    procedure Customer_GetProfile;
    procedure Customer_ByDebiturID;
    procedure Customer_ByKrediturID;
    procedure Customer_ByNIK;

    
  public
    FInitialLegal_ID: string;
    FInitialVA_ID   : String;


    eCurrent_Date : TDateTime;

  //  QueryThread : TFDQueryThread;
  end;

var
  FCustRegister: TFCustRegister;
  bActiveData:boolean;


implementation

{$R *.dfm}

uses MainMenuApp, ufunc, MyGDate, dataModul2, uRestVCL,
  cr_ksp;

{Automatic column size adjustment}
procedure AutoSizeGridColumn(Grid : TStringGrid; Column : integer);
var
  i : integer;
  temp : integer;
  max : integer;
begin
  max := 0;
  for i := 0 to Grid.RowCount-1 do
  begin
    // Among the width of each row in the specified column based on Grid Canvas
    // The maximum value is determined by the width of the column
    temp := Grid.Canvas.TextWidth(Grid.Cells[Column, i]);
    if temp > max then
      max := temp;
  end;
  Grid.ColWidths[Column] := max + Grid.GridLineWidth + 20;
end;
{End of autosize Column}
//*************************************************************



procedure TFCustRegister.FormCreate(Sender: TObject);
begin

  asgProfile.RowCount := 12;

  asgProfile.Cells[0, 0] := 'CIF';
  asgProfile.Cells[0, 1] := 'Nama';
  asgProfile.Cells[0, 2] := 'Nama Pasangan';
  asgProfile.Cells[0, 3] := 'Kota';
  asgProfile.Cells[0, 4] := 'Kecamatan';
  asgProfile.Cells[0, 5] := 'Desa/kelurahan';
  asgProfile.Cells[0, 6] := 'Rt/Rw/Gang';
  asgProfile.Cells[0, 7] := 'Alamat';
  asgProfile.Cells[0, 8] := 'Telepon';
  asgProfile.Cells[0, 9] := 'Zonasi';

//application member
  asgLoan.Cells[0, 0] := 'Status Anggota';
  asgLoan.Cells[0, 1] := 'Kantor Cabang';
  asgLoan.Cells[0, 2] := 'Kode Kantor';
  asgLoan.Cells[0, 3] := 'Legal ID';
//application member

//const

  InitialProfileClear;

  scPageCentral.PageIndex := 0;

end;

procedure TFCustRegister.FormShow(Sender: TObject);
var
  dd,mm,yy,myHour, myMin, mySec, myMilli : word;
  bDataOk : boolean;
  DateTimeExp : TDateTime;
begin

  bDataOk := False;

  Begin


    scPageCentral.PageIndex := 0;

    //if bActiveData then


    //system date database
    eCurrent_Date := Now();

    //payment history
    DecodeDateTime( Now() , yy,mm,dd,myHour, myMin, mySec, myMilli );
    //dBeginPayHist.Date := EncodeDateTime( yy,mm,dd, 0, 0, 0, myMilli );

    DecodeDateTime( Now() , yy,mm,dd,myHour, myMin, mySec, myMilli );
    //dEndPayHist.Date   := EncodeDateTime( yy,mm,dd,myHour, myMin, mySec, myMilli );

    //billing data
    DateTimeExp := eCurrent_Date;

    DecodeDateTime( DateTimeExp , yy,mm,dd,myHour, myMin, mySec, myMilli );

    scPageCentral.PageIndex  := scButtonPayment.Tag;

    scCabangLook.KeyValue := MainApp.ICSSession.Office_id;


  end;
end;



procedure TFCustRegister.frxrLabelVAGetValue(const VarName: string;
  var Value: Variant);
var
  y1,m1,d1,y2,m2,d2 : word;
  toTanggal : TDate;
begin

  if CompareText(VarName, 'Legalitas') = 0 then
     Value := UpperCase( MainApp.msLegalCompany );

  if CompareText(VarName, 'Username') = 0 then
     Value := MainApp.msCurrentUser;

end;

procedure TFCustRegister.btCheckVAClick(Sender: TObject);

begin

  InitialProfileClear;

  Customer_GetProfile;

end;


procedure TFCustRegister.Customer_GetProfile;
begin
  CodeSite.Send('prompt:'+cbKategoryRek.Text);

  if cbKategoryRek.Text = 'PINJAMAN' then
  Customer_ByDebiturID;

  if cbKategoryRek.Text = 'KTP' then
  Customer_ByDebiturID;


end;


procedure TFCustRegister.edLoadiDKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then begin

    InitialProfileClear;

    Customer_GetProfile;
  end;
end;

procedure TFCustRegister.edLoadiDRightButtonClick(Sender: TObject);
begin
  InitialProfileClear;
end;

procedure TFCustRegister.InitialProfileClear;
var
  yy,mm,dd : word;

begin

//  VACustomer.taNama      := '';
//  VACustomer.taPartner   := '';
//  VACustomer.taKota      := '';
//  VACustomer.taKec       := '';
//  VACustomer.taDesa      := '';
//  VACustomer.taScope     := '';
//  VACustomer.taAlamat    := '';
//
//  VACustomer.dva_No      := '';
//  VACustomer.dva_Status  := '';
//  VACustomer.dva_Nominal := '';
//  VACustomer.dva_ExpDate := '';
//  VACustomer.dva_Descript:= '';
//  VACustomer.dva_CustomerID :='';

  VACustomer.LoanH_dDrop    := '';
  VACustomer.LoanH_nPlafond := '';
  VACustomer.LoanH_nAngsuran:= '';

  asgProfile.Cells[1, 0] := '';
  asgProfile.Cells[1, 1] := '';
  asgProfile.Cells[1, 2] := '';
  asgProfile.Cells[1, 3] := '';
  asgProfile.Cells[1, 4] := '';
  asgProfile.Cells[1, 5] := '';
  asgProfile.Cells[1, 6] := '';
  asgProfile.Cells[1, 7] := '';
  asgProfile.Cells[1, 8] := '';

  asgLoan.Cells[1, 0] := '';
  asgLoan.Cells[1, 1] := '';
  asgLoan.Cells[1, 2] := '';
  asgLoan.Cells[1, 3] := '';

  DecodeDate(Now(),yy,mm,dd);
  dd := DaysInMonth( Now() );

//  hbill_ExpDateTime. DateTime := EncodeDateTime( yy,mm,dd, 23, 59, 00, 00 ); //'23:59:00';
//  hbill_Descript.Text    := '';
//  hbill_nominal.Value    := 0;

  //hbill_No.Caption       := '';
  //hbill_Status.Caption   := '';

  btAppCreate.Enabled := False;
  btBillDel.Enabled  := False;

  isLoadData := False;

end;



procedure TFCustRegister.ButtonSplitClik(Sender: TObject);
var
  I,P: Integer;

  lOriginalCursor: TCursor;
begin

  lOriginalCursor := Screen.Cursor;

  P  := TControl(Sender).Tag;

  CaptionLabel.Caption := TscGPCharGlyphButton(Sender).Caption;

  scLabelCharImage.ImageIndex := TscGPCharGlyphButton(Sender).GlyphOptions.Index;

  scPageCentral.PageIndex  := P;

end;

procedure TFCustRegister.cbKategoryRekPropertiesEditValueChanged(
  Sender: TObject);
begin
  edLoadiD.PromptText := Proper( cbKategoryRek.Text );
end;

procedure TFCustRegister.Customer_ByDebiturID;
var
  Response: IMVCRESTResponse;


  //Standar Delphi
  paramJSON : System.JSON.TJSONObject;

  //Standar MVC Daniel
  body : JsonDataObjects.TJSONObject;           //used :,JsonDataObjects


  oRaw, oJson, oData  : System.JSON.TJSONObject;

  oArr : TJsonArray;
  sArr  : string;
  i,n : Integer;
  xStatus, zonasi, status_Reg : String;
  pernyaataan : boolean;

begin

  //Standar Delphi
//  paramJSON := System.JSON.TJSONObject.Create;
//  paramJSON.AddPair(TJSONPair.Create('LoginName', MainApp.ICSSession.LoginName ));
//  paramJSON.AddPair(TJSONPair.Create('Office_ID', MainApp.ICSSession.Office_id ));

  //Standar MVC Daniel
  body := JsonDataObjects.TJsonObject.Create;
  body.S['LoginName'] := MainApp.ICSSession.LoginName;
  body.S['Office_ID'] := MainApp.ICSSession.Office_id;

  paramJSON := System.JSON.TJSONObject.parseJsonValue(body.toString) as  TJsonObject;


  //sample  body code :
//{
// "LoginName": "R2XDnBSDuEprdPgdoGuP5v4vI6dFj6/AZuHX7jyDpx0=",
// "Office_ID": "056"
//}


  CodeSite.Send('>G-1');


  Response :=
  ICSMVCAppRequest( MainApp.ICSSession , 'POST' , '/ics/AF2360E45F/'+edLoadiD.Text , paramJSON );   //

  //Dengan DataBase icsgo tersimpan
  {
  paramJSON.AddPair(TJSONPair.Create('NO_PINJAMAN',  edLoadiD.Text ));
  ICSMVCRESTRequest(
                MainApp.ICSSession , 'ICS_PROFILELOAN_NP', paramJSON  );

  }

  if Response.StatusCode = 200 then begin

      CodeSite.Send('>G-2');

      oJSON := TJSONObject.ParseJSONValue( Response.Content ) as TJSONObject;

      CodeSite.Send('>G-3');

      if oJson.GetValue<string>('responseCode') = '00' then begin

          CodeSite.Send('>G-3.1');

          CodeSite.Send('>G-3.1/'+Response.Content);

          CodeSite.Send('>G-4');
          //deteksi zona masuk apa tidak!-----------


          Zonasi := 'REGION';
          if Assigned(oJson.Get( 'info' ) ) then begin

            oRaw := oJson.Get('info').jsonValue as TJSONObject;

              if Assigned(oRaw.Get('region')) then
              begin
                  //CodeSite.Send('>G-4.2/'+oRaw.GetValue<string>('region'));
                  btAppCreate.Enabled := oRaw.GetValue<string>('region')='TRUE';  //FALSE= tidak terdaftar!
                  Zonasi := oRaw.GetValue<string>('zona');
              end else begin
                  asgLoan.Cells[1, 0] := 'Kode Cabang Anda Salah!';
                  btAppCreate.Enabled := False;
                  exit;
              end;

            CodeSite.Send('>G-4.1');

            CodeSite.Send('>G-4.2/'+ oRaw.toString );

            CodeSite.Send('>G-4.2');

            CodeSite.Send('>G-4.3');
          end;

          oArr := oJson.Get('5eM3s74').jsonValue as TJSONArray;

          CodeSite.Send('>G-3.2');

          //penanganan info anggota----------------------------
          //sArr := TMSAES( sArr , MainApp.ICSSession.Dupa ,0 , atOFB );
          //oArr :=  TjsonObject.ParseJsonValue('5eM3s74') as TJSONArray;

          CodeSite.Send('>G-3.3');

          // get the array
          // get pharsig 5eM3s74----------------------------------------------*************************************
          if oArr.Size > 0 then
          begin

            //--------------------------------------------------------------
            //Update Profile!
  //          for i := oArr.Size-1 Downto 0 do
  //          begin

              oRaw := oArr.Items[0] as TJSONObject;

  //            VACustomer.taCIF       := oRaw.GetValue<string>('enduser_no');
  //            VACustomer.taNama      := oRaw.GetValue<string>('full_name');

              asgProfile.Cells[1, FCustomer_CIF] := oRaw.GetValue<string>('enduser_no');
              asgProfile.Cells[1, FCustomer_Nama] := oRaw.GetValue<string>('full_name');
              asgProfile.Cells[1, 2] := oRaw.GetValue<string>('pasangan_nama');
              asgProfile.Cells[1, 3] := oRaw.GetValue<string>('region');
              asgProfile.Cells[1, 4] := oRaw.GetValue<string>('sector');
              asgProfile.Cells[1, 5] := oRaw.GetValue<string>('village');
              asgProfile.Cells[1, 6] := oRaw.GetValue<string>('scope_village');
              asgProfile.Cells[1, 7] := oRaw.GetValue<string>('address_line1');
              asgProfile.Cells[1, FCustomer_Telepon] := '';

              {StringGrid1 Auto-Size Cell}
              for i := 0 to asgProfile.ColCount-1 do
              begin
                AutoSizeGridColumn(asgProfile, i);
              end;

          end;

          CodeSite.Send('amri ---- 1');
          //Check Register Anggota [ada/tidak]

          status_Reg := 'BELUM TERDAFTAR';

          if Assigned(oJson.Get( 'CustomerRStat' ) ) then
          begin
            oArr := oJson.Get('CustomerRStat').jsonValue as TJSONArray;
            if oArr.size > 0 then
            CodeSite.Send('amri ---- 2');
            begin
              oRaw := oArr.Items[0] as TJSONObject;
              status_Reg := oArr.GetValue<string>('status_Reg');
              CodeSite.Send('amri ---- 3' +status_Reg);
              if status_Reg = 'REGISTERD' then
              begin

                  CodeSite.Send('amri ---- 4' +oRaw.GetValue<string>('status_reg'));

                  asgLoan.Cells[1, 0] := oRaw.GetValue<string>('status_reg');

              end;
              if status_Reg = 'ACTIVE' then
              begin
                  CodeSite.Send('amri ---- 5' );
                  asgLoan.Cells[1, 0] := 'Masih dalam daftar Tunggu!';
              end;
              if status_Reg = 'EXPIRED' then
              begin
                  CodeSite.Send('amri ---- 6' );
                  asgLoan.Cells[1, 0] := 'Daftarkan Kembali!';
              end;
            end;

          end else begin
              asgLoan.Cells[1, 0] := 'Belum Terdaftar';
          end;


          asgLoan.Cells[0, 1] := 'Zonasi ';
          asgLoan.Cells[0, 2] := 'Area Layanan';

          asgLoan.Cells[1, 1] := Zonasi;
          asgLoan.Cells[1, 2] := iif(btAppCreate.Enabled,'MASUK','Anggota Luar biasa');
          asgLoan.Cells[1, 3] := oRaw.GetValue<string>('id_legal');


          if Assigned(oJson.Get( 'loan' ) ) then begin

              //retrive dari JSON ARRAY
              oArr := oJson.Get('loan').jsonValue as TJSONArray;
              if oArr.Size > 0 then
              begin

                //"zona": "PROVINCE",   //33
                //"region": "TRUE",     //330
                // posisi zona masuk maka bisa post proses pemasukan
                oRaw := oArr.Items[0] as TJSONObject;

                  if btAppCreate.Enabled then begin

                      if Zonasi='PROVINCE' then begin


                      end;

                      if Zonasi='REGIOAN' then begin


                      end;

      //                0: regional
      //                1: provinsi = masuk cabang pemohon = anggota!
      //                2: nasional = 1 negara
      //                3. asia
      //                4. Global

                  end;
              end;

          end ELSE begin
              //  2: diluar zinasi = "anggota luar biasa"
          end;

//                pernyataaan alternatif, jika
//                1: provinsi = masuk tapi diluar cabang pemohon = anggota!
//
//                2: diluar zinasi = "anggota luar biasa"


          for i := 0 to asgLoan.ColCount-1 do
          begin
              AutoSizeGridColumn(asgLoan, i);
          end;


      end;
  end;

  CodeSite.Send('>G-e');
end;

procedure TFCustRegister.Customer_ByKrediturID;
begin

end;

procedure TFCustRegister.Customer_ByNIK;
var
  Response: IMVCRESTResponse;
  oRaw, oJson, oData, paramJSON : System.JSON.TJSONObject;
  oArr : TJsonArray;
  sArr  : string;
  i,n : Integer;
  xStatus : String;
begin

  paramJSON := System.JSON.TJSONObject.Create;
  paramJSON.AddPair(TJSONPair.Create('LoginName',  MainApp.ICSSession.LoginName ));
  paramJSON.AddPair(TJSONPair.Create('Office_ID',  MainApp.ICSSession.Office_id ));

  CodeSite.Send('>G-1');


  Response :=
  ICSMVCAppRequest( MainApp.ICSSession , 'POST', '/ics/AF2360E45F/'+ edLoadiD.Text ,  paramJSON );
  //ICSMVCRESTRequest( MainApp.ICSSession , 'ICS_PROFILELOAN_NP', paramJSON  );

  CodeSite.Send('>G-2');

  oJSON := TJSONObject.ParseJSONValue( Response.Content ) as TJSONObject;

  CodeSite.Send('>G-3');


  //https://github.com/ezequieljuliano/DataSetConverter4Delphi

  if oJson.GetValue<string>('responseCode') = '00' then begin

        CodeSite.Send('>G-3.1');

        sArr := oJson.GetValue<string>('3W9andan6a');

        CodeSite.Send('>G-3.2');

        sArr := TMSAES( sArr , MainApp.ICSSession.Dupa ,0 , atOFB );

        CodeSite.Send('>G-3.3');

        // get the array
        oArr := TjsonObject.ParseJsonValue(sArr) as TJSONArray;
        if oArr.Size > 0 then
        begin

          //--------------------------------------------------------------
          //Update Profile!
//          for i := oArr.Size-1 Downto 0 do
//          begin

            oRaw := oArr.Items[0] as TJSONObject;

//            VACustomer.taCIF       := oRaw.GetValue<string>('cif');
//            VACustomer.taNama      := oRaw.GetValue<string>('full_name');

            asgProfile.Cells[1, FCustomer_CIF] := oRaw.GetValue<string>('cif');
            asgProfile.Cells[1, FCustomer_Nama] := oRaw.GetValue<string>('full_name');
            asgProfile.Cells[1, 2] := oRaw.GetValue<string>('pasangan_name');
            asgProfile.Cells[1, 3] := oRaw.GetValue<string>('region');
            asgProfile.Cells[1, 4] := oRaw.GetValue<string>('sector');
            asgProfile.Cells[1, 5] := oRaw.GetValue<string>('village');
            asgProfile.Cells[1, 6] := oRaw.GetValue<string>('scope_village');
            asgProfile.Cells[1, 7] := oRaw.GetValue<string>('address_line1');
            asgProfile.Cells[1, FCustomer_Telepon] := '';


            //asgProfile.Row := 1;

            {
            taCIF.Caption  := oRaw.GetValue<string>('cif');
            taNama.Caption := oRaw.GetValue<string>('full_name');
            taPartner.Caption :=   oRaw.GetValue<string>('pasangan_name');
            taKota.Caption :=   oRaw.GetValue<string>('region');
            taKec.Caption :=   oRaw.GetValue<string>('sector');
            taDesa.Caption :=   oRaw.GetValue<string>('village');
            taScope.Caption :=   oRaw.GetValue<string>('scope_village');
            taAlamat.Caption :=   oRaw.GetValue<string>('address_line1');
            }

          //end;

          {StringGrid1 Auto-Size Cell}
          for i := 0 to asgProfile.ColCount-1 do
          begin
            AutoSizeGridColumn(asgProfile, i);
          end;

        end;

        if Assigned(oJson.Get( '3W9anda6na' ) ) then begin

          sArr := oJson.GetValue<string>('3W9anda6na');
          if Not IsEmptyOrNull( sArr ) then begin
            sArr := TMSAES( sArr , MainApp.ICSSession.Dupa ,0 , atOFB );
            oArr := TjsonObject.ParseJsonValue(sArr) as TJSONArray;

            if oArr.Size > 0 then
            begin

              for n := 0 to oArr.Size-1 do
              begin

                if n >1 then Break;

                oRaw := oArr.Items[n] as TJSONObject;

                if n=0 then begin

//                  LoanH_dDrop.Caption     :=
//                    System.SysUtils.FormatDateTime( 'dd/mm/yyyy', fnStrToDate( oRaw.GetValue<string>('relese_date')));
//
//                  LoanH_nPlafond.Caption  := FormatCurr(',0;-,0' ,StrToCurr( oRaw.GetValue<string>('plafond')));
//                  LoanH_nAngsuran.Caption := FormatCurr(',0;-,0' ,StrToCurr( oRaw.GetValue<string>('billing')));
//
//                  hbill_nominal.Text      := oRaw.GetValue<string>('billing');
//
//                  hbill_Descript.Text     := 'Angs. '+edLoadiD.Text;

                end else begin
                end;
              end;
            end;
          end;
        end;
  end;
end;


procedure TFCustRegister.scButtonGroupClick(Sender: TObject);
begin

  //scSplitViewKanan.Opened := Not scSplitViewKanan.Opened ;
  //BorderPanel.SetRedraw(False);
  scSplitView1.Opened := not scSplitView1.Opened;

  if scButtonGroup.Tag = 1 then
  begin
    //scPanel32.Width := scStyledForm1.ScaleInt(45);
    scButtonGroup.Tag := 0;
    scButtonGroup.GlyphOptions.Index := 83;
  end
  else
  begin
    //scPanel32.Width := scStyledForm1.ScaleInt(220);
    scButtonGroup.Tag := 1;
    scButtonGroup.GlyphOptions.Index := 84;
  end;
  //BorderPanel.SetRedraw(True);
  
end;

procedure TFCustRegister.scGPCharGlyphButton1Click(Sender: TObject);
Var

  FileFoto : TFileName;
  FileExt : String;

  g:TGraphic;
  FileStream : TFileStream;

begin

  CodeSite.send('C');

  if OpenPictureDialog1.Execute then begin

    FileFoto := OpenPictureDialog1.FileName;
    if TFile.Exists( FileFoto )=True then begin
      try

        FileStream := TFileStream.Create( FileFoto,fmOpenRead OR fmShareDenyWrite);
        FileStream.Position := 0;

        FileExt := LowerCase( ExtractFileExt( FileFoto ) );

        CodeSite.send('1/1/exten/'+FileExt);

        if FileExt = '.jpg' then
                  g:=TJpegimage.Create;

        if FileExt =  '.png' then
                  g:=TPNGImage.Create;

        g.LoadFromStream(FileStream);
        hFotoKTP.Picture.Graphic := g;

      finally

        CodeSite.send('6/Start destroy mem'  );

        g.Free;

      end;
    end;
  end;
end;

end.

