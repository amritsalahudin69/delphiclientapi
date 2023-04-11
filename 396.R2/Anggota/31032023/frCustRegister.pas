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
  MVCFramework.Serializer.Commons,
  JsonDataObjects,

  //20221029 :component bawaan delphi
  REST.Client, System.JSON, REST.Types, REST.Consts
  ,DataSet.Serialize    //fireDacJsonMemtabl

  ,Soap.EncdDecd,
  //20230315 DelphiXE103 ---
  System.Net.URLClient,
  //System.NetEncoding,
  System.Net.HttpClient, System.Net.HttpClientComponent,

  AESObj,  //CryptBase, MiscObj,

  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg,

  //Additional Class
  System.Threading, System.IOUtils, IdCoderMIME,

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
  scDevExStyleAdapter, AdvSplitter, AdvDateTimePicker, scDBControls
  ,scGPImages, Vcl.ExtDlgs,

  iexActions, Vcl.StdActns, hyiedefs, hyieutils, iexBitmaps, iesettings,
  iexLayers, iexRulers, iexToolbars, iexUserInteractions, imageenio,
  imageenproc, ieview, imageenview
  ,ImagMainFrm

  ,CodeSiteLogging,CodeSiteJsonLogging

  ,uRestVCL, frxClass, frxDBSet

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
    scPageRegister: TscPageViewerPage;
    scPageDaftar: TscPageViewerPage;
    btBRIVA_Manage: TscGPCharGlyphButton;
    scGPPanel1: TscGPPanel;
    cbKategoryRek: TcxComboBox;
    cxLabel4: TcxLabel;
    cxLabel2: TcxLabel;
    edLoadiD: TscGPEdit;
    btCheckVA: TscGPCharGlyphButton;
    GridP_Billing: TGridPanel;
    hm_NIC: TscLabel;
    btBillDel: TscGPCharGlyphButton;
    scGPPanel3: TscGPPanel;
    cxLabel3: TcxLabel;
    cxLabel1: TcxLabel;
    cxLabel6: TcxLabel;
    pnSendPost: TscGPPanel;
    btAppCreate: TscGPCharGlyphButton;
    asgProfile: TStringGrid;
    cxSplitter1: TcxSplitter;
    asgLoan: TStringGrid;
    OpenPictureDialog1: TOpenPictureDialog;
    pnLampiran: TscGPPanel;
    scGPPanel5: TscGPPanel;
    btDelFoto: TscGPCharGlyphButton;
    btAddFoto: TscGPCharGlyphButton;
    btFromImageEn: TscGPCharGlyphButton;
    ImageEnView1: TImageEnView;
    ActionList1: TActionList;
    ZoomIn: TImageEnViewZoomIn;
    ZoomOut: TImageEnViewZoomOut;
    AutoShrink: TImageEnViewAutoShrink;
    AutoStretch: TImageEnViewAutoStretch;
    Blank: TImageEnViewBlank;
    DeSelect: TImageEnViewDeselect;
    Fit: TImageEnViewFit;
    FitToHeight: TImageEnViewFitToHeight;
    FitToWidth: TImageEnViewFitToWidth;
    ZoomFullSize: TImageEnViewZoomFullSize;
    MouseMovingScroll: TImageEnViewMouseMovingScroll;
    MouseSelect: TImageEnViewMouseSelect;
    MouseSelectCircle: TImageEnViewMouseSelectCircle;
    MouseSelectLasso: TImageEnViewMouseSelectLasso;
    MouseSelectMagicWand: TImageEnViewMouseSelectMagicWand;
    MouseSelectPolygon: TImageEnViewMouseSelectPolygon;
    MouseSelectZoom: TImageEnViewMouseSelectZoom;
    SetZoom50: TImageEnViewSetZoom;
    ConvertToGray: TImageEnViewConvertToGray;
    CopyToClipboard: TImageEnViewCopyToClipboard;
    SetZoom25: TImageEnViewSetZoom;
    FlipHorizontal: TImageEnViewFlipHorizontal;
    FlipVertical: TImageEnViewFlipVertical;
    HistAutoEqualize: TImageEnViewHistAutoEqualize;
    Negative: TImageEnViewNegative;
    PasteFromClipboard: TImageEnViewPasteFromClipboard;
    Redo: TImageEnViewRedo;
    RemoveRedEyes: TImageEnViewRemoveRedEyes;
    Rotate180: TImageEnViewRotate180;
    Sharpen: TImageEnViewSharpen;
    Undo: TImageEnViewUndo;
    Crop: TImageEnViewCrop;
    Acquire: TImageEnViewAcquire;
    DoIOPreviews: TImageEnViewDoIOPreviews;
    DoPrintPreviewDialog: TImageEnViewDoPrintPreviewDialog;
    PrintImageFitToPage: TImageEnViewPrintImageFitToPage;
    PrintImageNormal: TImageEnViewPrintImageNormal;
    Save: TImageEnViewSave;
    PromptToOpen: TImageEnViewPromptToOpen;
    PromptToSave: TImageEnViewPromptToSave;
    SeekFirst: TImageEnViewSeekFirst;
    SeekLast: TImageEnViewSeekLast;
    SeekNext: TImageEnViewSeekNext;
    SeekPrior: TImageEnViewSeekPrior;
    SelectAcquireSource: TImageEnViewSelectAcquireSource;
    DoAdjustPreviews: TImageEnViewDoAdjustPreviews;
    DoEffectPreviews: TImageEnViewDoEffectPreviews;
    DoEditPreviews: TImageEnViewDoEditPreviews;
    Playing: TImageEnViewPlaying;
    PlayLoop: TImageEnViewPlayLoop;
    RotateLeft: TImageEnViewRotateLeft;
    RotateRight: TImageEnViewRotateRight;
    EnableAdjustOrientation: TImageEnViewEnableAdjustOrientation;
    ExitApp: TFileExit;
    SetZoom200: TImageEnViewSetZoom;
    SetZoom75: TImageEnViewSetZoom;
    SetZoom150: TImageEnViewSetZoom;
    PromptToResize: TImageEnViewPromptToResize;
    PromptToRotate: TImageEnViewPromptToRotate;
    ShowRulers: TImageEnViewShowRulers;
    RulerUnitPixels: TImageEnViewRulerUnitPixels;
    RulerUnitInches: TImageEnViewRulerUnitInches;
    RulerUnitMillimeters: TImageEnViewRulerUnitMillimeters;
    RulerUnitCentimeters: TImageEnViewRulerUnitCentimeters;
    CropToolEnable: TImageEnViewCropToolEnable;
    CropToolEnactCrop: TImageEnViewCropToolEnactCrop;
    CropToolCancelCrop: TImageEnViewCropToolCancelCrop;
    CloneTool: TImageEnViewCloneTool;
    BrushTool: TImageEnViewBrushTool;
    SprayTool: TImageEnViewSprayTool;
    RotateTool: TImageEnViewRotateTool;
    RotateAndCropTool: TImageEnViewRotateAndCropTool;
    ShowGuidelines: TImageEnViewShowGuidelines;
    CutToClipboard: TImageEnViewCutToClipboard;
    EraserTool: TImageEnViewEraserTool;
    MouseMeasureLength: TImageEnViewMouseMeasureLength;
    MouseMeasureRect: TImageEnViewMouseMeasureRect;
    MouseMeasureEllipse: TImageEnViewMouseMeasureEllipse;
    MouseMeasureAngle: TImageEnViewMouseMeasureAngle;
    MouseZoomAndScroll: TImageEnViewMouseZoomAndScroll;
    ColorFillTool: TImageEnViewColorFillTool;
    AlphaFillTool: TImageEnViewAlphaFillTool;
    MouseColorPicker: TImageEnViewMouseColorPicker;
    PromptForColor: TImageEnViewPromptForColor;
    RemoveChromaKey: TImageEnViewRemoveChromaKey;
    InvertSelection: TImageEnViewInvertSelection;
    AutoSharpen: TImageEnViewAutoSharp;
    AutoImageEnhance: TImageEnViewAutoImageEnhance;
    BackgroundEraserTool: TImageEnViewBackgroundEraserTool;
    SmudgeTool: TImageEnViewSmudgeTool;
    BlurTool: TImageEnViewBlurTool;
    MotionBlurTool: TImageEnViewMotionBlurTool;
    SmoothTool: TImageEnViewSmoothTool;
    PixelizeTool: TImageEnViewPixelizeTool;
    BrightnessTool: TImageEnViewBrightnessTool;
    BrushShowProperties: TImageEnViewBrushShowProperties;
    Pixelize: TImageEnViewPixelize;
    MouseAdjustBlackWhite: TImageEnViewMouseAdjustBlackWhite;
    MouseMeasurePath: TImageEnViewMouseMeasurePath;
    scGPCharGlyphButton1: TscGPCharGlyphButton;
    scGPCharGlyphButton2: TscGPCharGlyphButton;
    scGPCharGlyphButton3: TscGPCharGlyphButton;
    NetHTTPClient1: TNetHTTPClient;
    scGPPanel2: TscGPPanel;
    grSimpanan: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    grPinjaman: TcxGrid;
    gPinjaman: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    mtPinjaman: TFDMemTable;
    mtPinjamanno_rek: TStringField;
    mtPinjamaninfosaldo: TCurrencyField;
    dsInfoPinjaman: TDataSource;
    InfoPinjaman: TDataSource;
    mtSimpanan: TFDMemTable;
    StringField1: TStringField;
    CurrencyField1: TCurrencyField;
    gPinjamanno_rek: TcxGridDBColumn;
    gPinjamaninfosaldo: TcxGridDBColumn;
    gPinjamanNo: TcxGridDBColumn;
    hmDescript: TscLabel;
    dsAngCom: TDataSource;
    mtAngCom: TFDMemTable;
    mtAngComtype_anggota: TIntegerField;
    mtAngComdescript: TStringField;
    eAnggotaType: TcxLookupComboBox;
    hmTglPermohonan: TscLabel;
    hmNoPermohonan: TscLabel;
    hmNoAnggota: TscLabel;
    hmTglPutusan: TscLabel;
    hmIdCab: TscLabel;
    eNoPermohonan: TscLabel;
    eNoAnggota: TscLabel;
    eIdCab: TscLabel;
    eTglPermohonan: TdxDateTimeWheelPicker;
    eTglPutusan: TcxDateEdit;
    GridPanel1: TGridPanel;
    cxLabel5: TcxLabel;
    eDate1: TcxDateEdit;
    eDate2: TcxDateEdit;
    cxLabel7: TcxLabel;
    scGPButton1: TscGPButton;
    scLabel21: TscLabel;
    gxList: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    dsList: TDataSource;
    gxListGOID: TcxGridDBColumn;
    gxListPART_NOTICE: TcxGridDBColumn;
    gxListID_LEGAL: TcxGridDBColumn;
    gxListENDUSER_NO: TcxGridDBColumn;
    gxListIDWIL_PEMOHON: TcxGridDBColumn;
    gxListNAMA_KANTOR1: TcxGridDBColumn;
    gxListTYPE_ANGGOTA: TcxGridDBColumn;
    gxListSTATUS_REG: TcxGridDBColumn;
    gxListDATE_REGISTER: TcxGridDBColumn;
    gxListAPPROVAL: TcxGridDBColumn;
    gxListID_ANGGOTA: TcxGridDBColumn;
    gxListNO_REK: TcxGridDBColumn;
    gxListIDWIL_DEBT: TcxGridDBColumn;
    gxListGO_DATE: TcxGridDBColumn;
    gxListCRT_DATE: TcxGridDBColumn;
    gxListCRT_USER: TcxGridDBColumn;
    gxListOI_ANGGOTA: TcxGridDBColumn;
    gxReport: TcxGridDBBandedTableView;
    gxReportGOID: TcxGridDBBandedColumn;
    gxReportGO_DATE: TcxGridDBBandedColumn;
    gxReportCRT_DATE: TcxGridDBBandedColumn;
    gxReportOI_ANGGOTA: TcxGridDBBandedColumn;
    gxReportPART_NOTICE: TcxGridDBBandedColumn;
    gxReportIDWIL_PEMOHON: TcxGridDBBandedColumn;
    gxReportNAMA_KANTOR1: TcxGridDBBandedColumn;
    gxReportTYPE_ANGGOTA: TcxGridDBBandedColumn;
    gxReportSTATUS_REG: TcxGridDBBandedColumn;
    gxReportDATE_REGISTER: TcxGridDBBandedColumn;
    gxReportDATE_RESIGN: TcxGridDBBandedColumn;
    gxReportDATE_APPROVAL: TcxGridDBBandedColumn;
    gxReportSTATUS_REGISTER: TcxGridDBBandedColumn;
    gxReportID_ANGGOTA: TcxGridDBBandedColumn;
    gxReportNO_REK: TcxGridDBBandedColumn;
    gxReportIDWIL_DEBT: TcxGridDBBandedColumn;
    gxReportColNo: TcxGridDBBandedColumn;
    frxMtList: TfrxDBDataset;
    frxReport1: TfrxReport;
    gxReportGO_STATUS: TcxGridDBBandedColumn;
    gxReportNAMA: TcxGridDBBandedColumn;
    gxListNAMA: TcxGridDBColumn;
    gxListKOTALAHIR: TcxGridDBColumn;
    gxListTGLLAHIR: TcxGridDBColumn;
    gxListKOTA: TcxGridDBColumn;
    gxListKECAMATAN: TcxGridDBColumn;
    gxListDESA: TcxGridDBColumn;
    gxListRTRW: TcxGridDBColumn;
    gxReportKOTALAHIR: TcxGridDBBandedColumn;
    gxReportTGLLAHIR: TcxGridDBBandedColumn;
    gxReportKOTA: TcxGridDBBandedColumn;
    gxReportKECAMATAN: TcxGridDBBandedColumn;
    gxReportDESA: TcxGridDBBandedColumn;
    gxReportRTRW: TcxGridDBBandedColumn;
    mtList: TFDMemTable;
    gxReportPEKERJAAN: TcxGridDBBandedColumn;

    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure scButtonGroupClick(Sender: TObject);
    procedure btCheckVAClick(Sender: TObject);
    procedure ButtonSplitClik(Sender: TObject);

    procedure frxrLabelVAGetValue(const VarName: string; var Value: Variant);
    procedure cbKategoryRekPropertiesEditValueChanged(Sender: TObject);
    procedure edLoadiDKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btAppCreateClick(Sender: TObject);
    procedure btAddFotoClick(Sender: TObject);
    procedure btDelFotoClick(Sender: TObject);
    procedure edLoadiDRightButtonClick(Sender: TObject);
    procedure ImageEnView1ImageChange(Sender: TObject);
    procedure btFromImageEnClick(Sender: TObject);

    procedure ListDbAnggota;
    procedure scGPButton1Click(Sender: TObject);

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

    ICSSession : TClassICSSession;


    eCurrent_Date : TDateTime;

  //  QueryThread : TFDQueryThread;
  end;

  const
    NOT_BUSY = 0;
    BUSY = 0;


var
  FCustRegister: TFCustRegister;
  bActiveData:boolean;


implementation

{$R *.dfm}

uses MainMenuApp, ufunc, MyGDate, dataModul2
//  ,uRestVCL
  ,cr_ksp
  ,iexRegistryFunctions, iexWindowsFunctions
  ,MVCFramework.DataSet.Utils, MVCFramework.FireDAC.Utils
  ;

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
  asgLoan.Cells[0, 3] := 'Kode Lembaga';
  asgLoan.Cells[0, 4] := 'Nama Lembaga';
//application member

//const

  InitialProfileClear;

  scPageCentral.PageIndex := 0;

  CodeSite.Send('oncreate!');

  ListDbAnggota;

  edate1.EditValue:= now();
  edate2.EditValue:= now();

end;

procedure TFCustRegister.ListDbAnggota;
var
  scgpsn : String;
  Response: IMVCRESTResponse;
  oJson, oRaw : System.JSON.TJSONObject;
  oArr : TJsonArray;
  i : integer;
begin
  Response := ICSMVCAppRequest( MainApp.ICSSession , 'GET', '/ics/tanggota' );
  CodeSite.Send(Response.Content);

  eAnggotaType.Properties.Items.Clear;
  if Response.StatusCode=200 then

  begin
    CodeSite.Send('A.AnggotaTipe-02');

//    oJson := TJSONObject.ParseJSONValue( Response.Content ) as TJSONObject;

//    if Assigned(oJson.Get( 'data' ) ) then
//    begin

//      oArr := oJson.Get('data').jsonValue as TJSONArray;
//      CodeSite.Send('A.AnggotaTipe-03');


      //dropdownlist regular(non dataset)
//      for i := 0 to oArr.size-1 do
//      begin
//        oRaw := oArr.Items[i] as TJSONObject;
//        eAnggotaType.Properties.Items.add( oRaw.GetValue<string>('descript'));
//      end;

      if not(mtAngCom.Active) then
        mtAngCom.Open;

      mtAngCom.EmptyDataSet;

//      codesite.send(oArr.toJson);

//      mtAngCom.LoadFromJSON(oArr.toJson); //fundamental
        mtAngCom.LoadJSONArrayFromJSONObjectProperty('data', Response.Content);  //Daniel MVC

      eAnggotaType.EditValue := 1;

//    end;
  end;

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

    //Visualisation of DataLink
    try
      if Not DM.FDT_OFFICE.Active then
      DM.FDT_OFFICE.Active := True;
    finally
      scCabangLook.ListSource  := DM.dsFDT_OFFICE;
      scCabangLook.KeyValue    := MainApp.ICSSession.Office_id;

    end;

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

procedure TFCustRegister.btAppCreateClick(Sender: TObject);
CONST
RESOURCE_IMAGEEN_EXTENSIONS = '.unknown;.TIFF;.GIF;.JPEG;.PCX;.BMP;.ICO;.CUR;.PNG;.WMF;.EMF;.TGA;.PXM;.JP2;.J2K;.AVI;.WBMP;.PS; .PDF;.DCX;.RAW;.BMPRAW .WMV;.MPEG;.PSD;.IEV;.IEN;.ALL;.DICOM .HDP;.RAS;.SVG;.DDS;.HEIF;.WEBP;.WIC;.OtherDLL.MiscDLLP.USER';
var
  StreamOut : TStringStream;
  fData: TMemoryStream;
  encoder : TidEncoderMIME;
  FileExt : String;
  AList :  TStringList;
  i,eRR : Integer;

  //MVC Daneil
  OBJson, body : JsonDataObjects.TJSONObject;

  OJson : System.JSON.TJSONObject;

  Response: IMVCRESTResponse;

begin

      //ImageEnView1.IEBitmap

      //try

          CodeSite.send('1/1');

          eRR :=0;
          if IsEmptyOrNull( asgProfile.Cells[1, 0]) then
          Inc(err);

          if IsEmptyOrNull( asgProfile.Cells[1, 3]) then
          Inc(err);

          if IsEmptyOrNull( MainApp.ICSSession.Office_id) then
          Inc(err);

          if err = 0 then begin

              //mvc daniel
              body := JsonDataObjects.TJsonObject.Create;  //MVC

              CodeSite.send('1/5/2');

              body.I['cif_id']       := StrToInt  (asgProfile.Cells[1, 0]) ;
              body.F['id_legal']     := StrToFloat(asgLoan.Cells[1, 3]) ;
              body.I['status_reg']   := 1;
              body.S['ido']          := MainApp.ICSSession.Office_id;
              body.I['type_anggota'] := 2;
              body.D['go_date']      := eTglPermohonan.DateTime;
              body.I['goid']         := strtoint(eNoPermohonan.Caption);


              if Not ImageEnView1.IsEmpty( False ) then begin

                  fData := TMemoryStream.Create;

                  CodeSite.send('1/2');

                  fData.Size := ImageEnView1.Proc.ReadHiddenData(nil, 0);

                  //ImageEnView1.IO.SaveToStream(fData,ioUnknown);
                  ImageEnView1.IO.SaveToStream(fData,ImageEnView1.IO.Params.FileType);

                  CodeSite.send('FileType:[' + IntToStr(ImageEnView1.IO.Params.FileType) +']');

                  encoder   := TidEncoderMIME.Create(nil);
                  StreamOut := TStringStream.Create('');

                  fData.Position := 0;

                  CodeSite.send('1/3');
                  encoder.EncodeStream(fData, StreamOut, fData.Size );

                  //Delphi XE10.3 TNetEncoding.Base64.Encode( fData, StreamOut );

                  StreamOut.Position := 0;

                  CodeSite.send('1/4');
                  AList := TStringList.Create;
                  AList.Delimiter := ';';
                  AList.DelimitedText := RESOURCE_IMAGEEN_EXTENSIONS;

                  CodeSite.send('1/5');
                  //AList.Sort;
                  FileExt := AList[ ImageEnView1.IO.Params.FileType ];

                  CodeSite.send('1/5/1');
                  body.S['fileExt']      := FileExt;
                  body.S['file_nic']     := QuotedStr( StreamOut.DataString);

                  encoder.Free;

                  fData.DisposeOf; fData := nil;
                  StreamOut.DisposeOf; StreamOut := nil;


              end else begin
                  body.S['fileExt']      := '';
                  body.S['file_nic']     := '';
              end;
              CodeSite.send('1/7');

              //Back to JSON Object Standar Delphi
              OJson := TJSONObject.ParseJSONValue( body.toString ) as System.JSON.TJSONObject;

              CodeSite.send('2/json/'+ oJson.ToString);
              if btAppCreate.Caption = 'Proses' then
                Response := ICSMVCAppRequest( MainApp.ICSSession , 'POST', '/ics/enduserA2' , OJson  )
              else
                Response := ICSMVCAppRequest( MainApp.ICSSession , 'PUT', '/ics/enduserA2' , OJson  );

              CodeSite.send('2/1');

              OBJson := Response.ToJSONObject;

              //oJSON := TJSONObject.ParseJSONValue( Response.Content ) as TJSONObject;

              CodeSite.send('2/2');


              if OBJson.S['responseCode'] = '00' then begin

                CodeSite.send('3/SR: Uploaded'  );

                CodeSite.send('4/SR: '+ TPath.GetFileName( MainApp.ICSSession.LoginName+FileExt ));
                if nOT IsEmptyOrNull ( OBJson.s['nomorPermohonan'] ) then
                //if Assigned(oJson.Get( 'nomorPermohonan' ) ) then
                begin

                  eNoPermohonan.Caption    := Format('%.*d',[10, OBJson.I['nomorPermohonan']]);
                  eTglPermohonan.DateTime  := OBJson.D['tanggalPermohonan'] ;       //DateTimeToISOTimeStamp

                  //ISOTimeStampToDateTime( OBJson.D['tanggalPermohonan'] ) ;       //DateTimeToISOTimeStamp

                end;

                MetroTaskMessageDlg(
                      'Profile update',
                      'Uploaded Data successfully',
                      mtConfirmation,[mbClose],1);

              end else
              MetroTaskMessageDlg(
                    'Profile update',
                    'Data tidak dapat di Rubah',
                    mtConfirmation,[mbClose],1);
          end;
      {
      Except on e: Exception do begin

          MetroTaskMessageDlg(
                'Perhatian',
                'Format gambar tidak di support atau corrupt',
                mtConfirmation,[mbClose],1);

          end;

      end;
      }

      CodeSite.send('5/e');

      OJson.Free;

end;

procedure TFCustRegister.btCheckVAClick(Sender: TObject);

begin

  InitialProfileClear;

  Customer_GetProfile;

//  ListDbAnggota;

end;

procedure TFCustRegister.btDelFotoClick(Sender: TObject);
begin
//  hFotoKTP.Picture.Graphic   := Nil;
end;


procedure TFCustRegister.btFromImageEnClick(Sender: TObject);
var
  ms: TMemoryStream;

begin

  try
    if Not Assigned( ImageEnMF ) then
      ImageEnMF := TImageEnMF.Create(Self);

    try
      //Mengirim gambar ke Form Edit;
      ms:= TMemoryStream.Create;
      ImageEnView1.IO.SaveToStream(ms,ioUnknown);
      ms.Position:= 0;
      ImageEnMF.ImageEnView1.IO.LoadFromStream(ms,ioUnknown);
      ImageEnMF.ImageEnView1.Fit();
      ImageEnMF.ImageEnView1.CenterImage();
      ImageEnMF.ImageEnView1.Update;

      CodeSite.Send('img/1');
    finally

      ms.DisposeOf;


    end;


    try
      ImageEnMF.ShowModal();


      if ( ImageEnMF.ModalResult = mrOk ) then begin

        //mengambil gambar dari Form Edit;
        ms:= TMemoryStream.Create;
        ImageEnMF.ImageEnView1.IO.SaveToStream(ms,ioUnknown);
        ms.Position:= 0;
        CodeSite.Send('img/2');

        ImageEnView1.Clear;
        ImageEnView1.IO.LoadFromStream(ms,ImageEnMF.ImageEnView1.IO.Params.FileType);
        //ImageEnView1.IO.LoadFromStream(ms,ioUnknown);
        ImageEnView1.Update;

        CodeSite.Send('img/3');
        FreeAndNil(ms);

        CodeSite.Send('img/4');
        //ms.DisposeOf;

        CodeSite.Send('img/5');

      end;


    finally

      CodeSite.Send('img/6');

      //ImageEnMF.DisposeOf;

      CodeSite.Send('img/7');

    end;

  Except
    CodeSite.Send('img/4/err');
  end;

  CodeSite.Send('img/e');

//  fData := TMemoryStream.Create;
//  fData.Size := ImageEnView1.Proc.ReadHiddenData(nil, 0);
//  ImageEnView1.IO.SaveToStream(fData,ImageEnView1.IO.Params.FileType);
//  encoder   := TidEncoderMIME.Create(nil);
//  StreamOut := TStringStream.Create('');
//  fData.Position := 0;
//  encoder.EncodeStream(fData, StreamOut, fData.Size );
//  StreamOut.Position := 0;
//
//  //mvc daniel
//  body := JsonDataObjects.TJsonObject.Create;  //MVC
//  body.S['image_ktp'] := QuotedStr( StreamOut.DataString);


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

procedure TFCustRegister.ImageEnView1ImageChange(Sender: TObject);
begin
  if ImageEnView1.IsEmpty( False ) then begin
    //CodeSite.Send('ImageChange=0');
    ImageEnView1.MouseWheelParams.Action := TIEMouseWheelParamsAction(1);
  end else begin
    //CodeSite.Send('ImageChange=1');
    ImageEnView1.MouseWheelParams.Action := TIEMouseWheelParamsAction(2);
  end;
end;

procedure TFCustRegister.InitialProfileClear;
var
  yy,mm,dd : word;

begin

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

//  hFotoKTP.Picture.Graphic   := Nil;

  btAppCreate.Enabled := False;
  btBillDel.Enabled  := False;

  ImageEnView1.Enabled  := False;
  PromptToResize.Enabled:= False;
  PromptToSave.Enabled  := False;
  Acquire.Enabled       := False;

  eAnggotaType.EditValue := 2; //defult value type anggota
  eTglPermohonan.Enabled := False;
  eTglPutusan.Enabled    := False;

  if  Not mtList.Active then
  mtList.Active := True;

  mtList.EmptyDataSet;

  ImageEnView1.MouseWheelParams.Action := TIEMouseWheelParamsAction(0);
  {
  0:None
  1:Scroll
  2:Zoom
  3:Navigate
  }

  if ImageEnView1.IsEmpty( False ) then begin
    //CodeSite.Send('1/isEmpty-False');
    //if btAppCreate.Enabled then
    ImageEnView1.MouseWheelParams.Action := TIEMouseWheelParamsAction(2);

  end
  else
  begin
    ImageEnView1.Blank();

    //CodeSite.Send('1/isEmpty-True');
  end;

  //TActionList(ActionList1).ActionLink Blank;
  //Blank;
  //ActionList1. //ActionList1

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
  oRaw, oJson, oData : System.JSON.TJSONObject;

  //Standar Delphi
  paramJSON : System.JSON.TJSONObject;

  //MVC Daneil
  body : JsonDataObjects.TJSONObject;

  oArr : TJsonArray;
  SR, curlImg, sArr  : string;
  i,n,iFileType : Integer;
  xStatus, zonasi, status_Reg : String;
  pernyaataan : boolean;

  lImage: TMemoryStream;
  cekrw: string;

begin

  //standar delphi
  {
  paramJSON := System.JSON.TJSONObject.Create;
  paramJSON.AddPair(TJSONPair.Create('LoginName', MainApp.ICSSession.LoginName ));
  paramJSON.AddPair(TJSONPair.Create('Office_ID', MainApp.ICSSession.Office_id ));
  }

  //mvc daniel
  body := JsonDataObjects.TJsonObject.Create;  //MVC
  body.S['LoginName'] := MainApp.ICSSession.LoginName;
  body.S['Office_ID'] := MainApp.ICSSession.Office_id;

  //Back to JSON Object Standar Delphi
  paramJSON := TJSONObject.ParseJSONValue( body.toString ) as System.JSON.TJSONObject;

  //sample  body code :
//{
// "LoginName": "R2XDnBSDuEprdPgdoGuP5v4vI6dFj6/AZuHX7jyDpx0=",
// "Office_ID": "056"
//}

  CodeSite.Send('>G-1');

  Response :=
    ICSMVCAppRequest( MainApp.ICSSession , 'POST' , '/ics/AF2360E45F/'+edLoadiD.Text , paramJSON );

  //ICSMVCAppRequest( MainApp.ICSSession , 'POST' , '/ics/AF2360E45F/'+edLoadiD.Text , paramJSON );

  //Dengan DataBase icsgo tersimpan
  {
  paramJSON.AddPair(TJSONPair.Create('NO_PINJAMAN',  edLoadiD.Text ));
  ICSMVCRESTRequest(
                MainApp.ICSSession , 'ICS_PROFILELOAN_NP', paramJSON  );

  }

  if Response.StatusCode = 200 then begin

      CodeSite.Send('>G2');

      oJSON := TJSONObject.ParseJSONValue( Response.Content ) as TJSONObject;

      CodeSite.Send('>G2/1');

      if Assigned(oJson.Get( 'responseCode' ) ) then begin

          CodeSite.Send('>G2/2/RC/'+ oJson.GetValue<string>('responseCode'));

          if oJson.GetValue<string>('responseCode') = '00' then begin


              CodeSite.Send(Response.Content);

              //deteksi zona masuk apa tidak!-----------
              Zonasi := 'REGION';
              if Assigned(oJson.Get( 'info' ) ) then begin

                oRaw := oJson.Get('info').jsonValue as TJSONObject;

                  CodeSite.Send('>G-2/1');

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

                  if Assigned(oRaw.Get('legal_id')) then
                  begin
                      asgLoan.Cells[1, 3] := oRaw.GetValue<string>('legal_id');;
                      asgLoan.Cells[1, 4] := oRaw.GetValue<string>('legal_name');;
                  end;
              end;
              
              CodeSite.Send('>G-2/2');

              asgLoan.Cells[0, 1] := 'Zonasi ';
              asgLoan.Cells[0, 2] := 'Area Layanan';

              asgLoan.Cells[1, 1] := Zonasi;
              asgLoan.Cells[1, 2] := iif(btAppCreate.Enabled,'MASUK','Anggota Luar biasa');


              oArr := oJson.Get('5eM3s74').jsonValue as TJSONArray;

              //penanganan info anggota----------------------------
              //sArr := TMSAES( sArr , MainApp.ICSSession.Dupa ,0 , atOFB );
              //oArr :=  TjsonObject.ParseJsonValue('5eM3s74') as TJSONArray;

              // get the array
              // get pharsig 5eM3s74----------------------------------------------*************************************
              if oArr.Size > 0 then
              begin

                //--------------------------------------------------------------
                //Update Profile!
                  oRaw := oArr.Items[0] as TJSONObject;

                  asgProfile.Cells[1, FCustomer_CIF]  := oRaw.GetValue<string>('cif_id');
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

              //Check Register Anggota [ada/tidak]

              status_Reg := 'BELUM TERDAFTAR';


              if Assigned(oJson.Get( 'CustomerRStat' ) ) then
              begin

                  CodeSite.Send('>G-3/1');

                  oArr := oJson.Get('CustomerRStat').jsonValue as TJSONArray;

                  CodeSite.Send('>G-3/2/size:'+ IntToStr(oArr.size));

                  if oArr.size > 0 then
                  begin

                      CodeSite.Send('>G-3/3');

                      oRaw := oArr.Items[0] as TJSONObject;

                      status_Reg := oRaw.GetValue<string>('status_reg');

                      asgLoan.Cells[1, 0] := oRaw.GetValue<string>('status_reg');

                      if status_Reg = 'ACTIVE' then
                      begin
                          asgLoan.Cells[1, 0] := 'Masih dalam daftar Tunggu!';

                          btAppCreate.Enabled := False;

                          if btAppCreate.Enabled then begin
                             btAppCreate.Caption := 'Edit';
                          end;

                      end;

                      if status_Reg = 'EXPIRED' then
                      begin
                          asgLoan.Cells[1, 0] := 'Daftarkan Kembali!';
                          btAppCreate.Caption := 'Edit';
//                          btAppCreate.Enabled := False;   //melewti Klik Edit dulu
                      end;

                      CodeSite.Send('>G-3/x');

                      eNoPermohonan.Caption  := Format('%.*d',[10, strtoint(oRaw.GetValue<string>('goid'))]);   //Integer to String

                      eTglPermohonan.DateTime := ISOTimeStampToDateTime( oRaw.GetValue<string>('go_date')) ;       //DateTimeToISOTimeStamp
                      eNoAnggota.Caption      := oRaw.GetValue<string>('id_anggota');
                      eTglPutusan.EditValue   := oRaw.GetValue<string>('date_register');
                      eIdCab.Caption          := oRaw.GetValue<string>('idwil');
                      eAnggotaType.EditValue  := oRaw.GetValue<string>('type_anggota');

                  end else begin

                    asgLoan.Cells[1, 0] := 'Belum Terdaftar';
                    btAppCreate.Caption := 'Proses';
                    btAppCreate.Enabled := True;

                    codesite.Send('belum terdaftar 01');
                    //deteksi zona masuk apa tidak!-----------
                    Zonasi := 'REGION';
                    if Assigned(oJson.Get( 'info' ) ) then begin

                      oRaw := oJson.Get('info').jsonValue as TJSONObject;

                        CodeSite.Send('>G-2/1');

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

                        codesite.Send('kode cabang salah 02');

                        if Assigned(oRaw.Get('legal_id')) then
                        begin
                            asgLoan.Cells[1, 3] := oRaw.GetValue<string>('legal_id');;
                            asgLoan.Cells[1, 4] := oRaw.GetValue<string>('legal_name');;
                        end;
                    end;

                   codesite.Send('03');

                  end;


                  //menampilkan di tcxedit => oRaw.GetValue<string>('params_name');

              end;



              btAddFoto.Enabled := btAppCreate.Enabled;
              btDelFoto.Enabled := btAppCreate.Enabled;

              ImageEnView1.Enabled := btAppCreate.Enabled;
              PromptToResize.Enabled := btAppCreate.Enabled;
              PromptToSave.Enabled := btAppCreate.Enabled;
              Acquire.Enabled := btAppCreate.Enabled;

              if not(mtPinjaman.Active) then
              mtPinjaman.Open;

              mtPinjaman.EmptyDataSet;
              codesite.send('cek_1');
              if Assigned(oJson.Get( 'loan' ) ) then begin

                  //retrive dari JSON ARRAY
//                  oArr := oJson.Get('loan').jsonValue as TJSONArray;
//                  codesite.send(oArr.toJson);
//                  mtPinjaman.LoadFromJSON(oArr.toJson);
                  mtPinjaman.LoadJSONArrayFromJSONObjectProperty('loan', Response.Content);  //Daniel MVC
              codesite.send('cek_2');
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

              //Codesite.Send('Net/1');


              TTask.Run(procedure
                  var
                    lImage: TMemoryStream;
                    body : JsonDataObjects.TJSONObject;
                    SR : String;
                    Response: IMVCRESTResponse;
                  begin

                    lImage := TMemoryStream.Create;
                    try

                    Codesite.Send('Net/2/1');
                    body := JsonDataObjects.TJsonObject.Create;  //MVC
                    body.S['pg_image'] := 'NIK';
                    body.F['id_legal'] := StrToFloat(asgLoan.Cells[1, 3]);

                    //CodeSite.Send('2/3/Body:'+ body.ToString);

                    curlImg := '/ics/A2IMAGEJS/'+asgProfile.Cells[1, FCustomer_CIF];

                    Response :=
                    ICSMVCAppRequest( MainApp.ICSSession ,
                      'POST' ,
                      curlImg ,
                      TJSONObject.ParseJSONValue( body.toString ) as System.JSON.TJSONObject );

                    //CodeSite.Send('2/4');

                    //CodeSite.Send('2/5/'+IntToStr(Response.StatusCode));

                    if Response.StatusCode = 200 then begin

                        //CodeSite.Send('2/6');

                        TThread.Synchronize(nil,procedure begin

                        oJSON := TJSONObject.ParseJSONValue( Response.Content ) as TJSONObject;

                        SR := oJson.GetValue<string>('image');
                        lImage := TMemoryStream.Create;

                        //Codesite.Send('Net/3');

                        //TNetEncoding.Base64.Decode ( SR , LResponse );           //DXE103

                        lImage := TBytesStream.Create(DecodeBase64( SR ));   //DXE103, XE6

                        lImage.Position:= 0;

                        //Codesite.Send('Net/4');

                        iFileType:=FindStreamFormat(lImage);

                        //Codesite.Send('Net/4/[1]/'+IntToStr(iFileType));
                        ImageEnView1.IO.StreamHeaders := True;
                        ImageEnView1.IO.LoadFromStream(lImage,iFileType); //ioUnknown);

                        //Codesite.Send('Net/5');
                        ImageEnView1.Fit();
                        //ImageEnMF.ImageEnView1.CenterImage();
                        ImageEnView1.Update;

                        //Codesite.Send('Net/e');

                        //Image1.Bitmap.LoadFromStream(LResponse);
                      end);
                    end;
                  finally

                    body.free;
                    lImage.Free;

                    //NetHTTPClient1.Tag := NOT_BUSY;

                    //GaussianBlurEffect1.Enabled := False;
                    //ProgressBar1.Visible := False;
                    //Timer1.Enabled := False;
                    //ProgressBar1.Value := 0;
                  end;
              end);




                {
                if NetHTTPClient1.Tag=NOT_BUSY then
                begin

                  Codesite.Send('Net/2');

                  curlImg := MainApp.ICSSession.HostName+':'+ IntToStr(MainApp.ICSSession.PortNo)+ '/ics/A2IMAGE/' + asgProfile.Cells[1, FCustomer_CIF];

                  Codesite.Send('curl:'+curlImg );

                  //GaussianBlurEffect1.Enabled := True;
                  //ProgressBar1.Visible := True;
                  //Timer1.Enabled := True;
                  TTask.Run(procedure var LResponse: TMemoryStream; begin
                    LResponse := TMemoryStream.Create;
                    try

                      Codesite.Send('Net/2/1');

                      NetHTTPClient1.Get( curlImg ,LResponse);

                      TThread.Synchronize(nil,procedure begin

                        Codesite.Send('Net/3');
                        LResponse.Position:= 0;

                        Codesite.Send('Net/4');
                        iFileType:=FindStreamFormat(LResponse);

                        Codesite.Send('Net/4/1/'+IntToStr(iFileType));

                        ImageEnMF.ImageEnView1.IO.LoadFromStream(LResponse,ioPNG); //ioUnknown);

                        Codesite.Send('Net/5');
                        ImageEnMF.ImageEnView1.Fit();
                        ImageEnMF.ImageEnView1.CenterImage();
                        ImageEnMF.ImageEnView1.Update;

                        Codesite.Send('Net/e');

                        //Image1.Bitmap.LoadFromStream(LResponse);
                      end);
                    finally
                      LResponse.Free;
                      NetHTTPClient1.Tag := NOT_BUSY;

                      //GaussianBlurEffect1.Enabled := False;
                      //ProgressBar1.Visible := False;
                      //Timer1.Enabled := False;
                      //ProgressBar1.Value := 0;
                    end;
                  end);
                end;
                }

          end else begin

            if Assigned(oJson.Get( 'responseDescription' ) ) then
              status_Reg := oJson.GetValue<string>('responseDescription')
            else
              status_Reg := 'Data tidak ditemukan';

            MetroTaskMessageDlg(
              'Profile Anggota',
              status_Reg,
              mtConfirmation,[mbClose],1);

          end;
      end else begin

          CodeSite.Send('>G3/1');

                MetroTaskMessageDlg(
                      'Profile Anggota',
                      'Data tidak ditemukan',
                      mtConfirmation,[mbClose],1);


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

procedure TFCustRegister.scGPButton1Click(Sender: TObject);
var
  scgpsn : String;
  Response: IMVCRESTResponse;
  oJson: System.JSON.TJSONObject;
  oArr : TJsonArray;
  i : integer;
  paramlegal, paramid : string;

  OBJson, body : JsonDataObjects.TJSONObject;

begin

    if not(mtList.Active) then mtList.Open;
    mtList.EmptyDataSet;

    paramlegal  := MainApp.ICSSession.legal_id;  //lembaga
    paramid     := MainApp.ICSSession.Office_id;  //id
    codesite.send('1'+ paramlegal+'-'+paramid);
    body := JsonDataObjects.TJsonObject.Create;
    body.D['date1'] := eDate1.EditValue;
    body.D['date2'] := eDate2.EditValue;

    codesite.Send('/ics/List_daftarTunggu/' +paramlegal+'/'+paramid);
    //Back to JSON Object Standar Delphi
    OJson := TJSONObject.ParseJSONValue( body.toString ) as System.JSON.TJSONObject;
    begin
        Response :=
          ICSMVCAppRequest( MainApp.ICSSession , 'POST',
            '/ics/List_daftarTunggu/' +paramlegal+'/'+paramid, OJson);

        CodeSite.Send(Response.Content);

        if Response.StatusCode=200 then
        begin
            mtList.LoadJSONArrayFromJSONObjectProperty('data',Response.Content);  //Daniel MVC
        end;
    end;

end;

procedure TFCustRegister.btAddFotoClick(Sender: TObject);
Var
  Response: IMVCRESTResponse;
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
//        hFotoKTP.Picture.Graphic := g;

      finally

        CodeSite.send('6/Start destroy mem'  );

        g.Free;

      end;
    end;
  end;
end;

end.

