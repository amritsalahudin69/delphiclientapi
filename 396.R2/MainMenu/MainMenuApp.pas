unit MainMenuApp;
//Om Swastiastu
//Created by Jaya Lukita (c) 20221122
//Application Build Delphi XE 10.3 Rio

//For ICS396 API Only! (20230227)

//20230227 - MVC Framework radium;
//         - Login and Starting Perform in same us Delphi XE6 ICS Perform.
//         - Load Logo, Foto and CheckRegistration.


interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, System.Actions, System.DateUtils, System.INIFiles,
  System.Types, System.Threading, System.IOUtils,
  //Next ==
  System.NetEncoding,System.Net.HttpClient, {Delphi XE10}
  Data.DBXJSONCommon,
  Soap.EncdDecd,


  Vcl.Graphics,Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ImgList, Vcl.StdCtrls, AdvEdit, Vcl.Mask,
  Vcl.ActnList,Vcl.ExtCtrls,Vcl.Themes,
  Vcl.ComCtrls,StrUtils,Vcl.FileCtrl,Math,ShellApi,WinInet,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan,Printers,

  FireDAC.Stan.Option, Data.DB,

  //MVC
  MVCFramework.RESTClient,
  MVCFramework.RESTClient.Intf,
  MVCFramework.Commons,
  JsonDataObjects,

  scGPControls, scControls,
  scImageCollection, scGPImages, scStyledForm, scStyleManager,
  scDrawUtils, scGPPagers, scGPExtControls, AdvMetroProgressBar,
  scModernControls, cxGraphics, cxControls, cxLookAndFeels,
  scAdvancedControls,scExtControls,

  //TMS Criptograpy
  HashObj, CryptBase, MiscObj, AESObj,

  //DevExpress
  dxGDIPlusClasses,
  dxSkinsForm, dxSkinsDefaultPainters,dxCore, dxSkinsCore,
  cxLookAndFeelPainters, dxCustomTileControl, cxClasses, dxTileControl,
  cxImageList,

  //TMS
  AdvMetroTaskDialog,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg,

  //ImageEn
  imageenview,hyieutils, iexBitmaps,

  //apoEnv, ApoDSet, uIdxSQLite,
  //frmBaseFrame,
  //Encroption with DCPcrypt Cryptographic Component Library v2
  //by Henri Gourvest
  //last: 20220726
  //DCPblockciphers, DCPtwofish, DCPcrypt2,DCPblowfish, DCPsha1,
  //uIdxApollofB,

  //TMS Security
  //uChangePasswordDlg, uSecControl, uSecDlg,uFormPolicy, uFormPolicyDlg,



//  //EhLib
//  DateTimeCalendarPickersEh,DBGridEhGrouping, ToolCtrlsEh, DBGridEhToolCtrls,
//  MemTableEh, DynVarsEh, EhLibVCL, DBAxisGridsEh,DataDriverEh,
//  DBCtrlsEh, GridsEh, DBGridEh,

  //jlx
  MyIdClient, scDevExStyleAdapter, uRestVCL,

  //API RestClient
  REST.Client, System.JSON,

  System.Net.URLClient, System.Net.HttpClientComponent,

  //Clever Internet Suite
  clTcpClient, clTcpClientTls, clHttp, clHttpRequest,
  clSspiTls, clHttpUtils, System.ImageList, uIdxSQLite, clWebUpdate,
  hyiedefs, iesettings, iexLayers, iexRulers, iexToolbars,
  iexUserInteractions, imageenio, imageenproc, ieview



  {$IF DEFINED (ANDROID)}
  , Androidapi.Helpers
  {$ELSEIF DEFINED (MSWINDOWS)}
  //, CodeSiteLogging, CodeSiteJsonLogging
  {$ENDIF}
  ;


type
  TClassDeviceInfo = record
    DeviceId   : String;
    MacAddress : String;
    IPAddress  : String;
    Activation : Boolean;
  end;

type
 TitTYPES=(itJPG,itPNG,itBMP);

type TICSDataBase = Record
  Db1_db     : string;
  Db1_port   : string;
  Db1_Server : string;
  Db1_Name   : string;
  Db1_Status : boolean;
  Db1_Host   : string;

  Db2_db     : string;
  Db2_port   : string;
  Db2_Server : string;
  Db2_Name   : string;
  Db2_Status : boolean;
  Db2_Host   : string;

end;


type
  TMainApp = class(TForm)
    scStyleManager1: TscStyleManager;
    scStyledForm1: TscStyledForm;
    BorderPanel: TscGPPanel;
    AdvMetroProgressBar1: TAdvMetroProgressBar;
    scGPSizeBox1: TscGPSizeBox;
    AccountButton: TscGPGlyphButton;
    CloseButton: TscGPGlyphButton;
    MinButton: TscGPGlyphButton;
    scPageControl1: TscPageControl;
    scSplitView1: TscSplitView;
    scGPPanel1: TscGPPanel;
    scListMenu: TscAdvancedListBox;
    dxTileControl1: TdxTileControl;
    PanelMenu: TscGPPanel;
    btAccountProfile: TscGPGlyphButton;
    btMenuSeting: TscGPGlyphButton;
    btMenuDetail: TscGPGlyphButton;
    scLabelApp: TscLabel;
    sbDateNow: TscLabel;
    lbStatusBar: TscLabel;
    scEdit1: TscGPEdit;
    Timer1: TTimer;
    MainActionList: TActionList;
    HelpAbout1: TAction;
    acConnect: TAction;
    acActivation: TAction;
    acShutDown: TAction;
    acSignIn: TAction;
    acChangePwd: TAction;
    acSaleRecap: TAction;
    acRegister: TAction;
    scSV_Config: TscSplitView;
    scActivityIndicator1: TscActivityIndicator;
    AdvMetroTaskDialog1: TAdvMetroTaskDialog;
    dxSkinController1: TdxSkinController;
    scGPVirtualImageList1: TscGPVirtualImageList;
    scSplitAndapan: TscSplitView;
    dxTileControl1Item1: TdxTileControlItem;
    dxTileControl1Group1: TdxTileControlGroup;
    scImageCollection1: TscImageCollection;
    MaxButton: TscGPGlyphButton;
    clWebUpdate: TclWebUpdate;
    StartButton: TscGPGlyphButton;
    scScrollBox1: TscScrollBox;
    scBtnBackConfig: TscGPGlyphButton;
    scGPPanel3: TscGPPanel;
    scLoginMsg: TscLabel;
    scActivityIndicator2: TscActivityIndicator;
    lbFullName: TscLabel;
    lbInfo: TscLabel;
    lbJob: TscLabel;
    lbLastAcc: TscLabel;
    scGPPanel2: TscGPPanel;
    scPasswordEdit1: TscGPPasswordEdit;
    scUserName: TscGPEdit;
    scFoto: TscGPImage;
    btSingin: TscGPButton;
    lbLembaga: TscLabel;
    scSessionID: TscLabel;
    scLabelVersion: TscLabel;
    scInfoRegistered: TscLabel;
    scGPPanel4: TscGPPanel;
    scImage1: TscGPImage;
    lbLegalName: TscLabel;
    scGPImage1: TscGPImage;
    httpRestClient: TNetHTTPClient;
    httpRequest: TNetHTTPRequest;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CloseButtonClick(Sender: TObject);
    procedure MinButtonClick(Sender: TObject);
    procedure MaxButtonClick(Sender: TObject);
    procedure scStyledForm1DWMClientMaximize(Sender: TObject);
    procedure scStyledForm1DWMClientRestore(Sender: TObject);
    procedure scStyledForm1BeforeChangeScale(Sender: TObject);
    procedure scStyledForm1ChangeScale(AScaleFactor: Double);
    procedure scGPPageControl1Close(Sender: TObject; var CanClose: Boolean);
    procedure StartButtonClick(Sender: TObject);
    procedure btMenuDetailClick(Sender: TObject);
    procedure BorderPanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure scLabelAppMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure scLabelAppMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure scLabelAppMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Timer1Timer(Sender: TObject);
    procedure acConnectExecute(Sender: TObject);
    procedure scPageControl1AfterClose(Sender: TObject);
    procedure scEdit1RightButtonClick(Sender: TObject);
    procedure scEdit1Change(Sender: TObject);
    //procedure GetAuthActivation(Sender: TObject);
    procedure acShutDownExecute(Sender: TObject);
    procedure acSignInExecute(Sender: TObject);
    procedure acSaleRecapExecute(Sender: TObject);
    procedure acRegisterExecute(Sender: TObject);
    procedure scSV_ConfigOpened(Sender: TObject);
    procedure AccountButtonClick(Sender: TObject);
    procedure scPasswordEdit1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure scBtnBackConfigClick(Sender: TObject);
    procedure scPageControl1Close(Sender: TObject; var CanClose: Boolean);
    procedure dxTileControl1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure scPageControl1Change(Sender: TObject);
    procedure clWebUpdateDownloadProgress(Sender: TObject; UpdateNo: Integer;
      Downloaded, Total: Int64);
    procedure clWebUpdateNoUpdatesFound(Sender: TObject);
    procedure clWebUpdateProcessCompleted(Sender: TObject);
    procedure clWebUpdateRunUpdate(Sender: TObject; AUpdateScript: TStrings;
      ANeedTerminate: Boolean; var CanRun: Boolean;
      var Result: TclRunUpdateResult; var AErrors: string);
    procedure clWebUpdateTerminating(Sender: TObject;
      var CanTerminate: Boolean);
    procedure btMenuSetingClick(Sender: TObject);
    procedure scListMenuKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure scListMenuKeyPress(Sender: TObject; var Key: Char);
    procedure scListMenuEnter(Sender: TObject);
    procedure scListMenuClick(Sender: TObject);

  private
    { Private declarations }

    FOldBoundsRect: TRect;
    FMaximized: Boolean;
    FDown: Boolean;
    FDownP: TPoint;
    FShowing: Boolean;
    eStartTime : TDateTime;
    ElapsedTime: TDateTime;
    IdleBlock : boolean;
    AppExplorer : Integer;
    SLIndexes: TSQLIteIndexes;
    AuthActivation : Boolean;

    function Hari_Pasaran(Tgl: TDate): string;
    function GetBuildInfoAsString: string;
    function GetVersion(sFileName:string): string;
    function GetFileInfo(filename: string): string;
    procedure GetBuildInfo(var V1, V2, V3, V4: word);

    procedure FillMetro;
    procedure MyDefaultMetroFill;
    procedure MyMenuInSelected(Sender: TObject);
    procedure MyDeActivate;

    //function MyDataUserConnection(): Boolean;

    procedure MySQLiteData_cc;

    procedure MyActionSelected(cActive:Boolean=False);
    function  MyActionFacOnChange():Boolean;
    procedure MyLogin;
    procedure CheckLegalID;
    procedure CheckFotoProfile;
    procedure MyGetBackground( url: String );
    procedure CheckRegistration;
    procedure BuildCatalog_1; //List Office
    procedure BuildCatalog_2; //Menu Item
    procedure CheckDashboard(apikey_id:Integer);
    procedure CheckApi_Command(apikey_id: String ; Ver_id: Integer=1 );
    procedure CheckAppMenu(apikey_id: String ; Ver_id: Integer=1 );
    procedure CheckDevCatalog;

    //riset 20230318
    function doHttpRequest(const AMethod, AResource: string;
    ARequestBody: string = ''): string;

    //ARequestBody: TStream = nil): string;

    //AHeaders: TStrings;

  public
    //Last: 20221021
    ICSRestClient: IMVCRESTClient;

    ICSSession : TClassICSSession;
    DeviceInfo : TClassDeviceInfo;
    API_Header : TJSONObject;

    msDatabase : TICSDataBase;  //,msServer,msPort

    msLegalCompany,msPasswordUser,msCurrentUser,msCurrentIDUser : string;
    msSysData : string;

    msLockSID_MIC : string;

    msEvent_Num : Integer;
    bRemote : boolean;

    msModeICSLS: boolean;

    procedure MyLoadClientApp1;
    //procedure MyLoadClientApp2;
    procedure MyLoadClientApp2(byLast:boolean=True);
    procedure MyLoadFotoProfile;
    procedure MyUpdateFotoProfile(oJSON:TJSONObject);
    
    procedure MyLoadConfig;
    procedure CriarAba(ClasseForm: TFormClass; Index: Integer ; ATag: Integer=-1 );
    //procedure CriarAbaBase(ClasseForm: TfrmBaseClass; ACaption: String );
    procedure DoRestore;
    procedure MySelectMenu(el:String);
    procedure MyGetBackgroundFile( AFileName: String );
    procedure ChangeStyle( AStyle : String );


  end;

var
  MainApp: TMainApp;

  Const
  TabSheetPrefix = 'scTabSheet';
  TabWidthMax = 170;
  IdleLimit = 60*90;     //1:30 Menit Idle the OffLine
  MENU_REGISTER = 100;

implementation

{$R *.dfm}

uses
  dataModul2,
  MyGDate , cr_ksp, uFunc  , LoadingSplash
  , ICSOption
  , frCustRegister, ImagMainFrm, SLIKeuangan, frCustApprov;
  //frCustRegister;


CONST
  ICS_APPMENU  = 'iss396_menu';
  ICS_REG_ID   = '301';
  ICS_REG_VER  = '1000';

function Online: boolean;
begin
  result := (InternetGetConnectedState(nil, 0));
end;

function IdleTime: DWord;
var
  LastInput: TLastInputInfo;
begin
  LastInput.cbSize := SizeOf(TLastInputInfo);
  GetLastInputInfo(LastInput);
  Result := (GetTickCount - LastInput.dwTime) DIV 1000;
end;


{ TMainApp }


procedure TMainApp.acConnectExecute(Sender: TObject);
const
   maxWidth = 150;
   maxHeight = 100;

var
  meter : integer;
  Response : string;
  lRes: IMVCRESTResponse;
  oJson: System.JSON.TJSONObject; //

begin

   if PanelMenu.Visible then
   PanelMenu.Visible := False;


    if ( btSingin.Caption = '&Login' ) then begin


        TTask.Run(procedure begin

                  TThread.Synchronize(nil, procedure
                          begin

                              lbStatusBar.Caption := 'Loading system applikasi...';
                              scActivityIndicator1.IndicatorColor := clHighlight;
                              scActivityIndicator1.Visible := True;
                              scActivityIndicator1.Active := True;

                              cxSetSplashVisibility(True,'System update...');

                          end);
                  try

                      //CodeSite.Send('T-0');

                      MyLogin;

                      Sleep(25);

                      if ICSSession.SessionID <> '' then begin

                          //CodeSite.Send('T-CheckDashboard');



                          Application.ProcessMessages;
                          CheckDashboard( 396 );

                          //CodeSite.Send('T-CheckDevCatalog');

                          Application.ProcessMessages;
                          CheckDevCatalog;

                          //CodeSite.Send('T-MetroFill');

                          if DeviceInfo.Activation then
                          FillMetro;

                          //CodeSite.Send('T-e');

                          {
                          if acActivation.Visible then

                              MyDefaultmetroFill

                          else begin



                              if MyDataUserConnection() then
                              FillMetro;


                          end;
                          }

                      end;

                  finally



                      TThread.Synchronize(nil, procedure
                                          begin

                                              lbStatusBar.Caption := '';
                                              scActivityIndicator1.IndicatorColor := clHighlight;
                                              scActivityIndicator1.Visible := False;
                                              scActivityIndicator1.Active  := False;

                                              cxSetSplashVisibility(False,'');

                                          end);

                      scPasswordEdit1.Text := '';

                      if ICSSession.SessionID <> '' then begin

                        scLoginMsg.Font.Color := clWindowText;
                        scLoginMsg.Caption := 'Login diterima';

                        btSingin.Caption := '&Logout';
                        Application.ProcessMessages;

                        AccountButton.GlyphOptions.NormalColor := clWindow; // $0050A87F;
                        AccountButton.Caption := 'Log out';


                      end else begin

                      end;
                  end;



        end).Start;

    end else begin

//
        Application.ProcessMessages;

        if
            Not IsEmptyOrNull( ICSSession.SessionID ) and
            Not IsEmptyOrNull( ICSSession.LogoutUrl ) then begin

            lRes := MainApp.ICSRestClient.Delete( ICSSession.LogoutUrl );

    //        Response := ICSMVCAppRequest( ICSSession , ICSSession.LogoutMethod , ICSSession.LogoutUrl , nil );
    //        oJSON := TJSONObject.ParseJSONValue( Response ) as TJSONObject;

            if lRes.Success then begin

            //if oJson.GetValue<string>('responseCode') = '00' then begin

                ICSSession.LogoutUrl    := '';
                ICSSession.LogoutMethod := '';
                ICSSession.SessionID    := '';

                btSingin.Caption := '&Login';
                scPasswordEdit1.Text:= '';
                scSessionID.Caption := '';

                {last: 20200214 sc v4.51}
                AccountButton.GlyphOptions.NormalColor := clGray;
                AccountButton.Caption := 'Log in';

                scSplitView1.opened := False;

                //dmHimawanFD.HimawanConnection.Connected := False;

                MyDefaultmetroFill;

                MyDeActivate;

                IdleBlock := False; //to Disable

            end;
        end;
    end;

    AdvMetroProgressBar1.Visible  := False;
    scActivityIndicator1.Active := False;
    lbStatusBar.Visible     := False;

end;

procedure TMainApp.AccountButtonClick(Sender: TObject);
begin

  PanelMenu.Visible := False;
  scSV_Config.Opened := Not scSV_Config.Opened;

end;

procedure TMainApp.acRegisterExecute(Sender: TObject);
begin
  MySelectMenu( 'acRegister' );
end;

procedure TMainApp.acSaleRecapExecute(Sender: TObject);
begin
  MySelectMenu( 'acSaleRecap' );
end;

procedure TMainApp.acShutDownExecute(Sender: TObject);
var
  i : Integer;
begin

  //CodeSite.Send('ics/close..');

  try

    //if ( dmHimawanFD.HimawanConnection.Connected ) then
    //begin

        btSingin.Caption := '&Login';
        scloginMsg.Caption := 'Welcome';

        //dmHimawanFD.fdApollodb.Active := False;

        //Test Opening Tab
        if ( scPageControl1.PageCount>0 ) then
        begin

          for i := (scPageControl1.PageCount -1) downto 0  do
            scPageControl1.Pages[i].Destroy;

        end;

    //end;
  Except
    //CodeSite.Send('ics/close except');
  end;

end;

procedure TMainApp.acSignInExecute(Sender: TObject);
begin
  scSV_Config.Open;
end;

procedure TMainApp.BorderPanelMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);

var
  P: TPoint;
  W, H, L, T: Integer;
begin
  if FMaximized and FDown then
  begin
    GetCursorPos(P);
    W := FOldBoundsRect.Width;
    H := FOldBoundsRect.Height;
    L := Round(W * (P.X - Left) / Width);
    T := P.Y - Top;
    FOldBoundsRect.Left := P.X - L;
    FOldBoundsRect.Top := P.Y - T;
    FOldBoundsRect.Right := FOldBoundsRect.Left + W;
    FOldBoundsRect.Height := FOldBoundsRect.Top + H;
    DoRestore;
  end;
end;

procedure TMainApp.ChangeStyle(AStyle: String);
begin
  TStyleManager.SetStyle( AStyle );
end;

procedure TMainApp.CheckDashboard(apikey_id: Integer);
var
  Response: IMVCRESTResponse;
  UserKey,sArr,IdApiKey,Api_RegKey : string;
  Payload, ICS_Timestamp, ICS_Signature  : String;
  oConfigRaw, lJObj, o, oJSON, oData : System.JSON.TJSONObject;
  oConfigArr, oArr, aUpdate : TJsonArray;
  MenuUpdate, iu,List,Co,n:Integer;
  ListChk : TStringList;
  aListUpd : TStringArray;

begin

  ListChk := TStringList.Create;

  ListChk.Add( 'apikey_396' );
  ListChk.Add( 'apikey_13594' );
  ListChk.Add( ICSSession.ICS_APPMENU );

  aUpdate := System.JSON.TJSONArray.Create;

  //CodeSite.Send('---<CheckDashboard Process>---');

  MenuUpdate := 0;

  try

    for List := 0 to ListChk.Count-1 do begin

      //odeSite.Send('---<'+ListChk[List]+'>---' );

      IdApiKey:= TMSAES( ListChk[List] , ICSSession.Dupa , 1 , atCBC , TRUE );

      Response := ICSMVCAppRequest( ICSSession , 'GET' , '/ics/GetConfigAppVer/'+IdApiKey , nil );

      //CodeSite.sendjson('Respon', Response.Content );

      oJSON := TJSONObject.ParseJSONValue( Response.Content ) as TJSONObject;

      //CodeSite.SendJSON('---<'+ListChk[List]+'.Response>---', Response.Content );

      if oJson.GetValue<string>('responseCode') = '00' then begin

        if Not Assigned(oJson.Get('data')) then begin

        end else begin

          sArr := oJson.GetValue<string>('data');
          sArr := TMSAES( sArr , ICSSession.Dupa , 0 , atECB );

          oConfigArr := TjsonObject.ParseJsonValue(sArr) as TJSONArray;

          //CodeSite.sendjson( '---<data>---', oConfigArr.ToString );

          if oConfigArr.Size > 0 then
          begin

            //CodeSite.send( '---<data>-1-' );

            //--------------------------------------------------------------
            AdvMetroProgressBar1.Max := oConfigArr.Size-1;
            AdvMetroProgressBar1.Visible := True;

            for Co := 0 to oConfigArr.Size-1 do
            begin

              //CodeSite.send( '---<data>-2-[' + IntToStr(Co) +']'  );

              AdvMetroProgressBar1.Position := Co;
              oConfigRaw := oConfigArr.Items[Co] as TJSONObject;

              //CodeSite.send( '---<data>-2-[' + oConfigRaw.GetValue<string>('ConfName') + ']' );

              With DM do begin

  //              If SQLiteConnection.Connected then begin
  //
  //                if FDT_ConfigApp.Active then
  //                FDT_ConfigApp.Active := False;
  //
  //                if FDT_ConfigAPI.Active then
  //                FDT_ConfigAPI.Active := False;
  //
  //                if FDT_OFFICE.Active then
  //                FDT_OFFICE.Active := False;
  //
  //              end;

                if Not FDT_ConfigApp.Active then
                FDT_ConfigApp.Active := True
                else
                begin
                  FDT_ConfigApp.Active := False;
                  FDT_ConfigApp.Active := True;
                end;

                                                                                               //   loCaseInsensitive
                if Not FDT_ConfigApp.Locate('confname', oConfigRaw.GetValue<string>('ConfName'),[loPartialKey]) then
                begin

                  //CodeSite.send('---<<QGetConfigApp>>---insert');

                  //iu := LengTh(aListUpd)+1;
                  //SetLength(aListUpd, 2, iu);
                  //aListUpd[0,iu-1] := oConfigRaw.GetValue<string>('ConfName');
                  //aListUpd[1,iu-1] := oConfigRaw.GetValue<string>('DataType');

                  o := System.JSON.TJSONObject.Create;
                  o.AddPair( 'ConfName'       , oConfigRaw.GetValue<string>('ConfName') );
                  o.AddPair( 'DataType'       , oConfigRaw.GetValue<string>('DataType'));
                  aUpdate.Add(o);


                  UpdateConfigApp( oConfigRaw.GetValue<string>('ConfName'),
                    oConfigRaw.GetValue<string>('ConfValue'),         //aValue
                    oConfigRaw.GetValue<string>('ConfDescript'),      //aCaption
                    oConfigRaw.GetValue<string>('App_Version'),       //aVersion
                    oConfigRaw.GetValue<string>('App_DateVersion'));  //aDateValue


                end else begin

//                  CodeSite.send('---<<QGetConfigApp>>---edit');
//                  CodeSite.send('qf-1'+FDT_ConfigApp.FieldByName('CONFNAME').AsString);
//                  CodeSite.send('qf-2'+' Current Ver :'+ FDT_ConfigApp.FieldByName('APP_VERSION').AsString );
//                  CodeSite.send('qf-3'+' is '+oConfigRaw.GetValue<string>('ConfName')+ ' Ver: '+
//                    oConfigRaw.GetValue<string>('App_Version' ));

                  if
                    (LowerCase(FDT_ConfigApp.FieldByName('CONFVALUE').AsString) <>
                     LowerCase(oConfigRaw.GetValue<string>('ConfValue'))) or

                    ( StrToInt( FDT_ConfigApp.FieldByName('APP_VERSION').AsString ) <
                      StrToInt( oConfigRaw.GetValue<string>('App_Version')) ) then
                  begin

//                  CodeSite.send('---<<QGetConfigApp>>---update:'+
//                    oConfigRaw.GetValue<string>('ConfName')+ ' is update to new  Ver: '+
//                    oConfigRaw.GetValue<string>('App_Version' ));

                    //iu := LengTh(aListUpd)+1;
                    //SetLength(aListUpd, 2, iu);
                    //aListUpd[0,iu-1] := oConfigRaw.GetValue<string>('ConfName');
                    //aListUpd[1,iu-1] := oConfigRaw.GetValue<string>('DataType');

                    o := System.JSON.TJSONObject.Create;
                    o.AddPair( 'ConfName'       , ListChk[List] );
                    o.AddPair( 'DataType'       , oConfigRaw.GetValue<string>('DataType'));
                    aUpdate.Add(o);

                    UpdateConfigApp(oConfigRaw.GetValue<string>('ConfName'),              //aName
                      oConfigRaw.GetValue<string>('ConfValue'),         //aValue
                      oConfigRaw.GetValue<string>('ConfDescript'),      //aCaption
                      oConfigRaw.GetValue<string>('App_Version'),       //aVersion
                      oConfigRaw.GetValue<string>('App_DateVersion'));  //aDateValue

                  end;
                end;
              end;
            end;
          end;
        end;
      end;

      //CodeSite.Send('--->'+ListChk[List]+'<---' );
    end;

  finally

    ListChk.Free;

    if aUpdate.Size >0 then begin

      for n := 0 to aUpdate.Size-1 do begin

        oConfigRaw := aUpdate.Items[n] as TJSONObject;

        //CodeSite.SendJSon ('JSON', oConfigRaw.ToString );
        //CodeSite.Send('Update['+IntToStr(n)+'] as '+ oConfigRaw.GetValue<string>('DataType'));

        //$APIKEY --------------------------------------------------------------
        if ( oConfigRaw.GetValue<string>('DataType') ='API_REFCOM' ) then begin  //last: 20221124

          Api_RegKey := StringReplace( oConfigRaw.GetValue<string>('ConfName'),'apikey_' ,'',[rfReplaceAll]);

          CheckApi_Command( Api_RegKey );

        end;

        //$APP MENU-------------------------------------------------------------

        if ( oConfigRaw.GetValue<string>('DataType') ='APP_MENU' ) then begin  //last: 20221124

          //CodeSite.Send('Update app_menu :['+oConfigRaw.GetValue<string>('ConfName')+']');

          Api_RegKey := oConfigRaw.GetValue<string>('ConfName');

          Inc(MenuUpdate);

          CheckAppMenu( Api_RegKey );

          MenuUpdate :=0;

        end;
      end;
    end;

    AdvMetroProgressBar1.Visible := False;

  end;



  //2nd Check Again
  with dm do begin

      if QGetDashItem.Active then
      QGetDashItem.Close;

      //Last: 20221223
      QGetDashItem.Prepare;
      QGetDashItem.ParamByName('reg_id').AsInteger := StrToInt( MainApp.ICSSession.ics_reg_id );
      QGetDashItem.Active := True;

      if QGetDashItem.Eof then
      Inc(MenuUpdate);

      if ICSSession.UpdateStatus>0 then
      Inc(MenuUpdate);

      if MenuUpdate>0 then
      begin
        CheckAppMenu( ICSSession.ICS_APPMENU );
        ICSSession.UpdateStatus := 0;
      end;

  end;

end;

procedure TMainApp.CheckApi_Command(apikey_id: String ; Ver_id: Integer=1 );
var
  lJObj,oRaw, oJson, oData : System.JSON.TJSONObject;
  JSonValue: TJSonValue;
  JSonString : TJSONString;
  oArr : TJsonArray;
  i:Integer;
  Payload, ICS_Timestamp, ICS_Signature  : String;
  UpdateTag : Boolean;
  sArr,IdApiKey : string;
  Response: IMVCRESTResponse;

begin

  Try

    apikey_id := StringReplace( apikey_id ,'apikey_' ,'',[rfReplaceAll]);

    IdApiKey:= TMSAES( apikey_id , ICSSession.Dupa , 1 , atCBC , TRUE );

    Response := ICSMVCAppRequest( ICSSession, 'GET' , '/ics/GetApiRegister/'+IdApiKey, nil );

    oJSON := TJSONObject.ParseJSONValue( Response.Content ) as TJSONObject;

    if oJson.GetValue<string>('responseCode') = '00' then begin

      sArr := oJson.GetValue<string>('data');

//        {$IFDEF MSWINDOWS}
//        CodeSite.Send('data:'+sArr);
//        {$ENDIF}

      sArr := TMSAES( sArr , ICSSession.Dupa ,0 ,atECB);

      // get the array
      oArr := TjsonObject.ParseJsonValue(sArr) as TJSONArray;

      if oArr.Size > 0 then
      begin

        //--------------------------------------------------------------

        //Update Available!
        AdvMetroProgressBar1.Max := oArr.Size-1;
        AdvMetroProgressBar1.Visible := True;

        for i := oArr.Size-1 Downto 0 do
        begin

          AdvMetroProgressBar1.Position := i;

          oRaw := oArr.Items[i] as TJSONObject;

//            {$IFDEF MSWINDOWS}
//            CodeSite.send( intToStr(i), oRaw.GetValue('Api_Command').Value );
//            {$ENDIF}

          DM.UpdateConfigApi(
            oRaw.GetValue<string>('Api_Id'), //aName
            oRaw.GetValue<string>('Api_Command'),  //aValue
            oRaw.GetValue<string>('Api_Value'),    //aCaption
            oRaw.GetValue<string>('Verb'),         //aVerb
            oRaw.GetValue<string>('ContentType'),  //aContentType
            oRaw.GetValue<string>('SysDinamis'),   //aVersion
            oRaw.GetValue<string>('SysHeader'),   //
            oRaw.GetValue<string>('SysBody'),     //
            oRaw.GetValue<string>('SysExternal'), //
            oRaw.GetValue<string>('ApiBody'), //
            oRaw.GetValue<string>('DateVersion'),  //aVersion
            iif( IsEmptyOrNull(oRaw.GetValue<string>('Ver_Id')),'1',
            oRaw.GetValue<string>('Ver_Id')));


//aID,
//aCommand,
//aValue,
//aVerb,
//aContentType,
//aSysDinamis,
//aSysHeader,
//aSysBody,
//aSysExternalId,
//aApiBody,
//aDateVersion,
//Ver_Id

        end;
      end;
    end;
    AdvMetroProgressBar1.Visible := False;

  Except

    on E: Exception do
    begin

//      {$IFDEF MSWINDOWS}
//      CodeSite.send('LoadApi-eRR['+E.Message+']');
//      {$ENDIF}


      ShowMessage( e.Message );

    end;
  End;

  lJObj.free;
end;

procedure TMainApp.CheckDevCatalog;
Const QUERY = 'SELECT COUNT(*) AS ITEMCOUNT FROM MENUITEMS where REG_ID = ? ';

begin

  ICSSession.UpdateStatus := 0;

  //CodeSite.Send('CheckDevCatalog');

  with DM do begin

      if Not FDT_ConfigApp.Active then
      FDT_ConfigApp.Active := True;

      if Not FDT_ConfigApp.Active then
      FDT_ConfigApp.Active := True;
                                                     //loCaseInsensitive
      if FDT_ConfigApp.Locate('confname' , 'Punggawa' ,[loPartialKey] ) then begin
        if FDT_ConfigApp.FieldByName('confvalue').AsString <> ICSSession.Punggawa then begin
          Inc(ICSSession.UpdateStatus);
        end;
      end else begin
        Inc(ICSSession.UpdateStatus);
      end;

      QuerySL.Open( QUERY , [ICS_REG_ID] );

      //CodeSite.Send( ICS_REG_ID +':'+ InttoStr(QuerySL.Fields[0].Value) );

      if QuerySL.Fields[0].Value = 0  then
      begin
         Inc(ICSSession.UpdateStatus);
      end;

      //CodeSite.Send('UpdateStatus.Count:' + IntToStr(ICSSession.UpdateStatus));

      if ICSSession.UpdateStatus>0 then begin

        //CodeSite.Send('1-CheckDevCatalog' );

        TTask.Run(procedure begin

          Sleep(25);

          //CodeSite.Send('2-CheckDevCatalog.UpdateStatus!');

          try

              //CodeSite.Send('3-CheckDevCatalog.BuildCatalog_1');
              BuildCatalog_1;
              Sleep(25);

          finally

              //CodeSite.Send('CheckDevCatalog.BuildCatalog_2');
              BuildCatalog_2;

          end;
        end).Start;
      end;

      FDT_ConfigApp.Active := False;

      if Not FDT_Office.Active then
      FDT_Office.Active := True;

      if  ( ICSSession.Office_id <> ICSSession.Office_ix )
          and ( ICSSession.Office_ix<>'' ) then begin

          if Not FDT_Office.Locate('ido' , ICSSession.Office_id ,[loPartialKey] ) then begin

            if ( MetroTaskMessageDlg(
            'Perhatian',
             scPageControl1.ActivePage.Caption +
             ' Registrasi Kantor anda tidak sama '+ICSSession.Office_ix +
             ', Mohon untuk mengkontak Admin atau HRD ',
                mtConfirmation,[mbNo],1) = mrNo )  then
             ICSSession.Office_id := ICSSession.Office_ix;

          end;
        end;

  end;

end;

procedure TMainApp.CheckLegalID;
Var
  oJSon : System.JSON.TJSONObject;
  Response : IMVCRESTResponse;
  LUpdateLogo:boolean;
  lFileExt,lOutputFileName,lOutputFullPath,lOutputFolder,lLastFileName: string;
  IdPwd, SR : String; // TStringReader;
  g:TGraphic;
  Foto : TStream;

begin

      //CodeSite.send('$MainApp/2/CheckLegalID');

      IdPwd := TMSAES( ICSSession.Office_id , ICSSession.Dupa , 1 , atOFB , TRUE );
      Response := ICSMVCAppRequest( ICSSession , 'GET', '/ics/GetLegalInfo/'+IdPwd );

      oJSON := TJSONObject.ParseJSONValue( Response.Content ) as TJSONObject;

      if Not DM.FDT_ConfigApp.Active then
      DM.FDT_ConfigApp.Active := True;

      //CodeSite.send('$MainApp/2/0');

      if DM.FDT_ConfigApp.Locate('confname', 'NamaLembaga' ,[loPartialKey]) then
      begin

        //CodeSite.send('$MainApp/2/1');

        if Assigned(oJson.Get('NamaLembaga')) then
        begin

          //CodeSite.send('$MainApp/2/1/1');
          if
          (oJson.GetValue<string>('NamaLembaga') <> DM.FDT_ConfigApp.FieldByName('confvalue').AsString) or
          (oJson.GetValue<string>('IdLegal') <> DM.FDT_ConfigApp.FieldByName('confcaption').AsString)
          then begin

            LUpdateLogo := True;

            lbLegalName.Caption := oJson.GetValue<string>('NamaLembaga');

                //aName, aValue, aCaption, aVersion, aDateValue: string);

            //CodeSite.Send('lg-2.2/IdLembaga/'+oJson.GetValue<string>('IdLegal'));

            DM.UpdateConfigApp(
                        'NamaLembaga',              //aName
                         oJson.GetValue<string>('NamaLembaga'),         //aValue
                         oJson.GetValue<string>('IdLegal'),      //aCaption
                         '1',       //aVersion
                         DateToISO8601( IncHour( Now(),-7 ) , TRUE ) );  //aDateValue

          end else begin

            //CodeSite.send('$MainApp/2/1/2');
            lbLegalName.Caption := oJson.GetValue<string>('NamaLembaga');

          end;
        end;

      end else begin

        //CodeSite.send('$MainApp/2/2');

        LUpdateLogo := True;

        if Assigned(oJson.Get('NamaLembaga')) then
        begin

          lbLegalName.Caption := oJson.GetValue<string>('NamaLembaga');

          //CodeSite.Send('lg-3/IdLembaga/'+oJson.GetValue<string>('IdLegal'));

          DM.UpdateConfigApp(
                      'NamaLembaga',              //aName
                       oJson.GetValue<string>('NamaLembaga'),         //aValue
                       oJson.GetValue<string>('IdLegal'),      //aCaption
                       '1',       //aVersion
                       DateToISO8601( IncHour( Now(),-7 ) , TRUE ) );  //aDateValue


        end;
      end;


      lOutputFullPath := TPath.Combine( TPath.GetDocumentsPath+'\ICS Profile',
        oJson.GetValue<string>('IdLegal') +'.png' );

      if Not FileExists( lOutputFullPath ) then
      LUpdateLogo := True;

      //CodeSite.Send('lg-4:'+iif(LUpdateLogo,'T','F' ) );
      //CodeSite.Send('lg-5/lOutputFullPath:['+lOutputFullPath+']');

      if LUpdateLogo then begin

        if Not Assigned(oJson.Get('Logo')) then begin
        end else begin

            SR := oJson.GetValue<string>('Logo');
            Foto := TMemoryStream.Create;
            Foto := TBytesStream.Create(DecodeBase64( SR ));

            g:=TPNGImage.Create;
            Foto.Position := 0;
            g.LoadFromStream(Foto);

            scImage1.Picture.Graphic := g;

            scImage1.Picture.SaveToFile( lOutputFullPath );

            Foto.Free;
            g.Free;
        end;
      end;
end;


procedure TMainApp.CheckFotoProfile;
CONST
RESOURCE_IMAGEEN_EXTENSIONS = '.unknown;.TIFF;.GIF;.JPEG;.PCX;.BMP;.ICO;.CUR;.PNG;.WMF;.EMF;.TGA;.PXM;.JP2;.J2K;.AVI;.WBMP;.PS; .PDF;.DCX;.RAW;.BMPRAW .WMV;.MPEG;.PSD;.IEV;.IEN;.ALL;.DICOM .HDP;.RAS;.SVG;.DDS;.HEIF;.WEBP;.WIC;.OtherDLL.MiscDLLP.USER';

Var
  oJSon,oRaw : System.JSON.TJSONObject;
  body,JSONobj  : JsonDataObjects.TJSONObject;  //MVC
  //oArr : JsonDataObjects.TJsonArray;  //MVC
  oArr : System.JSON.TJsonArray;

  Response : IMVCRESTResponse;
  GetFoto : Boolean;
  ImageEnView : TImageEnView;
  m : TStream;
  ms :TMemoryStream;

  lFileTest,lFileExt,lOutputFileName,lOutputFullPath,lOutputFolder,lLastFileName: string;
  AList :  TStringList;

  sArr,IdPwd, SR : String; // TStringReader;


  g:TGraphic;
  Foto : TStream;
  Size,Size2 : Longint;
  f: file of Byte;

begin

    AList := TStringList.Create;
    AList.Delimiter := ';';
    AList.DelimitedText := RESOURCE_IMAGEEN_EXTENSIONS;

    body := JsonDataObjects.TJsonObject.Create;  //MVC
    body.S['version'] := '1000';
    body.S['reg_id' ] := '300';

    //CodeSite.Send('+LoginName:'+ ICSSession.LoginName );

    IdPwd := TMSAES( ICSSession.LoginName , ICSSession.Dupa , 1 , atCBC , TRUE );

    OJSon := TJSONObject.ParseJSONValue( body.toString ) as System.JSON.TJSONObject;

    Response := ICSMVCAppRequest( ICSSession , 'POST', '/ics/GetProfile/'+IdPwd , OJson  );

    //CodeSite.Send('g-1:'+Response.Content);
    JSONobj := Response.ToJSONObject; //MVC
    if JSONobj.S['responseCode'] = '00' then begin

    //oJSON := TJSONObject.ParseJSONValue( Response.Content ) as TJSONObject;  //Basic
    //if oJson.GetValue<string>('responseCode') = '00' then begin

      //Codesite.Send('Login-Ok');
      sArr := TMSAES( JSONobj.S['3W9andan6a'] , ICSSession.Dupa ,0 , atOFB );

      //oJson.GetValue<string>('3W9andan6a');

      // get the array
      //oArr := StrToJSONArray(sArr);
      oArr := System.JSON.TjsonObject.ParseJsonValue(sArr) as TJSONArray;
      if oArr.Size > 0 then
      begin

        //Codesite.Send('Login-Ok/1');

        oRaw := oArr.Items[0] as TJSONObject;

        ICSSession.Punggawa  :='';

        if Assigned( oRaw.Get('groupname')) then
          ICSSession.Punggawa:= oRaw.GetValue<string>('groupname');

        ICSSession.UserName  := '';
        if Assigned( oRaw.Get('full_name')) then
          ICSSession.UserName:= oRaw.GetValue<string>('full_name');

        //CodeSite.Send('+UserName:'+ ICSSession.UserName );

        ICSSession.Office_ix  := '';
        if Assigned( oRaw.Get('office_id')) then
          ICSSession.Office_ix:= oRaw.GetValue<string>('office_id');

        if Assigned( oRaw.Get('groupid')) then
        ICSSession.GroupID  := StrToInt(oRaw.GetValue<string>('groupid'));

        lbFullName.Caption       := ICSSession.UserName;
        btAccountProfile.Caption := ICSSession.UserName;
        lbJob.Caption            := ICSSession.Punggawa;    // FDQuery1.FieldByName('GROUPNAME').AsString;
        lbInfo.Caption           := 'Id Kantor '+ ICSSession.Office_id; //  FDQuery1.FieldByName('IDWIL').AsString;

        msCurrentUser    := ICSSession.UserName;
        msCurrentIDUser  := ICSSession.LoginName;
        msPasswordUser   := scPasswordEdit1.Text;

        //Codesite.Send('Login-Is Ok/2');


        if Not DM.FDT_ConfigApp.Active then
        DM.FDT_ConfigApp.Active := True;

        //Codesite.Send('check Foto User');

        DM.UpdateConfigUser( 'employee' , ICSSession.LoginName );

        //Codesite.Send('cfu/1');

        GetFoto := False;
        //check Foto User Account ----------------------------------------------

        //if (GetFoto=False) then begin

          Try

            //Codesite.Send('cfu/2');
            if Not IsEmptyOrNull(scFoto.Picture.Graphic.Empty) then
            //if  ( Not scFoto.Picture.Graphic.Empty ) then
            begin
              //Codesite.Send('Foto Ok');
              GetFoto := False;

            end else
            begin

              //Codesite.Send('Foto mush update...');

              GetFoto := True;

            end;
          Except
            //Codesite.Send('Login-Foto/err');
            GetFoto := True;

          End;

        //end;

        //CodeSite.Send('GetFoto:'+iif(GetFoto,'T','F'));

        if Not GetFoto then begin

          //CodeSite.Send('GetFoto/1');

          if Assigned( oRaw.Get('FotoSize')) then
          Size := StrToInt(oRaw.GetValue<string>('FotoSize'));


          lFileExt        := '.profile';
          lLastFileName   := '';

          //CodeSite.Send('GetFoto/1/1');

          DM.FDT_ConfigApp.Active := True;

          if DM.FDT_ConfigApp.Locate('confname', 'employee' ,[loPartialKey]) then
          begin

            //CodeSite.Send('GetFoto/1/2');
            if Not IsEmptyOrNull(DM.FDT_ConfigApp.FieldByName('confcaption').AsString) then begin

              lLastFileName := DM.FDT_ConfigApp.FieldByName('confcaption').AsString;
              lLastFileName := StringReplace( lLastFileName , lFileExt ,'',[rfReplaceAll]);
              lFileExt      := TPath.GetExtension( lLastFileName );

              //CodeSite.Send('GetFoto/1/3');
            end;
          end;

          //CodeSite.Send('GetFoto/2');

          if Assigned( oRaw.Get('FotoFile')) then begin

            lOutputFileName := oRaw.GetValue<string>('FotoFile');
            lFileExt        := TPath.GetExtension( lOutputFileName );

            lOutputFolder   := TPath.Combine( TPath.GetDocumentsPath , 'ICS Profile');
            lOutputFullPath := TPath.Combine( lOutputFolder , lOutputFileName);
            lFileTest       := StringReplace( lOutputFullPath , lFileExt ,'',[rfReplaceAll]);

            if (lFileTest=lLastFileName) then begin

              //Codesite.Send('Foto File/<'+lOutputFullPath +'>');

              if FileExists( lOutputFullPath ) then begin

                //Codesite.Send('Foto File/<'+lOutputFullPath+'>/Found');

                size2 := 0;

                begin

                  try

                    AssignFile(f, lOutputFullPath );
                    Reset(f);
                    size2 := FileSize(f);

                  finally
                    CloseFile(f);
                  end;
                end;

                //Codesite.Send('Size Server Vs Local Size /'+ IntToStr(size) + '/'+IntToStr(size2) );

                GetFoto := Size <> Size2;

              end else begin
                //Codesite.Send('Foto File/<'+lOutputFullPath+'>/Not Found');
                GetFoto := True;
              end;

              DM.FDT_ConfigApp.Active := False;

            end else GetFoto := True;
          end;
        end else
        
        //if GetFoto then
        begin

          //Codesite.Send('Get Foto is :' + iif( GetFoto,'[T]','[F]'));

          //IdPwd := TMSAES( ICSSession.Office_id , ICSSession.Dupa , 1 , atOFB , TRUE );

          //CodeSite.Send('Get image/0:'+'/ics/images/employee/'+ICSSession.LoginName);

          Response := ICSMVCAppRequest( ICSSession , 'GET', '/ics/images/employee/'+ICSSession.LoginName );
          //Response := ICSMVCAppRequest( ICSSession , 'GET', '/ics/Photo/employee/'+ICSSession.LoginName );

          if Response.StatusCode=200  then begin //berhasil di response Ada data
            //{Delphi XE10

            try

              //CodeSite.send('i/1');

              m  := TStringStream.Create();

              Response.SaveContentToStream(m);
              m.Position:= 0;

              ImageEnView := TImageEnView.Create(nil);
              ImageEnView.IO.LoadFromStream(m,ioUnknown);
              ImageEnView.Update;

              ms := TMemoryStream.Create;
              ms.Size := ImageEnView.Proc.ReadHiddenData(nil, 0);

              lFileExt := AList[ ImageEnView.IO.Params.FileType ];

              ImageEnView.IO.SaveToStream(ms,ImageEnView.IO.Params.FileType);

              //CodeSite.send('i/2:'+lFileExt);
              ms.Position:= 0;

              if lFileExt='.JPEG' then
              g:=TJPEGImage.Create;

              if lFileExt='.PNG' then
              g:=TPNGImage.Create;

              if lFileExt='.BMP' then
              g:=TBitmap.Create;

              //CodeSite.send('i/2/1');
              g.LoadFromStream(ms);

              //CodeSite.send('i/2/2');
              scFoto.Picture.Graphic := g;
              //CodeSite.send('i/2/3');

              if Not FileExists( ExtractFilePath(Application.ExeName) + ICSSession.LoginName+lFileExt ) then
              begin

                if Not DirectoryExists( TPath.GetDocumentsPath+'\ICS Profile' ) then
                ForceDirectories( TPath.GetDocumentsPath+'\ICS Profile' );

              end;

              //CodeSite.send('i/3/'+TPath.Combine( TPath.GetDocumentsPath+'\ICS Profile', ICSSession.LoginName+'.profile' ));

              ImageEnView.IO.SaveToFile(
                 TPath.Combine( TPath.GetDocumentsPath+'\ICS Profile', ICSSession.LoginName+'.profile' ));

              if Not DM.FDT_ConfigApp.Active then
              DM.FDT_ConfigApp.Active := True;

              if DM.FDT_ConfigApp.Locate('confname', 'employee' ,[loPartialKey]) then
              begin

                DM.UpdateConfigApp(
                  'employee',              //aName
                   ICSSession.LoginName,         //aValue
                   ICSSession.LoginName+'.profile',      //aCaption
                   '1',       //aVersion
                   DateToISO8601( IncHour( Now(),-7 ) , TRUE ) );  //aDateValue

                //CodeSite.send('i/4');

              end;

              DM.FDT_ConfigApp.Active := False;

              {
              ImageEn1.IO.LoadFromStream(ms,ImageEnView.IO.Params.FileType);  //
              ImageEn1.Update;
              ImageEn1.Fit();
              ImageEn1.CenterImage();
              }


            finally

              FreeAndNil(m);
              FreeAndNil(ms);
              ImageEnView.Free;
              //CodeSite.send('i/6');
              g.Free;

            end;
          end;
        end;
      end;
    end;
end;

procedure TMainApp.CheckRegistration;
var
  scgpsn : String;
  Response: IMVCRESTResponse;
  oJson : System.JSON.TJSONObject;

begin


//    CodeSite.Send('CheckRegistration:'+ICSSession.HostName );
//    CodeSite.Send('/ics/DeviceStatus/'+ DeviceInfo.MacAddress );
//    CodeSite.Send('dUPA:'+ICSSession.Dupa );
//    CodeSite.Send( '-0');

    scgpsn :=  TMSAES( DeviceInfo.MacAddress , ICSSession.Dupa ,1 , atOFB , TRUE );

    //CodeSite.Send( '-1./ics/DeviceStatus/'+ scgpsn );

    try

      Response := ICSMVCAppRequest( ICSSession , 'GET', '/ics/DeviceStatus/'+ scgpsn  );

      //Response := ICSAppRequest( ICSSession , 'GET', '/ics/DeviceStatus/'+ scgpsn );

      if Response.StatusCode=200 then
      begin

        //CodeSite.Send( '-2.Response:' + Response.Content );

        oJson := TjsonObject.ParseJsonValue(Response.Content) as TJsonObject;
        if oJson.GetValue<string>('responseCode') = '00' then
        begin
          DeviceInfo.Activation  := (oJson.GetValue<string>('status') = '1');

        end;
      end;

    Except
      on E: Exception do begin

        DeviceInfo.Activation  := False;
        ShowMessage( e.Message );
        //CodeSite.Send('DeviceStatus/err');
      end;
    end;
end;

procedure TMainApp.CheckAppMenu(apikey_id: String ; Ver_id: Integer=1 );
var
  Response: IMVCRESTResponse;
  paramJSON,oRaw,oJson: TJSONObject;  //System.JSON.TJSONObject; //
  oHeadArr,oItemArr : TJsonArray;
  sArr : String;
  m,i,n:Integer;

begin

   //Load Catalog Office List ID ------------------------------------------------

    //CodeSite.Send('$BuildCatalog_2');

    if ( MainApp.ICSSession.SessionID = '' ) then
    exit;

    try

        //CodeSite.Send('$BuildCatalog_2.do...');

        paramJSON := System.JSON.TJSONObject.Create;

        with paramJSON do
        begin
          AddPair('VERSION' , ICS_REG_VER );
          AddPair('REG_ID'  , ICS_REG_ID  );
          AddPair('USERNAME', ICSSession.LoginName );
        end;

        //UserKey := TMSAES( ICSSession.LoginName , ICSSession.Dupa , 1 , atCBC , TRUE );  //last: 20221001 from atOFB
        //Response := ICSMVCAppRequest( ICSSession , 'POST', '/ics/loadMenuReg/'+ UserKey , paramJSON  );

        Response := ICSMVCRESTRequest( ICSSession , 'ICS_APPMENU' , paramJSON  );

        oJSON := TJSONObject.ParseJSONValue( Response.Content ) as TJSONObject;

        if oJSON.GetValue<string>('responseCode') = '00' then begin

            //Clear Menu Data
            With DM do
            begin

              if FDT_MenuItem.Active then
              FDT_MenuItem.Active := False;

              if FDT_Dashboard.Active then
              FDT_Dashboard.Active := False;

              if FDT_MenuItem.RecordCount>0 then
              MenuItem_Vacum.ExecSQL;

              FDT_MenuItem.Active  := True;
              FDT_Dashboard.Active := True;

            end;

            //Home-Dashboard Menu

            sArr := oJSON.GetValue<string>('data');
            sArr := TMSAES( sArr , ICSSession.Dupa ,0 ,atOFB);
            oItemArr := TjsonObject.ParseJsonValue(sArr) as TJSONArray;

            oHeadArr := oJSON.Get('home').JsonValue as TJSONArray;
            AdvMetroProgressBar1.Max := oHeadArr.Size+oItemArr.Size;
            AdvMetroProgressBar1.Visible := True;

            m := 0;

            if oHeadArr.Size > 0 then
            begin

                //--------------------------------------------------------------
                //Update Available!
                //DashbMenu.Items.Clear;

                for n := oHeadArr.Size-1 Downto 0 do
                begin

                   Inc(m);
                   AdvMetroProgressBar1.Position := m;

                   oRaw := oHeadArr.Items[n] as TJSONObject;

          //                          QGetDashItem.Prepare;
          //                          QGetDashItem.ParamByName('REG_ID').AsInteger := StrToInt( oRaw.GetValue('Reg_Id').Value );
          //                          QGetDashItem.ParamByName('GROUPINDEX').AsInteger := StrToInt( oRaw.GetValue('GroupIndex').Value );
          //                          QGetDashItem.Open;

                    If Not DM.FDT_Dashboard.Locate('REG_ID;GROUPINDEX',
                      VarArrayOf([
                        StrToInt( oRaw.GetValue('Reg_Id').Value ) ,
                        StrToInt( oRaw.GetValue('GroupIndex').Value)]),
                      [loPartialKey]) then begin

                      DM.FDT_Dashboard.Insert;
                      DM.FDT_Dashboard.FieldByName('Reg_Id').AsString      := oRaw.GetValue('Reg_Id').Value;
                      DM.FDT_Dashboard.FieldByName('GroupIndex').AsString  := oRaw.GetValue('GroupIndex').Value;
                    end else DM.FDT_Dashboard.Edit;

                    DM.FDT_Dashboard.FieldByName('Title').AsString       := oRaw.GetValue('Title').Value;
                    DM.FDT_Dashboard.FieldByName('ImageIndex').AsInteger := StrToInt(oRaw.GetValue('ImageIndex').Value);
                    DM.FDT_Dashboard.FieldByName('ApiKey').AsString      := oRaw.GetValue('ApiKey').Value;
                    DM.FDT_Dashboard.Post;

                end;
            end;

            //Chile :Menu-Detail

            if oItemArr.Size > 0 then
            begin

                for n := oItemArr.Size-1 Downto 0 do
                begin

                   Inc(m);
                   AdvMetroProgressBar1.Position := m;

                  oRaw := oItemArr.Items[n] as TJSONObject;

                  If Not DM.FDT_MenuItem.Locate('REG_ID;ITEM_TAG',
                    VarArrayOf([
                      StrToInt( oRaw.GetValue('Reg_Id').Value ) ,
                      StrToInt( oRaw.GetValue('Item_tag').Value)]),
                    [loPartialKey]) then begin

//                                      CodeSite.Send( '3.2.Insert Index:'+
//                                      oRaw.GetValue('GroupIndex').Value+'-'+
//                                      oRaw.GetValue('Reg_Id').Value+'-'+
//                                      oRaw.GetValue('Item_tag').Value
//                                       );

                    DM.FDT_MenuItem.Insert;

                    DM.FDT_MenuItem.FieldByName('Reg_Id').AsInteger     := StrToInt( oRaw.GetValue('Reg_Id').Value );
                    DM.FDT_MenuItem.FieldByName('Item_tag').AsInteger   := StrToInt( oRaw.GetValue('Item_tag').Value );

                  end else begin

          //                            CodeSite.Send( '3.2.Edit Index:'+
          //                            oRaw.GetValue('GroupIndex').Value+'-'+
          //                            oRaw.GetValue('Reg_Id').Value+'-'+
          //                            oRaw.GetValue('Item_tag').Value
          //                             );

                    DM.FDT_MenuItem.Edit;
                  end;

                  DM.FDT_MenuItem.FieldByName('GroupIndex').AsInteger := StrToInt(oRaw.GetValue('GroupIndex').Value);

                  DM.FDT_MenuItem.FieldByName('Title1').AsString      := oRaw.GetValue('Title1').Value;
                  DM.FDT_MenuItem.FieldByName('Item_Class').AsString  := oRaw.GetValue('Item_Class').Value;
                  DM.FDT_MenuItem.FieldByName('ApiKey_id').AsString   := oRaw.GetValue('ApiKey_id').Value;  //Last: 20220908
                  DM.FDT_MenuItem.FieldByName('Api_Command').AsString := oRaw.GetValue('Api_Command').Value;  //Last: 20220912
                  DM.FDT_MenuItem.FieldByName('ImageIndex').AsInteger := StrToInt(oRaw.GetValue('ImageIndex').Value);

                  DM.FDT_MenuItem.FieldByName('GroupHeader').AsString := oRaw.GetValue('GroupHeader').Value;
                  DM.FDT_MenuItem.FieldByName('MenuCategory').AsString := oRaw.GetValue('MenuCategory').Value;

          //last : 20221004
                                    DM.FDT_MenuItem.FieldByName('tile1_color').AsString := oRaw.GetValue( 'tile1_color'  ).Value;
          //                          DM.FDT_MenuItem.FieldByName('tile1_aling').AsString := oRaw.GetValue( 'tile1_aling'  ).Value;
                                    DM.FDT_MenuItem.FieldByName('tile1_fontsize').AsString :=oRaw.GetValue( 'tile1_fontsize'  ).Value;
          //                          DM.FDT_MenuItem.FieldByName('tile1_identhorz').AsString := oRaw.GetValue( 'tile1_identhorz'  ).Value;
          //                          DM.FDT_MenuItem.FieldByName('tile1_identvert').AsString := oRaw.GetValue( 'tile1_identvert'  ).Value;

                                    DM.FDT_MenuItem.FieldByName('title2').AsString          := oRaw.GetValue( 'title2'  ).Value;
                                    DM.FDT_MenuItem.FieldByName('tile2_color').AsString     := oRaw.GetValue( 'tile2_color'  ).Value;
          //                          DM.FDT_MenuItem.FieldByName('tile2_aling').AsString     := oRaw.GetValue( 'tile2_aling'  ).Value;
                                    DM.FDT_MenuItem.FieldByName('tile2_fontsize').AsString  := oRaw.GetValue( 'tile2_fontsize'  ).Value;
          //                          DM.FDT_MenuItem.FieldByName('tile2_identhorz').AsString := oRaw.GetValue( 'tile2_identhorz'  ).Value;
          //                          DM.FDT_MenuItem.FieldByName('tile2_identvert').AsString := oRaw.GetValue( 'tile2_identvert'  ).Value;

                  DM.FDT_MenuItem.FieldByName('tile_size').AsString := oRaw.GetValue( 'tile_size'  ).Value;
                  DM.FDT_MenuItem.FieldByName('tile_border').AsString := oRaw.GetValue( 'tile_border'  ).Value;
                  DM.FDT_MenuItem.FieldByName('tile_begincolor').AsString := oRaw.GetValue( 'tile_begincolor'  ).Value;
                  DM.FDT_MenuItem.FieldByName('tile_endcolor').AsString := oRaw.GetValue( 'tile_endcolor'  ).Value;


                  DM.FDT_MenuItem.Post;

              end;
          end;
      end;
  Except

  end;

  AdvMetroProgressBar1.Visible := False;

end;



procedure TMainApp.CloseButtonClick(Sender: TObject);
begin
  Close;
end;

procedure TMainApp.clWebUpdateDownloadProgress(Sender: TObject;
  UpdateNo: Integer; Downloaded, Total: Int64);
begin

  lbStatusBar.Caption:= Format('Downloading %d update: %d %% completed...', [UpdateNo + 1, Downloaded * 100 div Total]);
  AdvMetroProgressBar1.Max := Downloaded * 100 div Total;
  AdvMetroProgressBar1.Position := UpdateNo + 1;

  if Not AdvMetroProgressBar1.Visible then
  AdvMetroProgressBar1.Visible := true;


end;

procedure TMainApp.clWebUpdateNoUpdatesFound(Sender: TObject);
begin
  lbStatusBar.Caption:= 'There are no new updates available.';
end;

procedure TMainApp.clWebUpdateProcessCompleted(Sender: TObject);
Var
  FileWallPaper : String;

begin
  inherited;

  FileWallPaper := ExtractFilePath(Application.ExeName)+'walpaper_1.jpg';

  if FileExists(FileWallPaper) then
  begin

    scImageCollection1.Images[1].Picture := Nil;
    scImageCollection1.Images[1].Picture.LoadFromFile(FileWallPaper);

    BorderPanel.CustomImageIndex := 1;
    BorderPanel.CustomImages := scImageCollection1;
    BorderPanel.Update;

  end;

  AdvMetroProgressBar1.Visible := False;

end;

procedure TMainApp.clWebUpdateRunUpdate(Sender: TObject;
  AUpdateScript: TStrings; ANeedTerminate: Boolean; var CanRun: Boolean;
  var Result: TclRunUpdateResult; var AErrors: string);
begin
  if ANeedTerminate then
  begin
    //AddUpdateScript(AUpdateScript.Text);
    CanRun := False;
  end;
end;

procedure TMainApp.clWebUpdateTerminating(Sender: TObject;
  var CanTerminate: Boolean);
begin
  CanTerminate := (MessageDlg('Untuk menerapkan pembaruan, Anda perlu menutup aplikasi. Apakah Anda ingin menutup App ?',
    mtConfirmation, [mbYes, mbNo], 0) = mrYes);
end;

procedure TMainApp.CriarAba(ClasseForm: TFormClass; Index: Integer ; ATag: Integer=-1 );
var
  Form,F: TForm;
  iAct,i,TabWidthMin:integer;
  TabSheet: TscTabSheet;
  Aba: TTabSheet;
  //meter,
  fcAda,tabAda : boolean;

begin

  //----------------------------------------------------------------------------

  if Not scPageControl1.Visible then
  begin

    SendMessage(Handle, WM_SETREDRAW, WPARAM(False), 0);

    scPageControl1.Visible := True;
    scPageControl1.BringToFront;

    //scLabelApp.BringToFront;
    CloseButton.BringToFront;
    MaxButton.BringToFront;
    MinButton.BringToFront;
    AccountButton.BringToFront;
    StartButton.BringToFront;

    SendMessage(Handle, WM_SETREDRAW, WPARAM(True), 0);

  end;


  tabAda := False;
  //meter  := 0;

  try

    Screen.Cursor := crHourglass;

    DisableAlign;

    Application.ProcessMessages;

    //CodeSite.Send('Total Page:' + IntToStr(scPageControl1.PageCount));

    if (scPageControl1.PageCount>-1) then
    begin

      BorderPanel.WallpaperIndex := -1;
      BorderPanel.Update;
      BorderPanel.Repaint;

      Application.ProcessMessages;

      for i := 0 to scPageControl1.PageCount - 1 do
      begin

        AdvMetroProgressBar1.Position := i;
        if (scPageControl1.Pages[I].Name = TabSheetPrefix + ClasseForm.ClassName) then
        begin

          Aba := scPageControl1.Pages[i];
          scPageControl1.ActivePage := Aba;

          tabAda := True;

          //CodeSite.Send('ics/1/'+TabSheetPrefix + ClasseForm.ClassName+'=ada');

          //Aba.Update;
          scPageControl1.UpDateTabs;
          scPageControl1.ActivePage.Repaint;

          //Aba.PageControl.Repaint;
          //Aba.Refresh;


          //Aba.Repaint;
          //upg 20190526 - to disable, becouse will 2 show Time affect
          //Aba.Show;

          //EnableAlign;

          //CodeSite.Send('ics/1/Break');

          Break;

        end;
      end;
    end;

    if Not tabAda then
    begin

      //CodeSite.send('[Create New Form within Tab Class');
      Application.ProcessMessages;

      {
      if ( ClasseForm = TfrmVirtualAcc ) then begin

        TabSheet := TscTabSheet.Create(scPageControl1);
        Form := TfrmVirtualAcc.Create(TabSheet);

        TabSheet.PageControl:= scPageControl1;
        TabSheet.Caption    := Form.Caption;
        TabSheet.Name       := TabSheetPrefix + Form.ClassName;
        TabSheet.ImageIndex := Index;

        //TabSheet.StyleKind  := sctsFormBackground;

        Form.Align := alClient;
        Form.Position := poMainFormCenter;
        Form.BorderStyle := bsNone;
        Form.Parent := TabSheet;


      end else begin
      }

        TabSheet := TscTabSheet.Create(scPageControl1);
        Form := ClasseForm.Create(TabSheet);

        TabSheet.PageControl:= scPageControl1;
        TabSheet.Caption    := Form.Caption;
        TabSheet.Name       := TabSheetPrefix + Form.ClassName;
        TabSheet.ImageIndex := Index;

        //TabSheet.StyleKind  := sctsFormBackground;

        Form.Align := alClient;
        Form.Position := poMainFormCenter;
        Form.BorderStyle := bsNone;
        Form.Parent := TabSheet;

        //Form.Tag := ATag; //frmVirtualAcc.FInitialVA_ID;

        //Form.Show;

    end;


    TabWidthMin := (ClientWidth-(200+170)) div scPageControl1.PageCount ;
    scPageControl1.TabWidth := min( TabWidthMax , TabWidthMin );

    if scPageControl1.PageCount > -1 then
    begin

      for i := 0 to scPageControl1.PageCount - 1 do
      begin

        //Inc(meter);
        //AdvMetroProgressBar1.Position := i;

        {
        if (scPageControl1.Pages[i].Name = 'Wallpaper' ) then
        begin

          CodeSite.Send('Delete Wallpaper');
          scPageControl1.Pages[i].Destroy;
          AdvMetroProgressBar1.Max := AdvMetroProgressBar1.Position;
          AdvMetroProgressBar1.Update;
          Break;
        end;
        }

        Application.ProcessMessages;

        if (scPageControl1.Pages[i].Name = TabSheetPrefix +
           ClasseForm.ClassName) then
        begin

          //CodeSite.Send('ics/1/TabSheet.Show');
          if Not tabAda then
          begin

            //CodeSite.send('ics/1/Refresh  :['+ TabSheetPrefix + ClasseForm.ClassName+']' );

            DisableAlign;

            scPageControl1.ActivePage := TabSheet;
            //scPageControl1.ReDrawTabs;

            if i>0 then
            scPageControl1.ActivePageIndex := i-1;

            scPageControl1.ActivePage := TabSheet;

            //CodeSite.send('['+ TabSheetPrefix + ClasseForm.ClassName+'].FormShow');

            Form.Show;

            //CodeSite.send('After FormShow, then Take Selection suspen or normal for TAction' );

            //Suspend or normal TAction Component for formActive and deActive
            MyActionSelected(fcAda);

            EnableAlign;


          end;

          //CodeSite.Send('ics/1/TabSheet.Activate/Breake');

          Break;

        end;
      end;
    end
    else
    begin

      scPageControl1.Pages[0].Invalidate;
      scPageControl1.Pages[0].Realign;
      TabSheet.Repaint;

    end;

  finally

    //scPageControl1.Update;

    EnableAlign;

    Screen.Cursor := crDefault;
    //AdvMetroProgressBar1.Position := AdvMetroProgressBar1.Max;

    AdvMetroProgressBar1.Visible := False;
    AdvMetroProgressBar1.Position := 0;

  end;
end;



//function TMainApp.doHttpRequest(const AMethod, AResource: string;
//   ARequestBody: TStream): string;

function TMainApp.doHttpRequest(const AMethod, AResource: string;
    ARequestBody: string = ''): string;
   //AHeaders: TStrings;
var
  LURL, LName: string;
  LHeader: TNetHeader;
  LHeaders: TNetHeaders;
  LResponse: IHTTPResponse;
  LIndex: Integer;

  AHouse: String;
begin

//  CodeSite.Send('NC-0');
//  CodeSite.Send('NC-1/'+MainApp.ICSSession.HostName);
//  CodeSite.Send('NC-2/'+IntToStr(MainApp.ICSSession.PortNo));

  AHouse:=  MainApp.ICSSession.HostName+':'+IntToStr(MainApp.ICSSession.PortNo);

//  CodeSite.Send('NC-3/'+ AHouse );

  LURL := TPath.Combine( AHouse, AResource );

//  CodeSite.Send('NC-4/'+ LURL );

//  for LIndex := 0 to AHeaders.Count - 1 do
//  begin
    //LName := AHeaders.Names[LIndex];
    LHeader := TNetHeader.Create( 'ICS-Signature', 'ICS-396');
    LHeader := TNetHeader.Create( 'ICS-Timestamp', DateToISO8601( IncHour( Now(),-7 ) , TRUE ));
    LHeaders := LHeaders + [LHeader];
//  end;


//  CodeSite.Send('NC-5/'+AMethod);

//  CodeSite.Send('NC-6/'+ARequestBody);

  if AMethod = sHTTPMethodGet then
    LResponse := httpRequest.Get(LURL, nil, LHeaders)

  else if AMethod = sHTTPMethodPost then begin

//    CodeSite.Send('NC-6/1');

    LResponse := httpRequest.Post(LURL, ARequestBody, nil, LHeaders);

//    CodeSite.Send('NC-6/2');

  end;

//  CodeSite.Send('NC-6/3');

  Result := LResponse.ContentAsString();

//  CodeSite.Send('NC-7');
//  CodeSite.Send('NC-8/Response/'+Result);
//  CodeSite.Send('Operation done......');

end;

procedure TMainApp.DoRestore;
begin
BoundsRect :=  FOldBoundsRect;
  FMaximized := False;
  //scLabelApp.DragForm := True;
  MaxButton.GlyphOptions.Kind := scgpbgkMaximize;

  scGPSizeBox1.Visible := True; //scShowSizeBox.Checked;

  {
  CloseButton.Left  := MaxButton.Left-1;  // ClientWidth-(CloseButton.Width+1);
  MaxButton.Left    := CloseButton.Left-MaxButton.Width;
  MinButton.Left    := MaxButton.Left-MinButton.Width;
  }

  AccountButton.Left:= MinButton.Left-AccountButton.Width;
end;

procedure TMainApp.dxTileControl1Click(Sender: TObject);
var
  AHitTest: TdxTileControlHitTest;
  ItemProject : Integer;
  ClassForm: String;
begin

  AHitTest := TdxTileControl(Sender).ActiveHitTest;

//  CodeSite.Send('Click eTile');

  Try

    if Assigned(AHitTest.Item) then
    begin

      ClassForm := AHitTest.Item.DetailOptions.Caption;

      //CodeSite.Send('ClassForm:'+ClassForm);

      if (ClassForm<>'') then
      MySelectMenu( ClassForm );

      StartButton.BringToFront;
      StartButtonClick(nil);

      {
      ItemProject := AHitTest.Item.Tag;
      case ItemProject of

        1 : MySelectMenu( 'acRegister' ); //acF3SignIn.Execute; //SignIn
        2 : MySelectMenu( 'acWorkShift' );
        3 : MySelectMenu( 'acCataBarang' );
        4 : MySelectMenu( 'acLabeling' );
        5 : MySelectMenu( 'PurchaseOrder' );
        6 : MySelectMenu( 'acStockTrack' );
        7 : MySelectMenu( 'acSaleRecap' );
      end;
      }

    end;
    //
  except

  End;
end;

procedure TMainApp.FillMetro;
var
  Index,meter,ix,i,iGroup,rItem,mLeft,mWidth: integer;
  iMetroName : string;
  V1, V2, V3, V4: word;
  //StringList :  TStringList;
  bLocate : boolean;

  iGate,iMaxItem : Integer;

  dxTileControl1Groups : TdxTileControlGroup;

  j: Integer;

begin

    scSV_Config.Opened  := False;

    meter := AdvMetroProgressBar1.Position;

    scListMenu.Items.Clear;

    iMetroName :=  'htMetro_'+IntToStr(iGroup);

    //CodeSite.Send('M-0');

    //last: 20210410

    if Not DM.SQLiteConnection.Connected then
      DM.SQLiteConnection.Connected := True;

    //CodeSite.Send('M-1:' + iif(DM.SQLiteConnection.Connected,'connected','NoSQL') );

  try

    with DM do
    begin

      //CodeSite.Send('M-1.1:['+ICS_REG_ID + ']');

      if QGetDashItem.Active then
      QGetDashItem.Close;

      QGetDashItem.Prepare;
      QGetDashItem.ParamByName('reg_id').AsInteger := StrToInt( ICS_REG_ID );
      QGetDashItem.Active := True;

      //CodeSite.Send('M-2:'+iif(QGetDashItem.Eof,'False','Ok'));

      if Not QGetDashItem.Eof then
      begin

        //CodeSite.Send('M-3');

        while Not QGetDashItem.Eof do begin

//          CodeSite.Send(IntToStr(QGetDashItem.FieldByName('groupindex').AsInteger)+'.'+
//                QGetDashItem.FieldByName('title').AsString );

          with scListMenu.Items.Add do
          begin

            Header     := True;
            Caption    := QGetDashItem.FieldByName('title').AsString;
            Enabled    := True;
            Title      := '';
            //ImageIndex :=  Login_Master.FieldByName('image_idx').AsInteger;

          end;

          if QMenuActive.Active then
          QMenuActive.Close;

          QMenuActive.Prepare;
          QMenuActive.ParamByName('reg_id').AsInteger := StrToInt( ICS_REG_ID );
          QMenuActive.ParamByName('groupindex').AsInteger := QGetDashItem.FieldByName('groupindex').AsInteger;
          QMenuActive.Open;

          Application.ProcessMessages;

          //CodeSite.Send('M.4:'+iif(QMenuActive.Eof,'False','Ok'));

          while Not QMenuActive.eof do
          begin

            with scListMenu.Items.Add do
            begin

              Header  := False;
              Caption := QMenuActive.FieldByName('Title1').AsString;
              Detail  := QMenuActive.FieldByName('Title2').AsString;
              Enabled := True;
              Title   := QMenuActive.FieldByName('ITEM_CLASS').AsString;

              if Not IsEmptyOrNull( QMenuActive.FieldByName('APIKEY_ID').AsString ) then begin

                Button.Caption := QMenuActive.FieldByName('APIKEY_ID').AsString ;

                //CodeSite.Send( 'info api:'+QMenuActive.FieldByName('APIKEY_ID').AsString );

              end;

              ImageIndex := -1;
              if Not IsEmptyOrNull( QMenuActive.FieldByName('imageindex').AsInteger ) then
              if QMenuActive.FieldByName('imageindex').AsInteger>-1 then
              ImageIndex := QMenuActive.FieldByName('imageindex').AsInteger;

              //CodeSite.Send( 'M-5:'+QMenuActive.FieldByName('ITEM_CLASS').AsString );

            end;

            QMenuActive.Next;
          end;

          QGetDashItem.Next;
        end;


            with scListMenu.Items.Add do
            begin

              Header  := False;
              Caption := 'Image Acquire';
              Detail  := '';
              Enabled := True;
              Title   := 'imageENMain';

              ImageIndex := -1;

            end;

      end;
    end;

  Except
      on E: Exception do
      begin

        //CodeSite.send('Err:'+e.Message);

      end;
  end;
  dxTileControl1.Groups.Clear;
  dxTileControl1.Items.Clear;

  dxTileControl1.BeginUpdate;

  //METRO
  {
  with dmHimawanFD do begin

    MenuRegister_q.Close;
    MenuRegister_q.Prepare;
    MenuRegister_q.ParamByName('Group_id').AsInteger := ICSSession.GroupID; // GroupMembers_q.FieldByName('GROUPID').AsInteger;
    MenuRegister_q.ParamByName('reg_id').AsInteger := MENU_REGISTER;
    MenuRegister_q.Active:=True;

    iGate  := 0;
    iGroup := 0;

    //1 Block Tile = 4 x 2 = 8 (2 column)
    //My Standar Row = 4, then 4x8=32
    iMaxItem := dxTileControl1.OptionsView.GroupMaxRowCount * 8;

    if Not MenuRegister_q.Eof then
    begin

      while Not MenuRegister_q.Eof do
      begin

        //CodeSite.Send('Item: '+MenuRegister_q.FieldByName('title1').AsString );

        case MenuRegister_q.FieldByName('tile_size').AsInteger of
          0 : begin  //Small

                if ( iGate+1) > iMaxItem Then
                dxTileControl1Groups := dxTileControl1.CreateGroup;

                Inc(iGate);

              end;
          1 : begin  //Reguler

                if ( iGate+1) > iMaxItem Then
                dxTileControl1Groups := dxTileControl1.CreateGroup;

                iGate := iGate+4;

              end;
          2 : begin  //Larger

                if ( iGate+8) > iMaxItem  then
                dxTileControl1Groups := dxTileControl1.CreateGroup;

                iGate := iGate+8 ;

              end;
          3 : begin  //ExtraLarger

                if (iGate+16) > iMaxItem  then
                dxTileControl1Groups := dxTileControl1.CreateGroup;

                iGate := iGate+16 ;

              end;
        end;

        if iGate>iMaxItem then
        begin
          iGate := 0;
          Inc(iGroup);
        end;

        if iGroup=0 then
        begin
        dxTileControl1Groups := dxTileControl1.CreateGroup;

          //CodeSite.Send('Add Group ');

        end;

        with dxTileControl1.CreateItem( tcisSmall , dxTileControl1Groups ) do
        begin

          //CodeSite.Send('Add '+IntToStr(iGate));

          Tag         := MenuRegister_q.FieldByName('item_tag').AsInteger;
          GroupIndex  := iGroup;  //MenuRegister_q.FieldByName('GroupIndex').AsInteger;

          //Tile Size
          case MenuRegister_q.FieldByName('tile_size').AsInteger of
          0 : begin Size := tcisSmall;
              end;
          1 : begin Size := tcisRegular;
              end;
          2 : begin Size := tcisLarge;
              end;
          3 : begin Size := tcisExtraLarge;
              end;
          end;

          //Style.Texture := //Photo user;

          if ( MenuRegister_q.FieldByName('tile_border').AsString<>'' ) then
          Style.BorderColor        := StringToColor(MenuRegister_q.FieldByName('tile_border').AsString);

          if ( MenuRegister_q.FieldByName('tile_begincolor').AsString<>'' ) then
          Style.GradientBeginColor := StringToColor(MenuRegister_q.FieldByName('tile_begincolor').AsString);

          if ( MenuRegister_q.FieldByName('tile_endcolor').AsString<>'' ) then
          Style.GradientEndColor   := StringToColor(MenuRegister_q.FieldByName('tile_endcolor').AsString);

          Text1.Value     := MenuRegister_q.FieldByName('title1').AsString;
          Text1.Font.Size := MenuRegister_q.FieldByName('tile1_fontsize').AsInteger;
          Text1.IndentHorz:= MenuRegister_q.FieldByName('tile1_identhorz').AsInteger;
          Text1.IndentVert:= MenuRegister_q.FieldByName('tile1_identvert').AsInteger;

          if (MenuRegister_q.FieldByName('tile1_color').AsString<>'') then
          Text1.TextColor := StringToColor(MenuRegister_q.FieldByName('tile1_color').AsString);

          Text1.Align     := oaBottomLeft; //oaBottomCenter;
          Text1.WordWrap  := True;

          if Not VarIsNull(MenuRegister_q.FieldByName('title2').AsString) then
          begin
            Text2.Value     := MenuRegister_q.FieldByName('title2').AsString;
            Text2.Font.Size := MenuRegister_q.FieldByName('tile2_fontsize').AsInteger;
            Text2.Font.Size := MenuRegister_q.FieldByName('tile2_fontsize').AsInteger;
            Text2.IndentHorz:= MenuRegister_q.FieldByName('tile2_identhorz').AsInteger;
            Text2.IndentVert:= MenuRegister_q.FieldByName('tile2_identvert').AsInteger;

            if (MenuRegister_q.FieldByName('tile2_color').AsString<>'') then
            Text2.TextColor := StringToColor(MenuRegister_q.FieldByName('tile2_color').AsString);
            Text2.Align     := oaTopRight;

          end;

          if Not VarIsNull(MenuRegister_q.FieldByName('item_class').AsString) then
          begin
            DetailOptions.Caption     := MenuRegister_q.FieldByName('item_class').AsString;
          end;


          Glyph.ImageIndex:= -1;
          if Not IsEmptyOrNull(MenuRegister_q.FieldByName('imageindex').AsInteger) then
          //if Not VarIsNull (MenuRegister_q.FieldByName('imageindex').AsInteger) then

          begin

            Glyph.ImageIndex:= MenuRegister_q.FieldByName('imageindex').AsInteger;
            Glyph.Align := oaMiddleCenter;

            //CodeSite.Send('2:'+IntToStr(MenuRegister_q.FieldByName('imageindex').AsInteger));

          end;
          //CodeSite.Send('3:'+Text1.Value);

        end;

        MenuRegister_q.Next;
      end;

      dxTileControl1.Invalidate;
      dxTileControl1.EndUpdate;
      dxTileControl1.Repaint;

      MenuRegister_q.Close;
    end;

  end;

  CodeSite.Send('FillMetro-e');
  }
  //CodeSite.Send('-2. Meter:'+ IntToStr(meter) + ' / '+IntToStr(AdvMetroProgressBar1.Max));

  //StringList.Free;

end;

procedure TMainApp.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
var
  INIFile: TIniFile;
  INIFileName: TFileName;

begin

  AdvMetroTaskDialog1.Instruction := 'Apakah Anda yakin ingin keluar?';
  AdvMetroTaskDialog1.CommonButtons := [AdvMetroTaskDialog.cbCancel, AdvMetroTaskDialog.cbYes];

  if AdvMetroTaskDialog1.Execute = mrCancel then
    CanClose := False

  else
  begin

    acShutDown.Execute;

  end;

  INIFileName   := ExtractFilePath(Application.ExeName)+ 'Mbings.ini';

  try

    INIFile := TIniFile.Create(INIFileName);

    //Scale Form
    if INIFile.ReadInteger('Setting ICS', 'FormTop', -1 ) <> Top Then
    begin //CodeSite.Send('c3,1');
    INIFile.WriteInteger('Setting ICS', 'FormTop', Top );
    end;

    if INIFile.ReadInteger('Setting ICS', 'FormLeft', -1 ) <> Left Then
    INIFile.WriteInteger('Setting ICS', 'FormLeft', Left );

    if INIFile.ReadInteger('Setting ICS', 'FormWidth', -1 ) <> Width Then
    INIFile.WriteInteger('Setting ICS', 'FormWidth', Width );

    if INIFile.ReadInteger('Setting ICS', 'FormHeight', -1 ) <> Height Then
    INIFile.WriteInteger('Setting ICS', 'FormHeight', Height );
    
  finally

    INIFile.Free;

  end;
end;

procedure TMainApp.FormCreate(Sender: TObject);
var
  LangID: DWORD;
  Item: TscGPListBoxItem;
  tgl:THijriDate; //{last:20191030 TDate;}
  bln:String[14];

begin

  //

  AuthActivation  := False;

  scPageControl1.Visible := False;
  scPageControl1.SendToBack;

  //LAST: 20220609
  if scSV_Config.Opened then
  begin
    scSV_Config.OnOpened := Nil;  //scSV_ConfigOpened
    scSV_Config.OnClosed := Nil;  //scSV_ConfigClosed
    scSV_Config.Opened := False;

    scSV_Config.OnOpened := scSV_ConfigOpened;
    //scSV_Config.OnClosed := scSV_ConfigClosed;

  end;

  //Initialize Form/VCL
  AccountButton.Top := 1;
  MinButton.Top     := 1;
  MaxButton.Top     := 1;
  CloseButton.Top   := 1;
  StartButton.Top   := 1;

  CloseButton.BringToFront;
  MaxButton.BringToFront;
  MinButton.BringToFront;
  AccountButton.BringToFront;
  StartButton.BringToFront;

  //xCircleMenu := 0;
  eStartTime  := Now;
  IdleBlock   := False;

  FShowing := True;

  lbFullName.Caption := '';
  lbJob.Caption      := '';
  lbInfo.Caption     := '';
  lbLastAcc.Caption  := '';
  scLabelVersion.Caption   := 'ICS Ver.'+GetBuildInfoAsString;
  btAccountProfile.Caption := 'User';

  MainApp.Top :=0;

  AdvMetroProgressBar1.Left     := MainApp.Width-scGPSizeBox1.Width-AdvMetroProgressBar1.Width-3;

  //DoMaximize;
  //MaxButton.Visible := False;
  //scShowMaxiBtn.Checked := True;

  scPageControl1.Align := alClient;
  scSV_Config.Opened   := False;

  //________________________________________________________________Version__//
  ICSSession.Status    := False;
  ICSSession.UpdateStatus := 0;
  ICSSession.ICS_APPMENU  := 'ics369_menu';  //ics369_menu
  ICSSession.ICS_REG_ID   := '-1';     //Updated! Last: 20221223
  ICSSession.ICS_APPVER   := '1000'; //Updated! Last: 20221223
  //_________________________________________________________________________//

  MyConfigurRegion;

  { //Last: 20221021
  LangID := GetUserDefaultLangID;
  if ( Byte(LangID ) <> LANG_INDONESIAN ) Then
  Begin
    AdvMetroTaskDialog1.Instruction   := 'Maaf, System ini mengharuskan ' +
       'menggunakan Format Regional "Indoneisa"'+#10#13+
       'Masuk ke Control Panel, Region, Rubah Format ke Indonesia';

    AdvMetroTaskDialog1.ExpandedText  := 'Region' ;
    AdvMetroTaskDialog1.CommonButtons := [AdvMetroTaskDialog.cbClose];

  End;

  case Byte(LangID and $03FF) of
    LANG_ENGLISH:
      FormatSettings.DecimalSeparator := '.';

    LANG_INDONESIAN:
      FormatSettings.DecimalSeparator := ',';

    SUBLANG_ENGLISH_US:
      FormatSettings.DecimalSeparator := '.';

  else

    FormatSettings.DecimalSeparator := '.';

  end;
  }

  Tgl:=TglHijriah(Now);

  bln:= HijriMonths( Tgl.HijriMonth,1 ); //StrToInt(FormatDateTime('MM',tgl)) , 1 );

  sbDateNow.Caption :=
  Hari_Pasaran( Now )+', '+DateToStr4( Date )+' ('+
  IntToStr( Tgl.HijriDate )+ ' '+bln+' '+IntToStr(Tgl.HijriYear )+' Jawa)';

  sbDateNow.Visible := True;

  ElapsedTime := Now-eStartTime;

  //scsv_Config.color := $009A572B;

  {
  MainApp.Width := Screen.Width;
  MainApp.Constraints.MinWidth := Round(880 * scStyledForm1.ScaleFactor);
  MainApp.Constraints.MinHeight :=Round(450 * scStyledForm1.ScaleFactor);
  MainApp.Height := Screen.Height-90;
  }


  //---------------------------------------------------------------------------/

  //CodeSite.Send('MyLoadClientApp1');
  MyLoadClientApp1;

  //CodeSite.Send('c1-ido:'+ ICSSession.Office_id );

  //CodeSite.Send('MyLoadClientApp2');
  MyLoadClientApp2(True);


  //CodeSite.Send('MyLoadFotoProfile');
  //Last: 20230215
  MyLoadFotoProfile;

  //CodeSite.Send('MyDefaultmetroFill');

  MyDefaultmetroFill;

  Timer1.Enabled := True;

end;

procedure TMainApp.FormShow(Sender: TObject);
begin
  BorderPanel.Repaint;
end;

procedure TMainApp.FormResize(Sender: TObject);
begin

  CloseButton.Left  := ClientWidth-50;
  MaxButton.Left    := CloseButton.Left-MaxButton.Width;
  MinButton.Left    := MaxButton.Left-MinButton.Width;
  AccountButton.Left:= MinButton.Left-AccountButton.Width;
  scLabelApp.Width  := AccountButton.Left-StartButton.Width ;

  PanelMenu.Height  := scSplitAndapan.Top-10;

  //StartButton.Left:= 0;
  //scLabelApp.Left   := scStartButton.Width;

  AdvMetroProgressBar1.Left := MainApp.Width-scGPSizeBox1.Width-AdvMetroProgressBar1.Width-3;

end;


procedure TMainApp.GetBuildInfo(var V1, V2, V3, V4: word);
var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  if VerInfoSize > 0 then
  begin
      GetMem(VerInfo, VerInfoSize);
      try
        if GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) then
        begin
          VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
          with VerValue^ do
          begin
            V1 := dwFileVersionMS shr 16;
            V2 := dwFileVersionMS and $FFFF;
            V3 := dwFileVersionLS shr 16;
            V4 := dwFileVersionLS and $FFFF;
          end;
        end;
      finally
        FreeMem(VerInfo, VerInfoSize);
      end;
  end;

end;

function TMainApp.GetBuildInfoAsString: string;
var
  V1, V2, V3, V4: word;
begin
  GetBuildInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' +
    IntToStr(V3) + '.' + IntToStr(V4);
end;

function TMainApp.GetFileInfo(filename: string): string;
type
  TLANGANDCODEPAGE = record
    wLanguage, wCodePage: Word;
  end;

  PLANGANDCODEPAGE = ^TLANGANDCODEPAGE;
var
  InfoResSize, // size of the version info resource
  Zero: dword; // tjis is junk variable, ignored
  VersionInfo, // pointer to  version info resource
  Info: pointer; //pointer to the version information
  Translation: PLANGANDCODEPAGE; // translation table
  VersionInfoSize: UINT; // size of version information
  InfoPath: string; // version info request string
begin
  // get the size of the version information , if exists
  // InfoResSize := 0;
  result := '';
  InfoResSize := GetFileVersionInfoSize(pchar(filename), Zero);

  if InfoResSize = 0 then
  begin
    exit;
  end;

  // Get  memory for the info structure
  GetMem(VersionInfo, InfoResSize);

  try
    // Get information of the current file
    if not GetFileVersionInfo(pchar(filename), 0, InfoResSize, VersionInfo) then
    begin
      FreeMem(VersionInfo);
      exit;
    end;

    if VerQueryValue(VersionInfo, '\VarFileInfo\Translation',
      pointer(Translation), VersionInfoSize) then
    begin
      // set the version value path string
      InfoPath := '\StringFileInfo\' + IntToHex(Translation^.wLanguage, 4) +
        IntToHex(Translation^.wCodePage, 4) + '\';

      GetMem(Info, 2000);
      VerLanguageName(Translation^.wLanguage, Info, 2000);
      FreeMem(Info);
    end
    else // set default value
    begin
      // set the version value path string
      InfoPath := '\StringFileInfo\040904E4\';
    end;

    // File Version
    if VerQueryValue(VersionInfo, pchar(InfoPath + 'FileVersion'), Info,
      VersionInfoSize) then
    begin
      result := string(pchar(Info));
    end;

  finally
    // free the memory
    FreeMem(VersionInfo, InfoResSize);
  end;

end;

function TMainApp.GetVersion(sFileName: string): string;
var
 VerInfoSize: DWORD;
 VerInfo: Pointer;
  VerValueSize: DWORD;
  VerValue: PVSFixedFileInfo;
 Dummy: DWORD;
begin

  VerInfoSize := GetFileVersionInfoSize(PChar(sFileName), Dummy);
  GetMem(VerInfo, VerInfoSize);
  GetFileVersionInfo(PChar(sFileName), 0, VerInfoSize, VerInfo);
  VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
   with VerValue^ do
  begin
   Result := IntToStr(dwFileVersionMS shr 16);
   Result := Result + '.' + IntToStr(dwFileVersionMS and $FFFF);
   Result := Result + '.' + IntToStr(dwFileVersionLS shr 16);
   Result := Result + '.' + IntToStr(dwFileVersionLS and $FFFF);
  end;
  FreeMem(VerInfo, VerInfoSize);
end;

function TMainApp.Hari_Pasaran(Tgl: TDate): string;
var
  n,h,p: Integer;
begin

  n:=Trunc(Tgl-EncodeDate(1,1,1)); // revisi : support mulai 1 Januari th 1
  h:=n mod 7;
  p:=n mod 5;

  case h of
  0: Result:='Senin';
  1: Result:='Selasa';
  2: Result:='Rabu';
  3: Result:='Kamis';
  4: Result:='Jum''at';
  5: Result:='Sabtu';
  6: Result:='Minggu';
  else
  Result:=''; // gak mungkin terjadi
  end;

  Result:=Result+' ';
  case p of
  0: Result:=Result+'Pahing';
  1: Result:=Result+'Pon';
  2: Result:=Result+'Wage';
  3: Result:=Result+'Kliwon';
  4: Result:=Result+'Legi';
  end;

end;

procedure TMainApp.MaxButtonClick(Sender: TObject);
begin
  if scStyledForm1.IsDWMClientMaximized then
    scStyledForm1.DWMClientRestore
  else
    scStyledForm1.DWMClientMaximize;

end;

procedure TMainApp.MinButtonClick(Sender: TObject);
begin
  Application.Minimize;
end;

function TMainApp.MyActionFacOnChange: Boolean;
Var
  iAct, x : Integer;
begin

  iAct := scPageControl1.ActivePageIndex;
  Result := False;

  //CodeSite.send('1.Check Changed in '+ scPageControl1.Pages[iAct].Caption );

  Try

    for x := 0 to TForm(scPageControl1.Pages[iAct].Components[0]).ComponentCount-1 do
    begin

      //CodeSite.Send('<<'+IntToStr(x)+'>>'); //+'/'+IntToStr(TForm(scPageControl1.Pages[iAct].Components[0]).ComponentCount)+'>>');

      if  TForm(scPageControl1.Pages[iAct].Components[0]).Components[x] is TCheckBox then
      begin
        if TCheckBox(TForm(scPageControl1.Pages[iAct].Components[0]).Components[x]).Name = 'cbInvChanged' then
        begin
          if TCheckBox(TForm(scPageControl1.Pages[iAct].Components[0]).Components[x]).Checked then
          begin
            //CodeSite.send('Have Data Saving');
            Result := False;
            end
          else
          begin
            Result := True;
            //CodeSite.send('Clear Data ');
          end;
        end;
      end;
    end;
  Finally
  //Except

  End;
  //CodeSite.send('Data Saving ?:'+iif(Result,'True','False'));
end;

procedure TMainApp.MyActionSelected(cActive: Boolean=False);
Var
  iAct, p, x , w : Integer;
begin

  iAct := scPageControl1.ActivePageIndex;

  //CodeSite.send('Target Action:'+ scPageControl1.Pages[iAct].Caption );

  if scPageControl1.PageCount>0 then
  begin

    for p := 0 to ( scPageControl1.PageCount-1 ) do
    begin

      //CodeSite.Send('<\'+IntToStr(p)+'/'+IntToStr(iAct)+'/>');

      if (p=iAct) then
      begin

        //CodeSite.Send('<\a/>');

        Try

          for x := 0 to TForm(scPageControl1.Pages[p].Components[0]).ComponentCount-1 do
          begin

            //CodeSite.Send('<<'+IntToStr(x)+'>>'); //+'/'+IntToStr(TForm(scPageControl1.Pages[iAct].Components[0]).ComponentCount)+'>>');
            if  TForm(scPageControl1.Pages[p].Components[0]).Components[x] is TActionList then
            begin
              TActionList(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).State := asNormal;   //asSuspended; //
              //CodeSite.send('1.'+ scPageControl1.Pages[p].Caption +' action asNormal');
            end;

            if TForm(scPageControl1.Pages[p].Components[0]).Components[x] is TForm then
            begin
              //CodeSite.send('<<Child form>>:'+
               // TForm(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).Name );

              for w := 0 to TForm(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).ComponentCount-1 do
              begin

                if TForm(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).Components[w] is TActionList then
                begin
                  //CodeSite.send('<<Go Suspend>>');
                  TActionList(TForm(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).Components[w]).State := asNormal;
                  Break;
                end;
              end;
            end;
          end;
        Except

        End;
      end
      else
      begin

        //CodeSite.send('<<<+---+'+ InttoStr(p)+'>>>');

        if cActive then
        begin

          //CodeSite.send('Active Suspen Action:'+ scPageControl1.Pages[iAct].Caption );

          for x := 0 to  scPageControl1.Pages[p].Components[0].ComponentCount-1 do
          begin

            //CodeSite.send('<<<'+IntToStr(x)+'/'+InttoStr(p)+'>>>');

            if  scPageControl1.Pages[p].Components[0].Components[x] is TActionList then
            begin
              TActionList(scPageControl1.Pages[p].Components[0].Components[x]).State := asSuspended;
              //CodeSite.send('Active.'+ scPageControl1.Pages[p].Caption +' action asSuspended');
              //Break;
            end;


            if TForm(scPageControl1.Pages[p].Components[0]).Components[x] is TForm then
            begin
              //CodeSite.send('<<Child form>>:'+
              //  TForm(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).Name );

              for w := 0 to TForm(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).ComponentCount-1 do
              begin

                if TForm(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).Components[w] is TActionList then
                begin

                  //CodeSite.send('<<Go Suspend>>');

                  TActionList(TForm(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).Components[w]).State := asSuspended;
                  Break;
                end;
              end;
            end;
          end;
        end
        else
        begin

          //CodeSite.send('InCreate Suspen Action:'+ scPageControl1.Pages[iAct].Caption );

          Try

            for x := 0 to TForm(scPageControl1.Pages[p].Components[0]).ComponentCount-1 do
            begin

              //CodeSite.send('<<<'+IntToStr(x)+'/'+InttoStr(p)+'>>>');

              if  TForm(scPageControl1.Pages[p].Components[0]).Components[x] is TActionList then
              begin
                TActionList(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).State := asSuspended; //
                //CodeSite.send('Create New.'+ scPageControl1.Pages[p].Caption +' action asSuspended');
                //Break;
              end;

              if TForm(scPageControl1.Pages[p].Components[0]).Components[x] is TForm then
              begin
                //CodeSite.send('<Child form:'+
                //TForm(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).Name );

                for w := 0 to TForm(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).ComponentCount-1 do
                begin

                  if TForm(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).Components[w] is TActionList then
                  begin
                    //CodeSite.send('<Go Suspend>');
                    TActionList(TForm(TForm(scPageControl1.Pages[p].Components[0]).Components[x]).Components[w]).State := asSuspended;
                    Break;
                  end;
                end;
              end;
            end;
          Except

          End;
        end;
      end;
    end;
  end;

end;



procedure TMainApp.MyDeActivate;
var i:integer;
    form : TForm;
begin

//  CodeSite.Send('Mode a');

  scPageControl1.OnChange := Nil;  //scPageControl1AfterClose;

  for i := (scPageControl1.PageCount -1) downto 0  do
    scPageControl1.Pages[i].Destroy;

  scPageControl1.visible := False;

//  CodeSite.Send('Mode b');

  for i := 0 to ComponentCount - 1 do begin
    if Components[i] is TForm then begin
      Form := TForm(Components[i]);

      Form.Close;

     end;
  end;
end;


procedure TMainApp.MyDefaultMetroFill;
var imetroName : string;
  i : integer;
  TabSheet: TscTabSheet;
begin

  scListMenu.Items.Clear;

  with scListMenu.Items.Add do
  begin
    Header  := True;
    Caption := 'Welcome';
    Detail  := 'System Utama';
    Enabled := True;
    Title   := '';
    Indent  := 1;
  end;

  with scListMenu.Items.Add do
  begin
    Header  := False;
    Caption := 'Login';
    Detail  := 'Masuk System Utama';
    Enabled := True;
    Title   := 'acConnect';
    ImageIndex := 21;

  end;

end;



procedure TMainApp.MyGetBackground(url: String);
Var
   ABackground : String;
begin

  if ContainsText( 'http', url ) then begin


  end else begin



  end;

end;

procedure TMainApp.MyGetBackgroundFile(AFileName: String);
begin

    BorderPanel.CustomImages := nil;

    scImageCollection1.Images[0].Picture := nil;
    scImageCollection1.Images[0].Picture.LoadFromFile( AFileName );

    BorderPanel.CustomImages := scImageCollection1;
    BorderPanel.CustomImageIndex := 0;

    BorderPanel.Repaint;

end;

procedure TMainApp.MyLoadClientApp1;
var
  INIFileName: TFileName;
  INIFile: TIniFile;
  section,sTyleName: string;
  i : Integer;
  FileLogo : string;
  fImgSize : integer;
  g:TGraphic;

begin

  //Open IniFiles
  iniFileName := ExtractFilePath(Application.ExeName) + 'Mbings.ini';

  if FileExists(INIFileName) then
  begin
    INIFile := TIniFile.Create(INIFileName);
    with INIFile do
    begin
      try
        begin

          //Scale Form
          Top   := INIFile.ReadInteger('Setting ICS', 'FormTop', -1 );
          if MainApp.Top=-1 then Begin
            INIFile.WriteInteger('Setting ICS', 'FormTop', 0 );
            Top   := 0;
          End;

          Left  := INIFile.ReadInteger('Setting ICS', 'FormLeft', -1);
          if MainApp.Left=-1 then Begin
            INIFile.WriteInteger('Setting ICS', 'FormLeft', 0 );
            Left   := 0;
          End;

          Width := INIFile.ReadInteger('Setting ICS', 'FormWidth', -1);
          if MainApp.Width<=600 then Begin
            INIFile.WriteInteger('Setting ICS', 'FormWidth', Screen.Width );
            Width   := Screen.Width;
          End;

          Height:= INIFile.ReadInteger('Setting ICS', 'FormHeight', -1);
          if MainApp.Height<=600 then Begin
            INIFile.WriteInteger('Setting ICS', 'FormHeight', Screen.Height );
            Height   := Screen.Height;
          End;

          //CodeSite.Send('Restore Position form');

          //-------------------------------------------------------------------/
          //ICSgo-sdb Qql Lite Load Config App...


        end;

      finally
        INIFile.Free;
      end;

    end;
  end;


  if Not DirectoryExists( TPath.GetDocumentsPath+'\ICS Profile' ) then
  ForceDirectories( TPath.GetDocumentsPath+'\ICS Profile' );

  if Not DM.FDT_ConfigApp.Active then
  DM.FDT_ConfigApp.Active := True;

  if DM.FDT_ConfigApp.Locate('confname', 'NamaLembaga' ,[loPartialKey]) then begin
    begin

      //CodeSite.Send('Folder Profile:'+ TPath.GetDocumentsPath+'\ICS Profile');
      //CodeSite.Send('File Lembaga  :['+ DM.FDT_ConfigApp.FieldByName('CONFCAPTION').AsString +']' );

      if Not IsEmptyOrNull(DM.FDT_ConfigApp.FieldByName('CONFCAPTION').AsString) then begin

        FileLogo := TPath.Combine( TPath.GetDocumentsPath+'\ICS Profile', DM.FDT_ConfigApp.FieldByName('CONFCAPTION').AsString +'.png' );

        //CodeSite.Send('File Lembaga  :['+ FileLogo +']');

        if FileExists(FileLogo) then
        begin

            g:=TPNGImage.Create;
            g.LoadFromFile( FileLogo );
            scImage1.Picture.Graphic := g;
            g.Free;

        end;
      end;
    end;

    DM.FDT_ConfigApp.Active := False;
  end;
end;

procedure TMainApp.MyLoadClientApp2(byLast:boolean=True);
var
  err,i : Integer;
  MyIDClient : TMyIdClient;
  AProjectDir, ADatabase, AHost, HostName, APortApi, APort : String;
  //Adb2,Adb3,Adb4 : String;

  g:TGraphic;
  //Foto : TStream;
  FotoFile, FileExt : String;

begin

    err := 0;

    //CodeSite.Send('MyLoadClientApp2');

    //last: 20221021
    //Prepare SQLite Application Configuration
    //Accecss from $Datamodule2

    if scPageControl1.PageCount > 1 then
    begin

      if ( MetroTaskMessageDlg(
      'Perhatian',
       scPageControl1.ActivePage.Caption +
       ' Perubahan Configurasi membutuhan Refresh Semua Halaman ' +
       ', System akan menutup otomatis ',
          mtConfirmation,[mbYes, mbNo], 0) = mrYes ) Then
       begin

          if ( scPageControl1.PageCount>0 ) then
          begin

            //CodeSite.Send('ics/close/page/');

            for i := (scPageControl1.PageCount -1) downto 0  do begin

              //CodeSite.Send('Page:'+ scPageControl1.Pages[i].Name );

              scPageControl1.Pages[i].Destroy;

            end;

          end;
       end;
    end;


    try

      with DM do begin

          //CodeSite.Send('MyLoadClientApp2/1');

          if Not SQLiteConnection.Connected then
          SQLiteConnection.Connected := True;

          if Not FDT_ConfigApp.Active then
          FDT_ConfigApp.Active := True
          else
          begin
            FDT_ConfigApp.Active := False;
            FDT_ConfigApp.Active := True;
          end;

          //$ICS api Server
          MainApp.ICSSession.HostName := '';
          MainApp.ICSSession.PortNo   := 0;
          MainApp.ICSSession.Dupa := '';

          if FDT_ConfigApp.Locate('confname' , 'ics_dupa' ,[loCaseInsensitive] ) then
          MainApp.ICSSession.Dupa  := FDT_ConfigApp.FieldByName('confvalue').AsString;

          if FDT_ConfigApp.Locate('confname' , 'ims_server' ,[loCaseInsensitive] ) then begin

            HostName := FDT_ConfigApp.FieldByName('confvalue').AsString;

            if Not HostName.Contains( 'http' ) then
              HostName := 'http:\\' + HostName;

          end;

          MainApp.ICSSession.HostName  := HostName; // MVC Version! + ':'+ APort ;

          APortApi := '';
          if FDT_ConfigApp.Locate('confname' , 'ims_port' ,[loCaseInsensitive] ) then
          begin

            if Not IsEmptyOrNull(FDT_ConfigApp.FieldByName('confvalue').AsString) then
            MainApp.ICSSession.PortNo    := StrToInt(FDT_ConfigApp.FieldByName('confvalue').AsString);

          end;

          //$ICS Client Server

          if FDT_ConfigApp.Locate('confname' , 'ics_server' ,[loCaseInsensitive] ) then
          AHost := FDT_ConfigApp.FieldByName('confvalue').AsString;

          if FDT_ConfigApp.Locate('confname' , 'ics_port' ,[loCaseInsensitive] ) then
          APort := FDT_ConfigApp.FieldByName('confvalue').AsString;

          if FDT_ConfigApp.Locate('confname' , 'ics_database' ,[loCaseInsensitive] ) then
          ADatabase := FDT_ConfigApp.FieldByName('confvalue').AsString;

          if IsEmptyOrNull(ADatabase) then
          ADatabase := 'himawann';

//          if FDT_ConfigApp.Locate('confname' , 'iss_database' ,[loCaseInsensitive] ) then
//          ADatabase := FDT_ConfigApp.FieldByName('confvalue').AsString;
//
//          if IsEmptyOrNull(ADatabase) then
//          ADatabase := '/songgolangit/danaraja/simaskop.fdb';

          msSysData := ExtractFilePath(Application.ExeName);
          if FDT_ConfigApp.Locate('confname' , 'ics_DirSystem' ,[loCaseInsensitive] ) then
          msSysData := FDT_ConfigApp.FieldByName('confvalue').AsString;

          msModeICSLS := False;
          if FDT_ConfigApp.Locate('confname' , 'ics_projectserver' ,[loCaseInsensitive] ) then
          msModeICSLS := FDT_ConfigApp.FieldByName('confvalue').AsString='1';

          if byLast then begin
            if FDT_ConfigApp.Locate('confname' , 'employee', [loCaseInsensitive]) then
            scUserName.Text := FDT_ConfigApp.FieldByName('confvalue').AsString;
          end;

          //$2 Office ID
          if FDT_ConfigApp.Locate('confname' , 'office_id', [loCaseInsensitive]) then begin
            ICSSession.Office_id := FDT_ConfigApp.FieldByName('confvalue').AsString;
          end;

          //$
          if FDT_ConfigApp.Locate('confname' , 'deviceid', [loCaseInsensitive]) then
          DeviceInfo.MacAddress := FDT_ConfigApp.FieldByName('confvalue').AsString;


          if DM.FDT_ConfigApp.Locate('confname', 'NamaLembaga' ,[loPartialKey]) then
          lbLegalName.Caption := FDT_ConfigApp.FieldByName('confvalue').AsString;

          //if ContainsText( DeviceInfo.MacAddress ,  'This Device' ) then
          //DeviceInfo.MacAddress := '';

          FDT_ConfigApp.Active := False;

      end;


      //CodeSite.Send('MyLoadClientApp2/2');

      if (AHost='') or ( LowerCase(AHost)='localhost') then begin

          if ( APort <> '' ) then begin

              msDatabase.Db1_Host :=
                    iif(AHost<>'',
                            AHost+'/'+Aport,
                            'localhost')+'/'+APort;

              msDatabase.Db2_Host := msDatabase.Db1_Host;

              msDatabase.Db1_Name :=
                      msDatabase.Db1_Host+':'+ ADatabase;



          end else begin

              msDatabase.Db1_Host :=
                    iif(AHost<>'',
                            AHost,
                            '' );

              msDatabase.Db1_Name :=
                      msDatabase.Db1_Host + ADatabase;



          end;
      end else begin

          msDatabase.Db1_Server :=
            IIF( AHost <> '', AHost , 'localhost' );

          //Database url (Uniform Resource Locator)

          If ( APort <> '' ) Then
          begin

            msDatabase.Db1_Host :=
                    AHost+'/'+
                    APort+':';

            msDatabase.Db1_Host := msDatabase.Db1_Host;

            msDatabase.Db1_Name :=
                msDatabase.Db1_Host + ADatabase;

          end;

      end;

      //CodeSite.Send('-1-.Db1_Name: '+msDatabase.Db1_Name);
      //CodeSite.Send('-1-Api.HostName:'+ ICSSession.HostName );
      //CodeSite.Send('-1-Api.HostPort:'+ IntToStr(ICSSession.PortNo) );

      //Last: 20230227

      MainApp.ICSRestClient := TMVCRESTClient.New.BaseURL( MainApp.ICSSession.HostName , MainApp.ICSSession.PortNo );


      //CodeSite.Send('MyLoadClientApp2/3');

      DeviceInfo.Activation := False;
      MyIDClient := TMyIDClient.Create;

      if Not IsEmptyOrNull(DeviceInfo.MacAddress) then
      begin
        if ( MyIDClient.MacAddress <> DeviceInfo.MacAddress ) then
        begin
          DeviceInfo.MacAddress := MyIDClient.MacAddress;
          DeviceInfo.IPAddress  := MyIDClient.IpLocal;
        end;
      end else begin
          DeviceInfo.MacAddress := MyIDClient.MacAddress;
          DeviceInfo.IPAddress  := MyIDClient.IpLocal;
      end;

      //CodeSite.Send('MyLoadClientApp2/4');
      MyIDClient.DisposeOf;

      if Not IsEmptyOrNull(MainApp.ICSSession.HostName) then begin

        //CodeSite.Send('MyLoadClientApp2/4/CheckRegistration');

        CheckRegistration;

        if DeviceInfo.Activation then begin
           scInfoRegistered.Caption := 'Status : Activated';
        end else
        begin
           scInfoRegistered.Caption := 'Status : Belum Teractivasi';
        end;

      end;


    except
        on E: Exception do begin
           //Application shutdown!
           Inc( err );
           MetroTaskMessageDlg(
          'Error Update',
           e.Message , mtConfirmation,[mbNo],1);

           //CodeSite.Send('a-5e.' + e.Message );

        end;
    end;

    //CodeSite.Send('MyLoadClientApp2/e');
end;


procedure TMainApp.MyLoadConfig;
var
  i : integer;
  INIFile : TIniFile;
  FileName: TFileName;
  section : string;
  bActive : boolean;
  xHollyColor : TColor;

begin

  //Open IniFiles
  FileName := ExtractFilePath(Application.ExeName) + 'Mbings.ini';

  if FileExists(FileName) then
  begin
    INIFile := TIniFile.Create(FileName);
    with INIFile do
    begin
      try
        begin

          section := 'Setting ICS';

          bActive := INIFile.ReadBool(section, 'Highlight Weekend',True);

          bActive := INIFile.ReadBool(section, 'Highlight Holidays',True);

          //dmHimawanFD.UseSpecDays := bActive ;

          //xHollyColor:= HtmlToColor( INIFile.ReadString(section, 'Holydays Color','#FF8000' ));

        end;
      Except

      end;
    end;
  end;
end;

procedure TMainApp.MyLoadFotoProfile;
var
  m : TStream;
  ImageEnView : TImageEnView;
  g:TGraphic;
  FotoFile, FotoFile2, FileExt : String;

begin

    //Load current foto user profile
    if Not DirectoryExists( TPath.GetDocumentsPath+'\ICS Profile' ) then
    ForceDirectories( TPath.GetDocumentsPath+'\ICS Profile' );

    //CodeSite.Send('Folder Profile:'+ TPath.GetDocumentsPath+'\ICS Profile');

    if Not DM.FDT_ConfigApp.Active then
    DM.FDT_ConfigApp.Active := True;


    if DM.FDT_ConfigApp.Locate('confname', 'employee' ,[loPartialKey]) then
    //if DM.FDT_ConfigApp.Locate('confname', 'USERPHOTO' ,[loPartialKey]) then
    begin

      FotoFile :=
        TPath.Combine( TPath.GetDocumentsPath+'\ICS Profile',
        DM.FDT_ConfigApp.FieldByName('confcaption').AsString );

      //CodeSite.Send('FotoFile:['+FotoFile+']');

      if Not IsEmptyOrNull(FotoFile) then begin

        //CodeSite.Send('FotoFile:['+TPath.GetFileName(FotoFile) +']');

        FileExt      := TPath.GetExtension( FotoFile );
        FotoFile2    := TPath.GetFileName( FotoFile );
        FotoFile2    := StringReplace( FotoFile2 , FileExt ,'',[rfReplaceAll]);

        //CodeSite.Send('FotoFile2:['+FotoFile2+']');

        if ( scUserName.Text = TPath.GetFileName(FotoFile2) ) then begin

          if FileExists( FotoFile ) then begin

            //CodeSite.send('i/2/0');
            m  := TStringStream.Create();
            m.Position:= 0;

            ImageEnView := TImageEnView.Create(nil);

            ImageEnView.IO.LoadFromFile( FotoFile );

            ImageEnView.IO.StreamHeaders := True;
            ImageEnView.IO.SaveToStream(m, ImageEnView.IO.Params.FileType);
            m.Position := 0;

            //CodeSite.send('i/2/1');

            case ImageEnView.IO.Params.FileType of
            ioJPEG : g:=TJPEGImage.Create;
            ioPNG  : g:=TPNGImage.Create;
            ioBMP  : g:=TBitmap.Create;
            end;

            g.LoadFromStream(m);

            //CodeSite.send('i/2/2');

            if Assigned(g) then begin
              scFoto.Picture.Graphic := g;
              g.Free;
            
            end;

            FreeAndNil(m);
            ImageEnView.Free;

            {
            if FileExt = '.png' then
            begin g:=TPNGImage.Create;
              g.LoadFromFile( FotoFile );
              scFoto.Picture.Graphic := g;
              g.Free;
            end;

            if FileExt = '.jpg' then
            begin g:=TJpegimage.Create;
              g.LoadFromFile( FotoFile );
              scFoto.Picture.Graphic := g;
              g.Free;
            end;

            if FileExt = '.bmp' then
            begin g:=TBitmap.Create;
              g.LoadFromFile( FotoFile );
              scFoto.Picture.Graphic := g;
              g.Free;
            end;
            }
          end;
        end;
      end else begin

        scFoto.Picture.Graphic   := Nil;

      end;
    end;
end;

procedure TMainApp.MyLogin;
var
  oLogin : JsonDataObjects.TJsonObject;
  UserKey, UserPwd  : String;
  vList : TStrings;

begin

    AdvMetroTaskDialog1.ExpandedText  := '';

    ICSSession.LoginName := scUserName.Text;
    ICSSession.Secret_key:= scPasswordEdit1.Text;

    //CodeSite.send('$MainApp/MyLogin');

    ICSSession := ICSMVCServerLogin( ICSSession );

    //CodeSite.send('$MainApp.SessionID:'+ICSSession.SessionID);

    scSessionID.Caption := 'Client ID: '+ICSSession.SessionID;

    if ICSSession.SessionID <> '' then begin

        IdleBlock := True;

        lbFullName.Caption       := ICSSession.UserName;
        btAccountProfile.Caption := ICSSession.UserName;
        lbJob.Caption            := ICSSession.Punggawa;    // FDQuery1.FieldByName('GROUPNAME').AsString;
        lbInfo.Caption           := 'Id Kantor '+ ICSSession.Office_id; //  FDQuery1.FieldByName('IDWIL').AsString;

        msCurrentUser    := ICSSession.UserName;
        msCurrentIDUser  := ICSSession.LoginName;
        msPasswordUser   := scPasswordEdit1.Text;

        //CheckMenuHeader;

        //CodeSite.send('$MainApp/1');

        scPasswordEdit1.Text  := '';
        scLoginMsg.Font.Color := clWindowText;
        scLoginMsg.Caption    := 'Login diterima';
        btSingin.Caption      := '&Logout';
        AccountButton.Caption := 'Log out';
        AccountButton.GlyphOptions.NormalColor := clWindow; // $0050A87F;

        //CodeSite.send('$MainApp/2');

        CheckLegalID;

        CheckFotoProfile;




        {
        doHttpRequest( 'POST' ,
                       '/system/users/logged',
                       oLogin.ToJSON
                        );

                        //TStringStream.Create( oLogin.ToJSON)

        CodeSite.Send('$MainApp/5');
        }
    end;

end;

procedure TMainApp.MyMenuInSelected(Sender: TObject);
var sit : string;
  i:integer;

begin

  //CodeSite.Send('MyMenuInSelected');

  ICSSession.ApiKey := -1;

  if Activecontrol = scListMenu then
  i := scListMenu.ItemIndex;


  if i<0 then
  Exit;

  //CodeSite.Send('MyMenuInSelected/1:'+IntToStr(i));

  if Not IsEmptyOrNull(scListMenu.Items.Items[i].Button.Caption) then begin

    //CodeSite.Send( 'MenuItem/api'+  scListMenu.Items.Items[i].Button.Caption );

    ICSSession.ApiKey := StrToInt(scListMenu.Items.Items[i].Button.Caption);

    if MainApp.ICSSession.SessionID <> '' then begin


    end;


  end;

  //CodeSite.Send('MyMenuInSelected/2');

  sit := scListMenu.Items.Items[i].Title;

  //CodeSite.Send( 'MenuItem/Class/'+  scListMenu.Items.Items[i].Title );

  MySelectMenu( sit );

  //CodeSite.Send('MyMenuInSelected/3');

  scListMenu.ItemIndex := -1;

  StartButton.BringToFront;
  StartButtonClick(nil);

  //StartButton.Repaint;
end;

procedure TMainApp.MySelectMenu(el:String);
var xc : integer;
begin

  if el = 'acConnect' then
  begin
    xc := 1;
    scSV_Config.Opened := True;
  end;


  if el = 'vcCustRegister' then
  begin

    xc := 1;

    CriarAba( TFCustRegister , 0 );

  end;

  if el = 'vcCustApproval' then
  begin

    xc := 1;

    CriarAba( TvcCustApproval , 0 );

  end;

  if el = 'vcSlik' then
  begin

    xc := 1;

    CriarAba( TfrmSLIK , 0 );

  end;

  if xc < 1 then
  begin

    cxSetSplashVisibility(True,'FITUR AKAN SEGERA TERSEDIA');
    Sleep(100);
    cxSetSplashVisibility(False,'');

  end;


end;

procedure TMainApp.MySQLiteData_cc;
var
  SQ : TStrings;
  Loc, S : String;
begin
  //          Cache file database SQLite------------------------------------------

  {//Alternatif Pengembangan Selanjutnya!
  Loc := ExtractFilePath(Application.ExeName)+'sdb';

  if not DirectoryExists(loc) then begin
    CreateDir(loc);
  end;
  }

end;


procedure TMainApp.MyUpdateFotoProfile(oJSON: TJSONObject);
Var
  Foto : TStream;
  SR : String; // TStringReader;
  g:TGraphic;
  lFileExt,lOutputFileName,lOutputFullPath,lOutputFolder: string;

begin


  //CodeSite.Send('Get image/3');

  if Assigned(oJson.Get('foto')) then
  begin

    if Assigned(oJson.Get('fileExt')) then
    begin

      lFileExt := oJson.GetValue<string>('fileExt');


      if lFileExt='.jpg' then
      g:=TJPEGImage.Create;

      if lFileExt='.png' then
      g:=TPNGImage.Create;

      if lFileExt='.bmp' then
      g:=TBitmap.Create;

      //CodeSite.Send('image/4');

      SR := oJson.GetValue<string>('foto');
      Foto := TMemoryStream.Create;
      Foto := TBytesStream.Create(DecodeBase64( SR ));


      Foto.Position := 0;
      g.LoadFromStream(Foto);

      //CodeSite.Send('image/5');

      scFoto.Picture.Graphic := g;

      if Not FileExists( ExtractFilePath(Application.ExeName) + ICSSession.LoginName+lFileExt ) then
      begin

        if Not DirectoryExists( TPath.GetDocumentsPath+'\ICS Profile' ) then
        ForceDirectories( TPath.GetDocumentsPath+'\ICS Profile' );

      end;

      scFoto.Picture.SaveToFile(
         TPath.Combine( TPath.GetDocumentsPath+'\ICS Profile', ICSSession.LoginName+lFileExt ));

      //CodeSite.Send('image/6');

      Foto.Free;
      g.Free;

        if Not DM.FDT_ConfigApp.Active then
        DM.FDT_ConfigApp.Active := True;

        if DM.FDT_ConfigApp.Locate('confname', 'employee' ,[loPartialKey]) then
        begin

          DM.UpdateConfigApp(
            'employee',              //aName
             ICSSession.LoginName,         //aValue
             ICSSession.LoginName+lFileExt,      //aCaption
             '1',       //aVersion
             DateToISO8601( IncHour( Now(),-7 ) , TRUE ) );  //aDateValue

        end;

        DM.FDT_ConfigApp.Active := False;

    end;
  end;

  //CodeSite.Send('image/7-e');

end;

procedure TMainApp.StartButtonClick(Sender: TObject);
begin

  PanelMenu.Visible := Not PanelMenu.Visible;
  if PanelMenu.Visible then
  begin

     PanelMenu.BringToFront;
     //scEdit1.SetFocus;

     scListMenu.setfocus;
     //scListMenu.onItemClick := scListMenuItemClick;

  end else
  scListMenu.onItemClick := nil;
end;

procedure TMainApp.Timer1Timer(Sender: TObject);
//var
  //sTemp : STRING;
  //Days,s,m,Hours,iTemp : INTEGER;
  //TimeStart,TimeEnd: TTime;
  //endDt : TDateTime;

Begin

  {
  endDt := Now;
  TimeStart:= eStartTime;
  TimeEnd  := endDt;

  IF TimeStart<0 THEN TimeStart:=TimeStart*-1; // Makes negative number positive.
  IF TimeEnd<0 THEN TimeEnd:=TimeEnd*-1; // Makes negative number positive.

  sTemp    := TimeToStr(TimeStart-TimeEnd);
  iTemp    := StrToInt(Copy(sTemp,1,2));

  m := StrToInt(Copy(TimeToStr(endDt),4,2));
  s := StrToInt(Copy(TimeToStr(endDt),7,2));

  Days := Trunc(EndDT)-Trunc(eStartTime);   //    Days     := INT(EndDT)-INT(eStartTime);
  IF Days <0 Then Days := Days *-1; // Makes negative number positive.
  Hours:=Days*24+iTemp;

  if (m=1) and (s=1) then
  Begin

    sbDateNow.Caption :=
    Hari_Pasaran( Now )+', '+DateToStr4( Date );

    //StatusText.Caption := 'Update posisi tanggal';

  End;
  }

  if IdleBlock then
  begin
    lbStatusBar.Caption  := Format('System idle time: %d s', [IdleTime]);

    if ( IdleTime > IdleLimit ) then
    begin
      if ( btSingin.Caption <> '&Login' ) then
        acConnect.Execute;
    end;
  end;

  //IntToStr(Hours)+COPY(sTemp,3,6);
end;

procedure TMainApp.scBtnBackConfigClick(Sender: TObject);
begin
  scSV_Config.Opened := False;
end;

procedure TMainApp.scEdit1Change(Sender: TObject);
begin

  if (scEdit1.Text <> '') and (scEdit1.RightButton.Kind <> scgpebClear) then
    scEdit1.RightButton.Kind := scgpebClear
    //scEdit1.RightButton.ImageIndex := 18
  else
  if (scEdit1.Text = '') and (scEdit1.RightButton.Kind <> scgpebSearch) then
    scEdit1.RightButton.Kind := scgpebSearch;

    //scEdit1.RightButton.ImageIndex := 4;
  scListMenu.Filter := scEdit1.Text;
end;

procedure TMainApp.scEdit1RightButtonClick(Sender: TObject);
begin
  if scEdit1.RightButton.Kind = scgpebClear then

  //scEdit1.RightButton.ImageIndex = 18 then
    scEdit1.Text := '';
end;

procedure TMainApp.btMenuDetailClick(Sender: TObject);
begin

   scSplitView1.Opened := Not scSplitView1.Opened;

   if scSplitView1.Opened then
   scSplitView1.DisplayMode := scsvmOverlay
   else
   scSplitView1.DisplayMode := scsvmDocked;


end;

procedure TMainApp.btMenuSetingClick(Sender: TObject);
begin

  PanelMenu.Visible := False;

  //CodeSite.Send('btMenuSetingClick/1');

  CriarAba( TfrmICSOption , 0 );

  //CodeSite.Send('btMenuSetingClick/2');

end;

procedure TMainApp.BuildCatalog_1;
var
  Response: IMVCRESTResponse;
  paramJSON,oRaw,oJson: TJSONObject;  //System.JSON.TJSONObject; //
  oArr : TJsonArray;
  sArr : String;
  i:Integer;
begin

  //Load Catalog Office List ID ------------------------------------------------

  if ( MainApp.ICSSession.SessionID = '' ) then
  exit;

  try

    //CodeSite.Send('$BuildCatalog_1.Add data for UserKey :'+ ICSSession.LoginName );

    paramJSON := System.JSON.TJSONObject.Create;
    paramJSON.AddPair(TJSONPair.Create('USERNAME',  ICSSession.LoginName ));

    Response := ICSMVCRESTRequest( ICSSession , 'ICS_CATALOG_1' , paramJSON  );

    oJSON := TJSONObject.ParseJSONValue( Response.Content ) as TJSONObject;

    //CodeSite.Send('$BuildCatalog_1:'+ oJSON.ToString );

    if oJson.GetValue<string>('responseCode') = '00' then begin

        sArr := oJson.GetValue<string>('5eM3s74');
        sArr := TMSAES( sArr , ICSSession.Dupa ,0 ,atECB);
        oArr := TjsonObject.ParseJsonValue(sArr) as TJSONArray;

        if oArr.Size > 0 then
        begin

          with DM do begin

            FDT_Office.Close;
            FDT_Office.Active:=True;
            if FDT_Office.RecordCount>0 then
            begin

              ListOffice_Vacum.ExecSql;
              //FDT_Office.EmptyDataSet;
            end;

            for i := 0 to oArr.Size-1 do
            begin

              oRaw := oArr.Items[i] as TJSONObject;

              if ( oRaw.GetValue<string>('Id')='000' ) then
              Continue;

              // 4 item
              FDT_Office.Append;
              FDT_Office.Edit;
              FDT_Office.FieldByName('ido').AsString        := oRaw.GetValue<string>('Id');
              FDT_Office.FieldByName('Description').AsString:= oRaw.GetValue<string>('Off_Name');

              FDT_Office.Post;

            end;

            //CodeSite.Send('$Update Punggawa:'+ oJSON.ToString );

            UpdateConfigUser( 'Punggawa' , ICSSession.Punggawa );

            FDT_Office.Active:=False;

          end;
        end;

    end;
  Except

  end;
end;

procedure TMainApp.BuildCatalog_2;
begin
end;

procedure TMainApp.scGPPageControl1Close(Sender: TObject;
  var CanClose: Boolean);
begin

  if MessageDlg('Are You Sure to close this page?',mtCustom,
    [mbYes,mbCancel], 0) = mrYes Then
    CanClose := True else CanClose := False;

end;

procedure TMainApp.scLabelAppMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
 if (Button = mbLeft) and not (ssDouble in Shift) and FMaximized then
 begin
   GetCursorPos(FDownP);
   FDown := True;
 end;
end;

procedure TMainApp.scLabelAppMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  P: TPoint;
  W, H, L, T: Integer;
begin
  if FMaximized and FDown then
  begin
    GetCursorPos(P);
    W := FOldBoundsRect.Width;
    H := FOldBoundsRect.Height;
    L := Round(W * (P.X - Left) / Width);
    T := P.Y - Top;
    FOldBoundsRect.Left := P.X - L;
    FOldBoundsRect.Top := P.Y - T;
    FOldBoundsRect.Right := FOldBoundsRect.Left + W;
    FOldBoundsRect.Height := FOldBoundsRect.Top + H;
    DoRestore;
  end;
end;

procedure TMainApp.scLabelAppMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  FDown := False;
end;

procedure TMainApp.scListMenuClick(Sender: TObject);
Var
//  comp : TComponent;
  sit : string;
  i:integer;
begin

  //CodeSite.send('OnClic/1');
  MyMenuInSelected(Sender);

end;

procedure TMainApp.scListMenuEnter(Sender: TObject);
Var
  comp : TComponent;
begin


  //CodeSite.send('fc/1');
  MyMenuInSelected(Sender);

  // Find component by Name
//  comp := screen.ActiveForm.FindComponent('scListMenu');

//  if comp <> nil then
//  begin
//    CodeSite.send('fc/2/'+comp.name);
//
    //TscAdvancedListBox(comp).Setfocus;
//  end;


//  CodeSite.Send('OnEnter');
//  if Activecontrol = scListMenu then
//  begin
//    CodeSite.send('Item:'+IntToStr(scListMenu.ItemIndex));
//
//    //if scListMenu.ItemIndex<>-1 then
//    //MyMenuInSelected(Sender);
//
//  end;

end;

procedure TMainApp.scListMenuKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key= VK_ESCAPE then

    PanelMenu.Visible := False

  else if Key= VK_RETURN then

  MyMenuInSelected(Sender);





end;

procedure TMainApp.scListMenuKeyPress(Sender: TObject; var Key: Char);
begin
  if (Key in ['a'..'z','A'..'Z',' ','0'..'9']) then
  begin

    //
    scEdit1.EditText := Key;
    scEdit1.Setfocus;

  end;

end;

procedure TMainApp.scPageControl1AfterClose(Sender: TObject);
var
  TabSheet: TscTabSheet;
  TabWidthMin,i : integer;
  FoundIdleOff : boolean;

begin


  FoundIdleOff := False;

  //CodeSite.Send('Total Page:' + IntToStr(scPageControl1.PageCount));

  if ( scPageControl1.PageCount=0 ) then
  begin

    //CodeSite.Send('Clear page');

    //MyBlackPage;

    AppExplorer:=0;

    scPageControl1.Visible := False;
    scPageControl1.SendToBack;

    if ( scImageCollection1.Images[0].Picture <> Nil ) then
    begin

      BorderPanel.WallpaperIndex := 0;

    end
    else
      BorderPanel.WallpaperIndex := -1; //4 Standar ICS

    BorderPanel.Update;
    BorderPanel.Refresh;

    IdleBlock := True;

  end
  else
  begin

    TabWidthMin := (ClientWidth-(200+170)) div scPageControl1.PageCount ;
    scPageControl1.TabWidth := min( TabWidthMax , TabWidthMin );

    if Not FoundIdleOff then
      IdleBlock := True;

    //CodeSite.Send('Close Tab...eof');

  end;

end;

procedure TMainApp.scPageControl1Change(Sender: TObject);
begin
  MyActionSelected(True);
end;

procedure TMainApp.scPageControl1Close(Sender: TObject; var CanClose: Boolean);
var
  AFmSpecialX, AFmSpecialY : TArray<string>;

begin

  AFmSpecialX := TArray<string>.Create(
    TabSheetPrefix +'acStockBarang',
    TabSheetPrefix +'acStockTrack',
    TabSheetPrefix +'acLabeling',
    TabSheetPrefix +'PurchaseOrder',
    TabSheetPrefix +'scTabSheetTfrmCreateTable');

  AFmSpecialY := TArray<string>.Create(
    TabSheetPrefix +'TfrmSaleRegister' );

  //
  //CodeSite.Send(scPageControl1.ActivePage.Name );

  if MatchStr( scPageControl1.ActivePage.Name, AFmSpecialY ) then
  begin

    if Not MyActionFacOnChange then
    begin

      //CodeSite.Send('CanClose : False '+scPageControl1.ActivePage.Name );

      if ( MetroTaskMessageDlg(
        'Perhatian',
         scPageControl1.ActivePage.Caption +' ada perubahan data, mohon untuk selesaikan dahulu kemudian pastikan semuanya clear!',
            mtConfirmation,[mbNo],1) = mrNo ) Then
            CanClose := False else
            CanClose := True;
      Exit;

    end
    else
      CanClose := True;
  end;

  if MatchStr( scPageControl1.ActivePage.Name, AFmSpecialX ) then
  begin

    AppExplorer := AppExplorer-1;

    if AppExplorer<0 then
    AppExplorer :=0;

  end;

end;

procedure TMainApp.scPasswordEdit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = VK_RETURN then
    acConnect.Execute;

end;

procedure TMainApp.scStyledForm1BeforeChangeScale(Sender: TObject);
begin

  MainApp.Constraints.MinWidth := 0;
  MainApp.Constraints.MinHeight := 0;

end;

procedure TMainApp.scStyledForm1ChangeScale(AScaleFactor: Double);
begin
  MainApp.Constraints.MinWidth := scStyledForm1.ScaleInt(700);
  MainApp.Constraints.MinHeight := scStyledForm1.ScaleInt(720);


  //MainApp.Constraints.MinWidth := 0;
  //MainApp.Constraints.MinHeight := 0;

end;

procedure TMainApp.scStyledForm1DWMClientMaximize(Sender: TObject);
begin
  MaxButton.GlyphOptions.Kind := scgpbgkRestore;
end;

procedure TMainApp.scStyledForm1DWMClientRestore(Sender: TObject);
begin
  MaxButton.GlyphOptions.Kind := scgpbgkMaximize;
end;

procedure TMainApp.scSV_ConfigOpened(Sender: TObject);
var
  greatetime, NamePrinter : string;
  dd,mm,yy,myHour, myMin, mySec, myMilli : word;

begin

  DecodeDateTime(Now() ,yy,mm,dd ,myHour, myMin, mySec, myMilli);
  if myHour in [0..11] then
    greatetime := 'Selamat Pagi'

  else if myHour in [12..16] then
    greatetime := 'Selamat Siang'

  else if myHour in [12..16] then
    greatetime := 'Selamat Sore'

  else
    greatetime := 'Selamat Malam';

  scLoginMsg.caption := greatetime + ', Selamat datang di ISS';

  if scUserName.Text = '' then
  scUserName.SetFocus else
  scPasswordEdit1.SetFocus;

end;


{
procedure TMainApp.CriarAbaBase(ClasseForm: TfrmBaseClass; ACaption: String);
var
  Frame: TFrame;
  //intf :IFrame;
  i,TabWidthMin:integer;
  TabSheet: TscTabSheet;
  Aba: TTabSheet;
  tabAda : boolean;
begin

  if Not scPageControl1.Visible then
  begin

    SendMessage(Handle, WM_SETREDRAW, WPARAM(False), 0);

    scPageControl1.Visible := True;
    scPageControl1.BringToFront;

    //scLabelApp.BringToFront;
    CloseButton.BringToFront;
    MaxButton.BringToFront;
    MinButton.BringToFront;
    AccountButton.BringToFront;

    //scStartButton.BringToFront;

    SendMessage(Handle, WM_SETREDRAW, WPARAM(True), 0);

  end;

  tabAda := False;

  try

    Screen.Cursor := crHourglass;

    //DisableAlign;

    Application.ProcessMessages;

    //CodeSite.Send('Total Page:' + IntToStr(scPageControl1.PageCount));

    if (scPageControl1.PageCount>-1) then
    begin

//      scPanel1.WallpaperIndex := -1;
//      scPanel1.Update;
//      scPanel1.Repaint;

      Application.ProcessMessages;

      for i := 0 to scPageControl1.PageCount - 1 do
      begin

        AdvMetroProgressBar1.Position := i;
        if (scPageControl1.Pages[I].Name = TabSheetPrefix + ClasseForm.ClassName) then
        begin

          Aba := scPageControl1.Pages[i];
          scPageControl1.ActivePage := Aba;

          tabAda := True;

          //Aba.Update;
          scPageControl1.UpDateTabs;
          scPageControl1.ActivePage.Repaint;

          //Aba.Refresh;
          //EnableAlign;

          //CodeSite.Send('ics/1/Break');

          Break;

        end;
      end;
    end;

    if Not tabAda then
    begin

      Application.ProcessMessages;

      TabSheet := TscTabSheet.Create(scPageControl1);
      Frame := ClasseForm.Create(TabSheet);

      TabSheet.PageControl:= scPageControl1;
      TabSheet.Caption    := ACaption;
      TabSheet.Name       := TabSheetPrefix + Frame.ClassName;
      Frame.Parent        := TabSheet;
      Frame.Align         := alClient;


    end;


    if scPageControl1.PageCount > -1 then
    begin

      for i := 0 to scPageControl1.PageCount - 1 do
      begin

        //Inc(meter);
        //AdvMetroProgressBar1.Position := i;

        Application.ProcessMessages;


        //Memposisikan TabBaru pada TabActive
        if (scPageControl1.Pages[i].Name = TabSheetPrefix +
           ClasseForm.ClassName) then
        begin

          //CodeSite.Send('ics/1/TabSheet.Show:'+Frame.ClassName);

          if Not tabAda then
          begin

            //Codesite.Send('create new tab');

            if i>0 then
            begin

              DisableAlign;
              //CodeSite.Send('ics/2/TabSheet.Show:'+Frame.ClassName);

              scPageControl1.ActivePageIndex := i-1;
              scPageControl1.ActivePage := TabSheet;
              //Frame.Align := alClient;
              Frame.Show;
              EnableAlign;

              Break;
            end;
          end;
        end;
      end;
    end
    else
    begin

      //CodeSite.Send('ics/3/TabSheet.Show:'+Frame.ClassName);

      scPageControl1.Pages[0].Invalidate;
      scPageControl1.Pages[0].Realign;

      TabSheet.Repaint;

    end;

  finally

    //scPageControl1.Update;

    TabWidthMin := (ClientWidth-(200+170)) div scPageControl1.PageCount ;
    scPageControl1.TabWidth := min( TabWidthMax , TabWidthMin );

    //xCircleMenu := 0;
    AdvMetroProgressBar1.Visible := False;
    AdvMetroProgressBar1.Position := 0;

    Screen.Cursor := crDefault;
  end;
end;
}
end.


