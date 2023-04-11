unit dataModul2;

interface

uses
  System.SysUtils, System.Classes, Data.DB, IPPeerClient,

  //FireDAC.Phys.SQLite,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Stan.ExprFuncs,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.Client, FireDAC.Comp.DataSet, FireDAC.Comp.UI,
  FireDAC.Phys.SQLiteVDataSet,
  //FireDAC.FMXUI.Wait,

  Data.Bind.Components, Data.Bind.ObjectScope,
  //System.JSON,
  System.DateUtils, System.Variants,
  Vcl.Dialogs,

  //Clever Internet Suite
  clTcpClient, clTcpClientTls, clHttp, clHttpRequest,
  clSspiTls, clHttpUtils, REST.Client, REST.Authenticator.OAuth, REST.Types,
  FireDAC.Phys.SQLiteDef, FireDAC.VCLUI.Wait, FireDAC.Stan.StorageBin, cxEdit,
  cxEditRepositoryItems, cxClasses

  {$IF DEFINED (ANDROID)}
  {$ELSEIF DEFINED (MSWINDOWS)}
  ,CodeSiteLogging
  {$ENDIF}
  ;



const
  DB_FILENAME = 'icsgo396.sdb';
  DB_PASSWORD = 'Tanhana5ngruwa';  //  //SQLitePassword
  DB_ENCRYPTION = 'aes-256';      //12345678901234


type
  TDM = class(TDataModule)
    SQLiteConnection: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDSQLiteSecurity: TFDSQLiteSecurity;
    SQLiteCekTable: TFDQuery;
    SQLiteGetCrnDate: TFDQuery;
    FDT_ConfigApp: TFDTable;
    FDT_ConfigAPI: TFDTable;
    QGetConfigApi: TFDQuery;
    QGetApiCount: TFDQuery;
    Q_Config: TFDQuery;
    dsFDT_ConfigApp: TDataSource;
    QMenuActive: TFDQuery;
    MenuItem_Vacum: TFDQuery;
    Insert_FirstApp: TFDQuery;
    QGetConfigApp: TFDQuery;
    MenuApi_Vacum: TFDQuery;
    ListOffice_Vacum: TFDQuery;
    FDT_OFFICE: TFDTable;
    FDT_Dashboard: TFDTable;
    ConfigApp_MasSql: TFDQuery;
    ConfigApp_InsSql: TFDQuery;
    icsRClient: TRESTClient;
    icsRRequest: TRESTRequest;
    icsRResponse: TRESTResponse;
    briRCliX: TRESTClient;
    briRReq: TRESTRequest;
    briRResX: TRESTResponse;
    briOAuth2Authenticator: TOAuth2Authenticator;
    FDT_VaPaymentHist: TFDTable;
    dsPaymentHistory: TDataSource;
    VaPaymentHist_Vacum: TFDQuery;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    QGetDashItem: TFDQuery;
    QGetMenuItem: TFDQuery;
    FDT_MenuItem: TFDTable;
    dsGetDashItem: TDataSource;
    dsFDT_OFFICE: TDataSource;
    SQLiteSDB: TFDConnection;
    SQLiteTransaction: TFDTransaction;
    SQDbCekTable: TFDQuery;
    QueryDB: TFDQuery;
    SQDBUpdMaster: TFDQuery;
    SQDbGetMaster: TFDQuery;
    SQDBGetCrnDate: TFDQuery;
    Dbf_masterTable: TFDQuery;
    Dbf_indexsTable: TFDQuery;
    QuerySL: TFDQuery;
    SQCLiteCekTable: TFDQuery;
    SQLLiteCon: TFDConnection;
    FDLocalSQL1: TFDLocalSQL;
    SLIKREDIT_FDB: TFDMemTable;
    SLIM_FDB: TFDMemTable;
    QSqlLite: TFDQuery;
    SLIKREDIT_FDBxx: TFDMemTable;
    repoMain: TcxEditRepository;
    repoApprovBtn: TcxEditRepositoryButtonItem;
    repoMainHyperLinkItem1: TcxEditRepositoryHyperLinkItem;
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
  private
    { Private declarations }
  public

    procedure InitializeDatabase;
    procedure UpdateConfigUser(const aName, Value : string );
    procedure UpdateConfigApp(const aName, aValue, aCaption, aVersion, aDateValue: string);

    //last: 20221007
    procedure UpdateConfigApi(const aID, aCommand, aValue, aVerb, aContentType,

      aSysDinamis, aSysHeader, aSysBody, aSysExternalId, aApiBody, aDateVersion,
      Ver_Id: string);


  end;

var
  DM: TDM;

implementation

uses
  System.IOUtils, uFunc,
  System.UITypes, MVCFramework.DataSet.Utils;


{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

procedure TDM.DataModuleCreate(Sender: TObject);
begin

    //CodeSite.Send('DM InitializeDatabase...');

    InitializeDatabase;

    {
    //Clever Internet Suite

    FRESTRequest := TclHttpRequest.Create(nil);


    FRESTClient := TclHttp.Create(nil);
    FRESTClient.TimeOut := -1;    //TimeOut * 1000;
    FRESTClient.UseTLS := ctAutomatic;
    FRESTClient.TLSFlags := [tfUseSSL3,tfUseTLS,tfUseTLS11,tfUseTLS12];

    FRESTClient.AuthorizationType := atBasic;

    FRESTClient.Request := FRESTRequest;
    }

end;


{

procedure TForm1.Button1Click(Sender: TObject);
var
  Response: TStrings;
begin
  Memo1.Lines.Clear();
  Response := TStringList.Create();
    try
      clHttp1.Get(edtUrl.Text, Response);
        if SameText('UTF-8', clHttp1.ResponseHeader.CharSet) then
           Memo1.Lines.Text := TclTranslator.TranslateFromUtf8(Response.Text)
        else
          Memo1.Lines.Assign(Response);
    finally
      Response.Free();
    end;
end

function clHTTP_GET(const URL: string; TimeOut: Integer): UTF8String;
var
  Response : TStrings;
  clHttp1 : TclHttp;
begin
  Response := TStringList.Create();
  clHttp1 := TclHttp.Create(nil);
  clHttp1.TimeOut := TimeOut * 1000;
  clHttp1.UseTLS := ctAutomatic;

  clHttp1.TLSFlags := tfUseTLS; //Das ist der Fehler. Hiet m�sste tfUseTLS auf True gesetzt werden.

    try
      clHttp1.Get(URL, Response);
      Result := Response.Text;
    finally
      FreeAndNil(Response);
      FreeAndNil(clHttp1);
    end;
end;

}
procedure TDM.DataModuleDestroy(Sender: TObject);
begin
  {
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTClient);
  }
end;

procedure TDM.InitializeDatabase;
var
  databaseName : String;
begin

  {$IF DEFINED (ANDROID)}
    //SQLiteConnection.Params.Values['Database'] := TPath.GetDocumentsPath + PathDelim + 'dbSample.db';
      databaseName := TPath.Combine(TPath.GetDocumentsPath, DB_FILENAME);

  {$ELSEIF DEFINED (MSWINDOWS)}
      databaseName := TPath.Combine(TPath.GetDocumentsPath, DB_FILENAME);


  {$ENDIF}



  {$IF DEFINED (MSWINDOWS)}

//    CodeSite.Send('Module Create-InitializeDatabase');

//    CodeSite.Send('Seting Database:'+databaseName);

  {$ENDIF}


//  Database=c:\Users\Jaya Lukita\Documents\icsgo396.sdb

//  Password=SQLitePassword
//  Encrypt=aes-256
//  CodeSite.send('CheckDB3');

//  CodeSite.send(TPath.GetDocumentsPath);
//  CodeSite.send(SQLiteConnection.Params.Values['Database']);


  //FDT_Account.TableName := DB_TABLE;
  SQLiteConnection.DriverName     := 'SQLite';

  SQLiteConnection.Params.Clear;
  SQLiteConnection.Params.Add('DriverID=SQLite'); // Same as SQLLiteSDB.DriverName := 'SQLite';
  SQLiteConnection.Params.Add('Database='+databaseName);
  SQLiteConnection.Params.Add('OpenMode=CreateUTF8');
  SQLiteConnection.Params.Add('SharedCache=True');
  SQLiteConnection.Params.Add('LockingMode=Normal');
  SQLiteConnection.Params.Add('SQLiteAdvanced=page_size=4096');
  SQLiteConnection.Params.Add('Password='+DB_PASSWORD );
  //SQLiteConnection.Params.Add('Encrypt=No');
  SQLiteConnection.Params.Add('Encrypt=aes-256');


  //SQLiteConnection.Params.Add('ColumnMetadataSupported=False');

  SQLiteConnection.Params.Add('LockingMode=Normal');
  SQLiteConnection.Params.Add('Synchronous=Normal');
  SQLiteConnection.Params.Add('BusyTimeout=10000');

  SQLiteConnection.UpdateOptions.LockWait := True;

  Try

    if TFile.Exists(SQLiteConnection.Params.Values['Database'])=True then
    begin


      FDSQLiteSecurity.Database := SQLiteConnection.Params.Values['Database'];
      SQLiteConnection.Params.Values['Encrypt'] := DB_ENCRYPTION;

      //SQLiteConnection.Params.Password := DB_PASSWORD;
      //SQLiteConnection.Params.Values['Encrypt'] := DB_ENCRYPTION;

      SQLiteConnection.Open;

    end
    else
    begin

      FDSQLiteSecurity.Database := SQLiteConnection.Params.Values['Database'];
      FDSQLiteSecurity.Password := DB_ENCRYPTION + ':' + DB_PASSWORD;
      FDSQLiteSecurity.SetPassword;

      SQLiteConnection.Open;

    end;

    //***___________________________________________CHECK EXISTING TABLE________


    {$IFDEF MSWINDOWS}
    //CodeSite.Send('Check existing table...' );
    {$ENDIF}

    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'CONFIG_APP';
    SQCLiteCekTable.Open();

//    {$IFDEF MSWINDOWS}
//    CodeSite.Send('DB-CONFIG_APP:['+ IntToStr(SQCLiteCekTable.Fields[0].Value) + ']' );
//    {$ENDIF}

    //LAST: 20220904
    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

      QuerySL.sql.Clear;
      QuerySL.sql.Text :=
      'CREATE TABLE IF NOT EXISTS CONFIG_APP ( '+
      'CONFNAME  varchar(60),'+
      'CONFVALUE varchar(135),'+
      'CONFBLOB  blob,'+
      'CONFCAPTION  varchar(60),'+
      'APP_VERSION  varchar(20),'+
      'APP_UPDATEVERSION  DATETIME,'+
      'UPD_DATE DATETIME,'+
      '/* Keys */'+
      'PRIMARY KEY ( CONFNAME  ));';

//      {$IFDEF MSWINDOWS}
//      CodeSite.Send('DB-2' );
//      {$ENDIF}

      QuerySL.ExecSQL;

//      {$IFDEF MSWINDOWS}
//      CodeSite.Send('DB-3' );
//      {$ENDIF}

      QuerySL.sql.Clear;
      //
      //       QLite.sql.Text :=
      //
      //          'CREATE TRIGGER IF NOT EXISTS validate_CONFIG_APP_before_upd '+
      //          'AFTER UPDATE ON CONFIG_APP '+
      //          'BEGIN '+
      //          ' update CONFIG_APP set upd_date = new.upd_date'+
      //          ' where ( CONFNAME = old.CONFNAME ); '+
      //          'END;';
      //       QLite.ExecSQL;

//      {$IFDEF MSWINDOWS}
//      CodeSite.Send('Insert DB-5' );
//      {$ENDIF}

      Insert_FirstApp.ExecSQL;

//      {$IFDEF MSWINDOWS}
//      CodeSite.Send('DB-6' );
//      {$ENDIF}

    end;


    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'MENUITEMS';
    SQCLiteCekTable.Open();

//    {$IFDEF MSWINDOWS}
//    CodeSite.Send('DB-MENUITEMS:['+ IntToStr(SQCLiteCekTable.Fields[0].Value) + ']' );
//    {$ENDIF}

    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

       //LAST: 20220908 Add Field "ApiLink"
       QuerySL.sql.Clear;
       QuerySL.sql.Text :=
        'CREATE TABLE IF NOT EXISTS MENUITEMS ( '+
        'REG_ID           INTEGER NOT NULL,'+
        'ITEM_TAG         SMALLINT NOT NULL,'+
        'ITEM_CLASS       VARCHAR(30) NOT NULL,'+
        'APIKEY_ID        VARCHAR(15),'+   //Last: 20220908
        'API_COMMAND      VARCHAR(32),'+   //Last: 20220912
        'STATUS           BOOLEAN DEFAULT FALSE ,'+
        'GROUPINDEX       SMALLINT NOT NULL,'+
        'GROUPHEADER      VARCHAR(60),'+
        'MENUCATEGORY     VARCHAR(60),'+
        'IMAGEINDEX       SMALLINT,'+
        'IMAGE_ICON       BLOB,'+
        'TITLE1           VARCHAR(60),'+
        'TILE1_ALING      SMALLINT,'+
        'TILE1_FONTSIZE   SMALLINT,'+
        'TILE1_IDENTHORZ  SMALLINT,'+
        'TILE1_IDENTVERT  SMALLINT,'+
        'TILE1_COLOR      VARCHAR(15),'+
        'TITLE2           VARCHAR(60),'+
        'TILE2_ALING      SMALLINT,'+
        'TILE2_FONTSIZE   SMALLINT,'+
        'TILE2_IDENTHORZ  SMALLINT,'+
        'TILE2_IDENTVERT  SMALLINT,'+
        'TILE2_COLOR      VARCHAR(15),'+
        'TILE_SIZE        SMALLINT,'+
        'TILE_BORDER      VARCHAR(15),'+
        'TILE_BEGINCOLOR  VARCHAR(15),'+
        'TILE_ENDCOLOR    VARCHAR(15),'+
        'PRIMARY KEY ( REG_ID, ITEM_TAG ) )';

//      {$IFDEF MSWINDOWS}
//      CodeSite.Send('DB-7.1' );
//      {$ENDIF}

      QuerySL.ExecSQL;

//      {$IFDEF MSWINDOWS}
//      CodeSite.Send('DB-7.2' );
//      {$ENDIF}

    end;

    //LAST: 20220904
    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'DASHBOARD';
    SQCLiteCekTable.Open();

    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

       QuerySL.sql.Clear;
       QuerySL.sql.Text :=
        'CREATE TABLE IF NOT EXISTS DASHBOARD ( '+
          'REG_ID           INTEGER NOT NULL,'+
          'GROUPINDEX       SMALLINT NOT NULL,'+
          'APIKEY           VARCHAR(10),'+
          'TITLE            VARCHAR(60),'+
          'IMAGEINDEX       SMALLINT,'+
        'PRIMARY KEY ( REG_ID, GROUPINDEX ) )';

      QuerySL.ExecSQL;

    end;

    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'CONFIG_API';
    SQCLiteCekTable.Open();

//    {$IFDEF MSWINDOWS}
//    CodeSite.Send('DB-CONFIG_API:['+ IntToStr(SQLiteCekTable.Fields[0].Value) + ']' );
//    {$ENDIF}
//
    //LAST: 20220904
    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

      QuerySL.sql.Clear;
      QuerySL.sql.Text :=
      'CREATE TABLE IF NOT EXISTS CONFIG_API( '+
      'Api_Id    integer,'+                           //1
      'Api_Command  varchar(32),'+                    //2
      'Verb         varchar(15),'+   //last: 20221001 //3
      'ContentType  varchar(80),'+   //last: 20221001 //4
      'Api_Value    varchar(132),'+                  //5
      'SysDinamis   BOOLEAN DEFAULT FALSE ,'+        //6
      'SysHeader    BOOLEAN DEFAULT FALSE ,'+        //7
      'SysBody      BOOLEAN DEFAULT FALSE ,'+        //8
      'SysExternal  BOOLEAN DEFAULT FALSE ,'+        //9
      'ApiBody      BLOB,'+                          //10
      'DateVersion  DATETIME,'+
      'Ver_Id       integer,'+
      'UPD_DATE     DATETIME,'+
      '/* Keys */'+
      'PRIMARY KEY ( Api_Id,Api_Command ));';

      QuerySL.ExecSQL;
    end;

    //Temp Office List

    //LAST: 20220904
    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'CAT_OFFICE';
    SQCLiteCekTable.Open();

    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

       QuerySL.sql.Clear;
       QuerySL.sql.Text :=
        'CREATE TABLE IF NOT EXISTS CAT_OFFICE ( '+
          'IDO              VARCHAR(3),'+
          'DESCRIPTION      VARCHAR(60),'+
          'IMAGEINDEX       SMALLINT,'+
        'PRIMARY KEY ( IDO ) )';

      QuerySL.ExecSQL;

    end;

    //DIRECTORY DATABASE CLIPPER
    //LAST: 20221209
    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'DIR_SERVER';
    SQCLiteCekTable.Open();

    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

       QuerySL.sql.Clear;
       QuerySL.sql.Text :=
        'CREATE TABLE IF NOT EXISTS DIR_SERVER( '+
          'IDO          CHAR(3), '+
          'OLD_ID       CHAR(2), '+
          'DESCRIPTION  VARCHAR(60),'+
          'REC_DATA     VARCHAR(90),'+
          'REC_CATA     VARCHAR(90),'+
          'ACC_DATA     VARCHAR(90),'+
          'ACC_CATA     VARCHAR(90),'+
        'PRIMARY KEY ( IDO ) )';

      QuerySL.ExecSQL;

    end;

    //DIRECTORY DATABASE CLIPPER
    //LAST: 20221209
    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'DIR_DUMMY';
    SQCLiteCekTable.Open();

    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

       QuerySL.sql.Clear;
       QuerySL.sql.Text :=
        'CREATE TABLE IF NOT EXISTS DIR_DUMMY( '+
          'IDO          CHAR(3), '+
          'OLD_ID       CHAR(2), '+
          'DESCRIPTION  VARCHAR(60),'+
          'REC_DATA     VARCHAR(90),'+
          'REC_CATA     VARCHAR(90),'+
          'ACC_DATA     VARCHAR(90),'+
          'ACC_CATA     VARCHAR(90),'+
        'PRIMARY KEY ( IDO ) )';

      QuerySL.ExecSQL;

    end;

    //DIRECTORY DATABASE CLIPPER
    //LAST: 20221209
    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'DBF_MASTER';
    SQCLiteCekTable.Open();

    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

       QuerySL.sql.Clear;
       QuerySL.sql.Text :=
        'CREATE TABLE IF NOT EXISTS DBF_MASTER( '+
        'DB_NAME     VARCHAR(20),'+
        'FIELD_NAME  VARCHAR(16),'+
        'FIELD_TYPE  VARCHAR(20),'+
        'FIELD_SIZE  NUMERIC (18, 2),'+
        'FIELD_DEC   NUMERIC (18, 2),'+
        'DATA_TYPE   VARCHAR(20),'+
        'DESCRIPT    VARCHAR(50),'+
        'FIELD_KEY   INTEGER,'+
        'FIELD_SEC   INTEGER,'+      //Last: 20230216
        '/* Checks */'+

        'ENABLED_1   CHAR(1) DEFAULT (' + QuotedStr('T') +
                ') CHECK (ENABLED_1 IN (' + QuotedStr('T')+
                ','+ QuotedStr('F')+')),'+

        'AUTOINC_INT BOOLEAN DEFAULT FALSE ,'+

        'PRIMARY KEY ( DB_NAME,FIELD_NAME ) )';

        //CHECK ( ENABLED_TF IN ('T', 'F') )

      QuerySL.ExecSQL;

    end;

    //LAST: 20221209
    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'DBF_INDEXS';
    SQCLiteCekTable.Open();

    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

       QuerySL.sql.Clear;
       QuerySL.sql.Text :=
        'CREATE TABLE IF NOT EXISTS DBF_INDEXS( '+
        'DB_NAME     VARCHAR(20),'+
        'NTX_ORD       INTEGER,'+
        'TYPEINDEX     VARCHAR(10),'+
        'INDEX_NAME    VARCHAR(20),'+
        'EXPRESSION    VARCHAR(50),'+
        'INDEXNAME     VARCHAR(20),'+
        '"DESCENDING"  VARCHAR(5),'+
        'PATH_IDX      INTEGER,'+
        'STATUS        VARCHAR(5),'+
        'PERIODTYPE    VARCHAR(8),'+
        'PRIMARY KEY ( DB_NAME,NTX_ORD ) )';

      QuerySL.ExecSQL;

    end;


    //Adapter Table VA Payment Report - 20221116
    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'VA_PAYMENTHISTORY';
    SQCLiteCekTable.Open();

    //LAST: 20220904
    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

      QuerySL.sql.Clear;
      QuerySL.sql.Text :=
      'CREATE TABLE IF NOT EXISTS VA_PAYMENTHISTORY( '+
      'Va_Number      varchar(20),'+
      'Jurnal_No      Integer,'+   //tellerid
      'Api_Id         integer,'+

      'PaymentDate    DATETIME,'+
      'Pay_Amount     FLOAT,'+  //

      'IdWil          varchar(3),'+
      'NamaKantor     varchar(30),'+
      'idRes          varchar(2) ,'+
      'Bill_ToRek     varchar(15) ,'+
      'relese_date    DATETIME,'+
      'plafond        FLOAT,'+  //
      'outstanding    FLOAT,'+  //
      'tagihan        FLOAT,'+  //
      'kode_bunga     varchar(15),'+
      'ta             varchar(15),'+

      'nama           varchar(50),'+
      'keterangan     varchar(60),'+
      'region         varchar(30),'+
      'sector         varchar(30),'+
      'village        varchar(30),'+
      'scope_village  varchar(20),'+
      'postal_code    varchar(30),'+
      'address_line1  varchar(60),'+
      'phone          varchar(20),'+

      '/* Keys */'+
      'PRIMARY KEY ( Va_Number,Jurnal_No ));';

      QuerySL.ExecSQL;
    end;


    CodeSite.Send('Check existing table-SECACCOUNT' );

    //Adapter Table PERMISSIONS - 20221226
    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'SECACCOUNT';
    SQCLiteCekTable.Open();

    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

      QuerySL.sql.Clear;
      QuerySL.sql.Text :=
      'CREATE TABLE IF NOT EXISTS SECACCOUNT( '+
      'LOGINNAME     VARCHAR(40) NOT NULL,'+
      'USERID        INTEGER,'+
      'FULLNAME      VARCHAR(50),'+
      'PWD           VARCHAR(40),'+
      'LASTACCESS    TIMESTAMP,'+
      'ENABLED       CHAR(1),'+
      'CREATEDDATE   TIMESTAMP,'+
      'LASTACCTIME   TIME,'+
      'CREATEDTIME   TIME,'+
      'ACCESSCOUNT   INTEGER,'+
      'PWD_CREATE    TIMESTAMP,'+
      'EMAIL         VARCHAR(50),'+
      'HOME_TELP     VARCHAR(15),'+
      'PHONSEL       VARCHAR(15),'+
      'GENDER        SMALLINT,'+
      'TYPE_IMG      SMALLINT,'+
      'FOTOPROFILE   BLOB ,'+
      'ACCOUNT_TYPE  INTEGER DEFAULT 0,'+
      'ACCESS_PID    INTEGER DEFAULT 1 ,'+

      '/* Keys */'+
      'PRIMARY KEY ( LOGINNAME ));';

      QuerySL.ExecSQL;

      CodeSite.Send('Create table-SECACCOUNT' );

    end;

    //20221226
    //Adapter Table PERMISSIONS - 20221226
    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'PERMISSIONS';
    SQCLiteCekTable.Open();

    CodeSite.Send('Check existing table-PERMISSIONS' );

    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

      QuerySL.sql.Clear;
      QuerySL.sql.Text :=
      'CREATE TABLE IF NOT EXISTS PERMISSIONS( '+
      'PERMISSION     varchar(40),'+
      'ITEMS          Blob,'+
      'ACTIONS        integer,'+
      'FORMNAME       varchar(40),'+
      'CAPTION        varchar(40),'+

      '/* Keys */'+
      'PRIMARY KEY ( PERMISSION ));';

      QuerySL.ExecSQL;

      CodeSite.Send('Create table-PERMISSIONS' );
    end;

    //Adapter Table PERMISSIONS - 20221226
    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'POLICIES';
    SQCLiteCekTable.Open();

    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

      QuerySL.sql.Clear;
      QuerySL.sql.Text :=
      'CREATE TABLE IF NOT EXISTS POLICIES( '+
      'POLICIES       VARCHAR(40),'+
      'FORMNAME       VARCHAR(40),'+
      'ITEMS          BLOB,'+
      'ACTIONS        INTEGER,'+
      '/* Keys */'+
      'PRIMARY KEY ( FORMNAME,POLICIES ));';

      QuerySL.ExecSQL;
    end;

    //Table LOC_REGION - 20230216
    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'LOC_REGION';
    SQCLiteCekTable.Open();

    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

      QuerySL.sql.Clear;
      QuerySL.sql.Text :=
      'CREATE TABLE IF NOT EXISTS LOC_REGION( '+
      'REG_IDN     INTEGER NOT NULL,'+
      'PRO_IDN     INTEGER,'+
      'REGION      VARCHAR(30),'+
      'PROVINCE    VARCHAR(30),'+
      'NASIONAL    VARCHAR(60),'+
      'STATUS_ADM  VARCHAR(15) DEFAULT '+ QuotedStr('')+' NOT NULL ,'+   //DEFAULT ''
      'LATITUDE    NUMERIC(15,11),'+
      'LONGITUDE   NUMERIC(15,11),'+
      '/* Keys */'+
      'PRIMARY KEY ( REG_IDN ));';

      QuerySL.ExecSQL;
    end;

    //Table LOC_SECTOR - 20230216
    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'LOC_SECTOR';
    SQCLiteCekTable.Open();

    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

      QuerySL.sql.Clear;
      QuerySL.sql.Text :=
      'CREATE TABLE IF NOT EXISTS LOC_SECTOR( '+
      'REG_IDN     INTEGER NOT NULL,'+
      'SEC_IDN     INTEGER,'+
      'SECTOR      VARCHAR(50),'+
      'STATUS_ADM  VARCHAR(15) DEFAULT '+ QuotedStr('')+' NOT NULL ,'+   //DEFAULT ''
      '/* Keys */'+
      'PRIMARY KEY ( SEC_IDN ));';

      QuerySL.ExecSQL;
    end;

    //Table LOC_VILLAGE - 20230216
    SQCLiteCekTable.Close;
    SQCLiteCekTable.Prepare;
    SQCLiteCekTable.ParamByName('TableName').AsString := 'LOC_VILLAGE';
    SQCLiteCekTable.Open();

    if SQCLiteCekTable.Fields[0].Value=0 then  //0=Tidak ada, 1=ada
    begin

      QuerySL.sql.Clear;
      QuerySL.sql.Text :=
      'CREATE TABLE IF NOT EXISTS LOC_VILLAGE( '+
      'SEC_IDN     INTEGER NOT NULL,'+
      'VIL_IDN     INTEGER NOT NULL,'+
      'VILLAGE     VARCHAR(50),'+
      'CDATE       DATE,'+
      'CTIME       VARCHAR(9),'+
      'POSTCODE    INTEGER,'+
      'STATUS_ADM  VARCHAR(15) DEFAULT '+ QuotedStr('')+' NOT NULL ,'+   //DEFAULT ''
      '/* Keys */'+
      'PRIMARY KEY ( SEC_IDN, VIL_IDN ));';

      QuerySL.ExecSQL;
    end;





    //_________________________________________________________________________//
    if Not FDT_ConfigApp.Active then
    FDT_ConfigApp.Active := True;

  Except

    on E: Exception do
    begin

      ShowMessage( e.Message );

    end;
  end;

  //TTask.Run(procedure begin
  //  FDT_ConfigApp.Open;
  //end);



end;

procedure TDM.UpdateConfigApi(const aID, aCommand, aValue, aVerb, aContentType,
  aSysDinamis, aSysHeader, aSysBody, aSysExternalId, aApiBody, aDateVersion,
  Ver_Id: string);
var
  dUpdVer : TDateTime;

begin

  with DM do
  begin

    try

      if Not FDT_ConfigAPI.Active then
      FDT_ConfigAPI.Active := True;

      // if mtbRekap.Locate( 'RESORT;IDHARI',
      //                    VarArrayOf([ dmHimawanFD.dsRef_Resort.DataSet.FieldByName('RESORT').AsString ,
      //                    xH ]),
      //                    [loCaseInsensitive]) then

      if Not FDT_ConfigAPI.Locate('Api_Id;Api_Command',
        VarArrayOf([AId,aCommand]), [loCaseInsensitive]) then
      begin
        FDT_ConfigAPI.Append;
        FDT_ConfigAPI.FieldByName('Api_Id').AsString := aID;
        FDT_ConfigAPI.FieldByName('Api_Command').AsString   := aCommand;

      end
      else
      begin
        FDT_ConfigAPI.Edit;
      end;

      if not IsEmptyOrNull(aApiBody) then begin
        FDT_ConfigAPI.Fields[9].Value :=  aApiBody;
      end else begin
        FDT_ConfigAPI.Fields[9].Clear;
        //FDT_ConfigAPI.Fields[9].Bound := True;
      end;

      FDT_ConfigAPI.FieldByName('Api_Value').AsString   := aValue;
      FDT_ConfigAPI.FieldByName('Verb').AsString        := aVerb;
      FDT_ConfigAPI.FieldByName('ContentType').AsString := aContentType;

      FDT_ConfigAPI.FieldByName('SysDinamis' ).AsBoolean := iif( aSysDinamis='TRUE',TRUE,FALSE );
      FDT_ConfigAPI.FieldByName('SysHeader'  ).AsBoolean := iif( aSysHeader='TRUE',TRUE,FALSE );
      FDT_ConfigAPI.FieldByName('SysBody'    ).AsBoolean := iif( aSysBody='TRUE',TRUE,FALSE );
      FDT_ConfigAPI.FieldByName('SysExternal').AsBoolean := iif( aSysExternalId='TRUE',TRUE,FALSE );

      FDT_ConfigAPI.FieldByName('DateVersion').AsDateTime:= ISO8601ToDate(aDateVersion);
      FDT_ConfigAPI.FieldByName('Ver_Id').AsInteger      := StrToInt(Ver_Id);

      FDT_ConfigAPI.FieldByName('Upd_Date').AsDateTime   := Now();

      FDT_ConfigAPI.Post;
    finally
      FDT_ConfigAPI.Active := False;
    end;
  end;
end;

procedure TDM.UpdateConfigApp(const aName, aValue, aCaption, aVersion,
  aDateValue: string);
var
  dUpdVer : TDateTime;

begin

  try

    if Not FDT_ConfigApp.Active then
    FDT_ConfigApp.Active := True;

    if Not FDT_ConfigApp.Locate('confname', aName,[loCaseInsensitive]) then
    begin
      FDT_ConfigApp.Append;
      FDT_ConfigApp.FieldByName('confname').AsString := aName;

      {$IFDEF MSWINDOWS}
      CodeSite.Send('Append ConfName:'+ aName );
      {$ENDIF}

    end
    else
    begin
      FDT_ConfigApp.Edit;

      {$IFDEF MSWINDOWS}
      CodeSite.Send('Edit on :'+ aName );
      {$ENDIF}

    end;

    FDT_ConfigApp.FieldByName('confvalue').AsString   := aValue;
    FDT_ConfigApp.FieldByName('confcaption').AsString := aCaption;

//    bBody := TStringList.Create();
//    bBody.Text := aValue;
//
//    BlobField := FDT_ConfigApp.FieldByName('ApiBody');
//    BS :=  FDT_ConfigApp.CreateBlobStream( BlobField , bmWrite );

    FDT_ConfigApp.FieldByName('app_version').AsInteger := StrToInt(aVersion);
    FDT_ConfigApp.FieldByName('app_updateversion').AsDateTime := ISO8601ToDate(aDateValue);
    FDT_ConfigApp.FieldByName('upd_date').AsDateTime:= Now();
    FDT_ConfigApp.Post;

    //bBody.Free;

  finally

    FDT_ConfigApp.Active := False;

  end;

end;

procedure TDM.UpdateConfigUser(const aName, Value: string);
begin

  try
    if Not FDT_ConfigApp.Active then
    FDT_ConfigApp.Active := True;

    if Not FDT_ConfigApp.Locate('confname', aName,[loCaseInsensitive]) then
    begin
      FDT_ConfigApp.Append;
      FDT_ConfigApp.FieldByName('confname').AsString := aName;
    end
    else
      FDT_ConfigApp.Edit;

    FDT_ConfigApp.FieldByName('confvalue').AsString := Value;
    FDT_ConfigApp.FieldByName('upd_date').AsDateTime:= Now();
    FDT_ConfigApp.Post;
  finally
    FDT_ConfigApp.Active := False;
  end;

end;


end.

