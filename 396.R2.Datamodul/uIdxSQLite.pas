//  Data Modul untuk Membuat Database and Create Table SQLite
//  (c) Created by Jaya Lukita

// 20200917 Create
// 20210426 Add AutoIncrement Arcitecture

unit uIdxSQLite;

interface

uses
  Data.DB, System.Classes, Vcl.StdCtrls, ComCtrls,  Vcl.Mask,
  System.SysUtils, System.StrUtils, Dialogs,
  //ExtCtrls,

  //FIREDAC

  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.IBBase,
  FireDAC.Stan.StorageBin,
  FireDAC.Phys.SQLite, FireDAC.Stan.ExprFuncs,
  FireDAC.Phys.SQLiteVDataSet, FireDAC.VCLUI.Wait, FireDAC.Comp.UI,

  //Special
  SQLiteTable3,

  //MyStar last: 20221221
  DataModul2, ufunc

  //CodeSite
  ,CodeSiteLogging
  ;

Type TKeySample = Class
  Public
  FieldName : String;
  SortOrder : Byte;
  Constructor Create( FieldName : String ; SortOrder: Integer );
end;

type aSLTable =  record
  sl_NAME : string;
  sl_TYPE : string;
  sl_SIZE : integer;
  sl_KEY  : integer;
  sl_AUTOINC : boolean;
end;

type TFSQLIndexes = record
  VALUE_1   : string;
  VALUE_2   : string;
  VALUE_3   : string;
  VALUE_4   : string;
  VALUE_5   : string;
  DTYPE_1   : string;
  DTYPE_2   : string;
  DTYPE_3   : string;
  DTYPE_4   : string;
  DTYPE_5   : string;
  DESCENDING: boolean;
  PROCESS   : boolean;
  TYPEINDEX : string;

end;

type TSLICS_UpdateMaster = Record
  idwil      : string;
  periode    : string;
  table_name : string;
  type_data  : String;
  crt_date   : TDate;
  upd_date   : TDateTime;
end;

type
  TSQLIteIndexes = class


  private

    FGenTableName: string;      // parameter GenTable
    FTableName: string;
    FDatabase: string;
    FGenTable: string;
    FOfficeID: string;
    FSQL_Index: TFDQuery;   //FDatabase
    FSQL_Master: TFDQuery;  //20190523


    // String for GenTableName
    function GetGenTableName: string;
    procedure SetGenTableName(const GenTableName: string);

    function GetTableName: string;
    procedure SetTableName(const Value: string);

    function GetDatabase: string;
    procedure SetDatabase(const Value: string);

    //String for officeID
    function GetOfficeID: string;
    procedure SetOfficeID(const Value: string);


    // String for Database
    function GetSQL_IndexFD: TFDQuery;  //function GetDatabase: TIBDatabase;
    procedure SetSQL_IndexFD( AFDQuery : TFDQuery );

    function GetSQL_MasterFD: TFDQuery;
    procedure SetSQL_MasterFD( AFDQuery : TFDQuery );

  public

    IndexSQL : array of TFSQLIndexes ;

    constructor Create;
    destructor Destroy; override;

    property GenTableName: string read GetGenTableName Write SetGenTableName;
    property Database : string read GetDatabase write SetDatabase;
    property TableName    : string read GetTableName Write SetTableName;
    property OfficeID : string read GetOfficeID Write SetOfficeID;

    property SQL_Index: TFDQuery read GetSQL_IndexFD Write SetSQL_IndexFD;
    property SQL_Master: TFDQuery read GetSQL_MasterFD Write SetSQL_MasterFD;

    procedure SLCreateTable(SLIndexes:TSQLIteIndexes ; goCreateNew : Boolean = True  );
    procedure SLCheckInMaster(SLIndexes:TSQLIteIndexes );
    procedure SLDbConInMaster(SLIndexes:TSQLIteIndexes );
    procedure SLDbConnection(SLIndexes:TSQLIteIndexes );
    procedure SLUpdateInMaster(SLData:TSLICS_UpdateMaster);
    procedure SLDbComand(SLIndexes:TSQLIteIndexes ; sql:TStrings);
    //procedure SLSuspenMaster(SLData:TSLICS_UpdateMaster; AutoCallCulation:Boolean);
    function SLSuspenMaster(SLData: TSLICS_UpdateMaster; AutoCallCulation:Boolean ):Boolean;

  end;


implementation

{ TKeySample }

constructor TKeySample.Create(FieldName: String ; SortOrder: Integer );
begin

  Self.FieldName := FieldName;
  Self.SortOrder := SortOrder;

end;


{ TSQLIteIndexes }

constructor TSQLIteIndexes.Create;
begin
  inherited Create;


end;

destructor TSQLIteIndexes.Destroy;
begin

  inherited;

end;



procedure TSQLIteIndexes.SetGenTableName(const GenTableName: string);
begin

  FGenTableName := GenTableName;
  //CodeSite.send('Set GetGenTable :['+GenTableName+']');
end;

procedure TSQLIteIndexes.SetOfficeID(const Value: string);
begin
  FOfficeID := Value;
end;

function TSQLIteIndexes.GetOfficeID: string;
begin
  Result := FOfficeID;
end;

function TSQLIteIndexes.GetGenTableName: string;
begin

  //CodeSite.send('Read GetGenTable :['+FGenTableName+']');

  Result := FGenTableName;

end;

procedure TSQLIteIndexes.SetDatabase(const Value: string);
begin
  FDatabase := Value;
end;

function TSQLIteIndexes.GetDatabase: string;
begin
  Result := FDatabase;
end;

function TSQLIteIndexes.GetSQL_IndexFD: TFDQuery;
begin
  Result := FSQL_Index;
end;

function TSQLIteIndexes.GetSQL_MasterFD: TFDQuery;
begin
  Result := FSQL_Master;
end;


procedure TSQLIteIndexes.SetSQL_IndexFD(AFDQuery: TFDQuery);
begin
  FSQL_Index := AFDQuery;
end;

procedure TSQLIteIndexes.SetSQL_MasterFD(AFDQuery: TFDQuery);
begin
  FSQL_Master := AFDQuery;
end;

procedure TSQLIteIndexes.SetTableName(const Value: string);
begin
  FTableName := Value;
end;

function TSQLIteIndexes.GetTableName: string;
begin
  Result := FTableName;
end;


procedure TSQLIteIndexes.SLCheckInMaster(SLIndexes: TSQLIteIndexes);
begin

  //CodeSite.Send('---SQLite SLCheckInMaster---');

  DM.QueryDB.Close;

  With DM DO
  begin

    //CodeSite.Send('SQLite DB Test Create');


    if SQLiteSDB.Connected then
    SQLiteSDB.Connected := False;

    //SQLiteSDB.ConnectionName := 'ICS_db3';
    //SQLiteSDB.ConnectionDefName:='SQLite_ICS';
    SQLiteSDB.DriverName     := 'SQLite';
    //SQLiteSDB.dri     := dmHimawanFD.FDPhysFBDriverLink1; //FDPhysSQLiteDriverLink1;
    //;

    //CodeSite.Send('---ICS SQLite:['+SLIndexes.Database+']');

    SQLiteSDB.Params.Clear;
    SQLiteSDB.Params.Add('DriverID=SQLite'); // Same as SQLLiteSDB.DriverName := 'SQLite';
    SQLiteSDB.Params.Add('Database='+SLIndexes.Database);
    SQLiteSDB.Params.Add('OpenMode=CreateUTF8');
    SQLiteSDB.Params.Add('SharedCache=True');
    SQLiteSDB.Params.Add('SQLiteAdvanced=page_size=4096');
    //SQLiteSDB.Params.Add('ColumnMetadataSupported=False');
    SQLiteSDB.Params.Add('LockingMode=Normal');
    SQLiteSDB.Params.Add('Synchronous=Normal');
    SQLiteSDB.Params.Add('BusyTimeout=10000');
    SQLiteSDB.UpdateOptions.LockWait := True;

    //
    //1st Check or Create ICS_SL Database!
    //CodeSite.Send('---Mastering ICS SQLite FDAC---');

    if Not FileExists(SLIndexes.Database) then
    begin

      //CodeSite.Send('---SQLite Create ICS_sdb:'+SLIndexes.Database);

      SLDbConInMaster(SLIndexes);
      //SQLiteSDB.ExecSQL('ATTACH '+QuotedStr(SLIndexes.Database)+' AS db3' ) ;

      //SQLiteSDB.Offline;
      //SQLiteSDB.Online;
    end;

    SQLiteSDB.Open();



  end;

end;

procedure TSQLIteIndexes.SLCreateTable(SLIndexes:TSQLIteIndexes ; goCreateNew: Boolean);
var
  x  : integer;
  bCreateTable : boolean;

  //sldb: TSQLiteDatabase;
  //sltb: TSQLIteTable;
  sIndex: String;
  //SQL : TStringList;
  //sSQL,
  //Var for Create Primary Key
  KeyTable : TKeySample;
  KeyTables: Array of TKeySample;
  List : TStringList;

  acTable : array of aSLTable;
  acIndex : array of aSLTable;
  acAutoInc : boolean;

  crt_Date: TDateTime;
  i,j,ikey : integer;
  ASLData: TSLICS_UpdateMaster;

begin

  CodeSite.Send('1:Create Table :['+SLIndexes.TableName+']');
  CodeSite.Send('2:Gen Table    :['+SLIndexes.GenTableName+']');

  with DM do
  begin

    SQDBCekTable.Close;
    SQDBCekTable.Prepare;
    SQDBCekTable.ParamByName('TableName').AsString :=SLIndexes.TableName ;
    SQDBCekTable.Open();

    if SQDBCekTable.Fields[0].Value <=0 then
    bCreateTable := True;

    CodeSite.Send('3:'+iif( bCreateTable , 'Create','Ready' ));

    if bCreateTable then
    begin

      if LengTh(SLIndexes.TableName) = 0 then
        exit;

      if LengTh(SLIndexes.GenTableName) = 0 then
        exit;

      Dbf_masterTable.Close;
      Dbf_masterTable.Prepare;
      Dbf_masterTable.ParamByName('DB_NAME').AsString := SLIndexes.GenTableName;
      Dbf_masterTable.Open;

      x := 0;

      if Not Dbf_masterTable.Eof then
      begin

        SetLength( aCTable , Dbf_masterTable.RecordCount );

        acAutoInc := False;

        CodeSite.Send('3:Create Field Table :['+InttoStr(Dbf_masterTable.RecordCount)+']');

        while (Not Dbf_masterTable.Eof) do
        begin

          aCTable[x].sl_NAME := Trim(Dbf_masterTable.FieldByName('FIELD_NAME').AsString);
          aCTable[x].sl_TYPE := Trim(Dbf_masterTable.FieldByName('DATA_TYPE').AsString);
          aCTable[x].sl_SIZE := Dbf_masterTable.FieldByName('FIELD_SIZE').AsInteger;
          aCTable[x].sl_KEY  := Dbf_masterTable.FieldByName('FIELD_KEY').AsInteger;

          //AutoIncrement Field, just one field Primary key with Integer Data Type
          //202104
          aCTable[x].sl_AUTOINC := Dbf_masterTable.FieldByName('AUTOINC_INT').AsBoolean;

          Inc(x);
          Dbf_masterTable.Next;

        end;

        try

          if (goCreateNew=True) and (bCreateTable=False) then
          begin

            bCreateTable := True;

            CodeSite.Send('Drop Table '+TableName);

            if Not SQLiteTransaction.Active then
              SQLiteTransaction.StartTransaction;

            QueryDB.SQL.Clear;
            QueryDB.SQL.Text := 'DROP TABLE '+TableName;
            QueryDB.ExecSQL;

            if SQLiteTransaction.Active then
              SQLiteTransaction.Commit;


          end;

          CodeSite.Send('C1');

          if Not SQLiteTransaction.Active then
            SQLiteTransaction.StartTransaction;

          CodeSite.Send('C2');

          QueryDB.SQL.Clear;
          QueryDB.SQL.Add('CREATE TABLE IF NOT EXISTS '+ TableName +' (' );

          //Step 1
          CodeSite.Send('C3');

          iKey := 0;

          for i := Low(aCtable) to High(aCtable) do
          begin                                 //      0          1

            case AnsiIndexText( aCtable[i].sl_TYPE,
              ['ftString',        //0
               'ftFloat',         //1
               'ftDate',          //2
               'ftDateTime',      //3  //Insert last 2 AddNew !
               'ftInteger',       //4
               'ftCurrency',      //5
               'ftBoolean',       //6
               'ftTime']) of      //7  202104

              0: QueryDB.SQL.Add( '['+aCtable[i].sl_NAME +'] VARCHAR ('+
                IntToStr( aCtable[i].sl_SIZE )  +')');

              1: QueryDB.SQL.Add( '['+aCtable[i].sl_NAME +'] FLOAT ');
              2: QueryDB.SQL.Add( '['+aCtable[i].sl_NAME +'] DATE ');   //date Format: "YYYY-MM-DD"
              3: QueryDB.SQL.Add( '['+aCtable[i].sl_NAME +'] DATETIME ');
              4: begin

                  //last 202104 Auto Increment Feature
                  if Not aCtable[i].sl_AUTOINC then
                  QueryDB.SQL.Add( '['+aCtable[i].sl_NAME +'] INTEGER ')
                  else
                  begin
                    QueryDB.SQL.Add( '['+aCtable[i].sl_NAME +'] integer NOT NULL PRIMARY KEY AUTOINCREMENT');
                    acAutoInc := True;
                  end;
                 end;
              5: QueryDB.SQL.Add( '['+aCtable[i].sl_NAME +'] FLOAT ');
              6: QueryDB.SQL.Add( '['+aCtable[i].sl_NAME +'] BOOLEAN ');
              7: QueryDB.SQL.Add( '['+aCtable[i].sl_NAME +'] TIME ');

            end;

            if aCtable[i].sl_KEY>0 then
            begin

              inc(iKey);

              SetLengTh( acIndex , iKey );

              CodeSite.Send('Create Primary of '+InttoStr(i)+':'+aCtable[i].sl_NAME);

              acIndex[iKey-1].sl_NAME := aCtable[i].sl_NAME;
              acIndex[iKey-1].sl_TYPE := aCtable[i].sl_TYPE;
              acIndex[iKey-1].sl_SIZE := aCtable[i].sl_SIZE;
              acIndex[iKey-1].sl_KEY  := aCtable[i].sl_KEY;

              acIndex[iKey-1].sl_AUTOINC  := aCtable[i].sl_AUTOINC;

              CodeSite.Send('--to-.'+InttoStr(iKey-1)+'.as :'+
              acIndex[iKey-1].sl_NAME +':= '+aCtable[i].sl_NAME);

            end;

            if ( i<High(aCtable) ) then
              QueryDB.SQL.Add(',')
            else
            begin
              if LengTh(acIndex)>0 then
              QueryDB.SQL.Add(',') else
              QueryDB.SQL.Add(')');
            end;

          end;   //i

          CodeSite.Send('C4');

          //last:202104 AutoIncrement not Support Index

          if Length( acIndex ) >0 then
          begin

            CodeSite.Send('C4.1');

            SetLengTh( KeyTables , Length( acIndex ) );

            for iKey := Low(acIndex) to High(acIndex) do
              KeyTables[iKey] :=
              TKeySample.Create( acIndex[iKey].sl_NAME , acIndex[iKey].sl_KEY  );

            //  CodeSite.Send('Key :['+InttoStr(acIndex[iKey].sl_KEY)+']:'+ acIndex[iKey].sl_NAME );
            //end;

            List := TStringList.Create;

            for i := Low(KeyTables) to High(KeyTables) do
            begin

              //CodeSite.Send('L3. Key :['+
              //InttoStr( KeyTables[i].SortOrder )+']'+ KeyTables[i].FieldName );

              List.AddObject( IntToStr(KeyTables[i].SortOrder) , TObject( KeyTables[i]) );

            end;  //i

            CodeSite.Send('C4.2');

            if Not acAutoInc then
            begin

              CodeSite.Send('C4.3');

              QueryDB.SQL.Add(' PRIMARY KEY( ' );
              sIndex :='';

              List.Sort;

              for i := 0 to List.Count-1 do
              begin

                KeyTable:= TKeySample(List.Objects[i]);
                QueryDB.SQL.Add( KeyTable.FieldName + iif( i < (List.Count-1),',','))'));

                sIndex := sIndex + KeyTable.FieldName + iif( i < (List.Count-1),',','');

              end; //i
            end;
          end;

          //sSQL := SQL.Text;

          CodeSite.Send('C5.'+QueryDB.SQL.Text);

          QueryDB.ExecSQL;

          //SQLiteTransaction.Commit;

          CodeSite.send('C6.Ok!');

          QueryDB.SQL.Clear;

          SQL_Index.Close;
          SQL_Index.Prepare;
          SQL_Index.ParamByName('DB_NAME').AsString := SLIndexes.TableName;
          //SLIndexes.GenTableName;
          SQL_Index.Open;

          x := 0;

          CodeSite.Send('C7.0');

          if Not SQL_Index.Eof then
          begin

            CodeSite.Send('C7.1');

            //SQLiteTransaction.StartTransaction;

            while (Not SQL_Index.Eof) do
            begin

              if Not SQLiteTransaction.Active then
                SQLiteTransaction.StartTransaction;

              QueryDB.SQL.Clear;
              QueryDB.SQL.Add('CREATE INDEX '+SQL_Index.FieldByName('INDEX_NAME').AsString+'_IDX ');
              QueryDB.SQL.Add('ON ['+TableName+'](['+SQL_Index.FieldByName('EXPRESSION').AsString+']);');

              CodeSite.Send('C7.2 sql:'+QueryDB.SQL.Text);

              QueryDB.ExecSQL;

              CodeSite.Send('C7.3');
              SQL_Index.Next;

            end;

            CodeSite.Send('C7.4');

            //SQLiteTransaction.Commit;

          end;
          SQL_Index.Close;

        finally

          List.Free;

          CodeSite.Send('registrasi in ics_master');

          if SQLiteTransaction.Active then
            SQLiteTransaction.Commit;

          ASLData.idwil      := SLIndexes.OfficeID;
          ASLData.periode    := 'create';
          ASLData.table_name := TableName;
          ASLData.type_data  := 'data';
          ASLData.crt_date   := Now();
          ASLData.upd_date   := Now();

          CodeSite.Send('6.0');

          SLIndexes.SLUpdateInMaster(ASLData);

          CodeSite.Send('Registrasi in ics_master Post');

        end;
      end;
    end;
  end;
end;

procedure TSQLIteIndexes.SLDbComand(SLIndexes: TSQLIteIndexes; sql: TStrings);
var
  sldb: TSQLiteDatabase;
  sltb: TSQLIteTable;

begin

  if sql.Text = '' then
  exit;

  if Not FileExists(SLIndexes.Database) then
  begin

    sldb := TSQLiteDatabase.Create( SLIndexes.Database );

    try

      sldb.execsql(SQL.Text);

    finally

      sldb.Free;

    end;
  end;
end;

procedure TSQLIteIndexes.SLDbConInMaster(SLIndexes: TSQLIteIndexes);
var
  bCreateTable : boolean;

  sldb: TSQLiteDatabase;
  sltb: TSQLIteTable;
  SQL : TStringList;

begin

  CodeSite.Send('---SQLite SLCheckInMaster---');

  if Not FileExists(SLIndexes.Database) then
  begin

    sldb := TSQLiteDatabase.Create( SLIndexes.Database );
    SQL  := TStringList.Create;
    bCreateTable := True;

    try

      SQL.Clear;
      SQL.Add('CREATE TABLE IF NOT EXISTS ics_master ( ');
      SQL.Add('[IDWIL] VARCHAR(3), ');
      SQL.Add('[PERIODE] VARCHAR(6), ');
      SQL.Add('[TBL_NAME] VARCHAR(30), ');
      SQL.Add('[TYPE] VARCHAR(16), ');
      SQL.Add('[CRT_DATE] DATE, ');
      SQL.Add('[UPD_DATE] DATETIME, ');
      SQL.Add('CONSTRAINT ics_master_Index01 PRIMARY KEY (idwil, periode, tbl_name)); ');
      sldb.execsql(SQL.Text);

      SQL.Clear;
      SQL.Add( 'CREATE TRIGGER IF NOT EXISTS validate_ics_master_before_upd ');
      SQL.Add( '  AFTER UPDATE ');
      SQL.Add( '  ON ics_master ');
      SQL.Add( 'BEGIN ');
      SQL.Add( '  update ics_master ');
      SQL.Add( '  set upd_date = new.upd_date ');
      SQL.Add( '  where ( idwil = old.idwil ) and ');
      SQL.Add( '        ( periode = old.periode ) and ');
      SQL.Add( '        ( tbl_name = old.tbl_name ); ');
      SQL.Add( 'END; ');

      sldb.execsql(SQL.Text);

      SQL.Clear;
      { //sample
      SQL.Add('PERIODE      VARCHAR(8),');
      SQL.Add('DIST_ID      VARCHAR(2),');
      SQL.Add('CRT_DATE     DATETIME,');
      SQL.Add('CRT_USER     VARCHAR(30),');
      SQL.Add('NONTAXABLE TEXT default FALSE,');
      SQL.Add('NONSTOCK TEXT default TRUE,');
      SQL.Add('IDGROUP      VARCHAR(2),');
      SQL.Add('IDSUBGROUP   VARCHAR(2),');
      SQL.Add('ID_GOODES    VARCHAR(13),');
      SQL.Add('BARCODE      VARCHAR(20),');
      SQL.Add('DESCRIPT     VARCHAR(25),');
      SQL.Add('SATUAN       VARCHAR(6),');
      SQL.Add('QTY_UNIT     FLOAT,');
      SQL.Add('ORD_LEVEL    FLOAT,');
      SQL.Add('PROV_GROS    FLOAT,');
      SQL.Add('PROV_RETA    FLOAT,');
      SQL.Add('UNIT         FLOAT,');
      SQL.Add('UNIT_SO      FLOAT,');
      SQL.Add('UNIT_FM      FLOAT,');
      SQL.Add('UNIT_JM      FLOAT,');
      SQL.Add('CORNER_ID    INTEGER,');
      SQL.Add('CORNER_COLM  INTEGER,');
      SQL.Add('CORNER_LINE  INTEGER,');
      SQL.Add('CORNER_SPACE FLOAT,');
      SQL.Add('MESSAGE_SO   VARCHAR(50),');
      SQL.Add('primary key (PERIODE, DIST_ID, ID_GOODES) ');
      SQL.Add(';');

      sldb.execsql(SQL.Text);


      SQL.Clear;

      SQL.Add('DIST_ID    VARCHAR(2),
      SQL.Add('ID_GOODES  VARCHAR(13),
      SQL.Add('IDGROUP    VARCHAR(2),
      SQL.Add('IDSUBGROUP VARCHAR(2),
      SQL.Add('BARCODE    VARCHAR(20),
      SQL.Add('DESCRIPT   VARCHAR(25),
      SQL.Add('IDRELASI   VARCHAR(3),
      SQL.Add('SATUAN     VARCHAR(6),
      SQL.Add('QTY_UNIT   FLOAT,
      SQL.Add('ORD_LEVEL  FLOAT,
      SQL.Add('PROV_GROS  FLOAT,
      SQL.Add('PROV_RETA  FLOAT,
      SQL.Add('HG_BELI    FLOAT,
      SQL.Add('HG_POKOK   FLOAT,
      SQL.Add('HG_RETAIL  FLOAT,
      SQL.Add('HG_GROSIR  FLOAT,
      SQL.Add('DISC_CASH  FLOAT,
      SQL.Add('DISCONTI   INTEGER,
      SQL.Add('TGL_IN     DATE,
      SQL.Add('TGL_BELI   DATE,
      SQL.Add('TGL_COM    DATE,
      SQL.Add('STIME      VARCHAR(8),
      SQL.Add('USER       VARCHAR(10),
      SQL.Add('NONTAXABLE INTEGER,
      SQL.Add('NONSTOCK   INTEGER,
      SQL.Add('LOG_CHK    VARCHAR(30),
      SQL.Add('primary key (ID_GOODES, DIST_ID)
    }

    Except
      ShowMessage('Access Denied for Create db File :'+SLIndexes.Database);
    end;

    //CodeSite.Send('Clear');

  end;

end;

procedure TSQLIteIndexes.SLDbConnection(SLIndexes: TSQLIteIndexes);
begin

  DM.QueryDB.Close;

  With DM DO
  begin

    CodeSite.Send('SQLite DB Test Create');

    if SQLiteSDB.Connected then
    SQLiteSDB.Connected := False;

    //SQLiteSDB.ConnectionName := 'ICS_db3';
    //SQLiteSDB.ConnectionDefName:='SQLite_ICS';
    SQLiteSDB.DriverName     := 'SQLite';
    //SQLiteSDB.dri     := dmHimawanFD.FDPhysFBDriverLink1; //FDPhysSQLiteDriverLink1;
    //;

    CodeSite.Send('---ICS SQLite:['+SLIndexes.Database+']');

    SQLiteSDB.Params.Clear;
    SQLiteSDB.Params.Add('DriverID=SQLite'); // Same as SQLLiteSDB.DriverName := 'SQLite';
    SQLiteSDB.Params.Add('Database='+SLIndexes.Database);
    SQLiteSDB.Params.Add('OpenMode=CreateUTF8');
    SQLiteSDB.Params.Add('SharedCache=True');
    SQLiteSDB.Params.Add('SQLiteAdvanced=page_size=4096');
    //SQLiteSDB.Params.Add('ColumnMetadataSupported=False');
    SQLiteSDB.Params.Add('LockingMode=Normal');
    SQLiteSDB.Params.Add('Synchronous=Normal');
    SQLiteSDB.Params.Add('BusyTimeout=10000');
    SQLiteSDB.UpdateOptions.LockWait := True;

    //
    //1st Check or Create ICS_SL Database!
    //CodeSite.Send('---Mastering ICS SQLite FDAC---');

    if Not FileExists(SLIndexes.Database) then
    begin

      CodeSite.Send('---SQLite Create ICS_sdb:'+SLIndexes.Database);

      //SQLiteSDB.ExecSQL('ATTACH '+QuotedStr(SLIndexes.Database)+' AS db3' ) ;

      //SQLiteSDB.Offline;
      //SQLiteSDB.Online;
    end;

    SQLiteSDB.Open();
  end;
end;

function TSQLIteIndexes.SLSuspenMaster(SLData: TSLICS_UpdateMaster; AutoCallCulation:Boolean ):Boolean;
var
  iq:Integer;

begin

  with DM do
  begin

    SQDBCekTable.Close;
    SQDBCekTable.Prepare;
    SQDBCekTable.ParamByName('TableName').AsString := SLData.table_name;
    SQDBCekTable.Open();

    CodeSite.Send('Check Table :'+
    'Tb:['+SLData.table_name+']:'+iif(SQDBCekTable.Eof,'Off','On'));

    if SQDBCekTable.Fields[0].Value >0 then
    begin

      SQDBGetMaster.Close;
      SQDBGetMaster.Prepare;
      SQDBGetMaster.ParamByName('SIDWIL').AsString    := SLData.idwil;
      SQDBGetMaster.ParamByName('SPERIODE').AsString  := SLData.periode;
      SQDBGetMaster.ParamByName('STBL_NAME').AsString := SLData.table_name;
      SQDBGetMaster.Open();

      CodeSite.Send('AutoCall :'+
      'Tb:['+SLData.table_name+']:'+iif(AutoCallCulation,'On','Off'));

      iq := 1;

      if SQDBGetMaster.RecordCount >0 then
      begin

        if AutoCallCulation then
        begin

          CodeSite.Send('Table    :'+ SQDBGetMaster.FieldByName('TBL_NAME').AsString );
          CodeSite.Send('Periode  :'+ SQDBGetMaster.FieldByName('PERIODE' ).AsString );
          CodeSite.Send('Tgl Call :'+ DateToStr4(SLData.crt_date) );
          CodeSite.Send('Tgl Table:'+ DateToStr4(SQDBGetMaster.FieldByName('CRT_DATE').AsDateTime) );

          if SQDBGetMaster.FieldByName('UPD_DATE').AsDateTime >= SLData.crt_date then
          begin
            iq := 0;   //TRUE OR FIND DATA

            CodeSite.Send('r:0;Tgl Update:'+ DateToStr4(SQDBGetMaster.FieldByName('UPD_DATE').AsDateTime) );

          end
          else
            iq := 1;

        end;
      end;

      Codesite.Send('iq:'+IntToStr(iq));

      if iq=1 then
      begin

        CodeSite.Send('Table '+SLData.table_name +' is Existing, then Facum... '+InttoStr(SQDBCekTable.Fields[0].Value));

        QueryDB.Close;
        QueryDB.SQL.Clear;
        QueryDB.SQL.Add( 'SELECT COUNT(*) FROM '+ SLData.table_name );
        QueryDB.SQL.Add( ' where IDWIL = '+QuotedStr(SLData.idwil));
        QueryDB.SQL.Add( ' AND PERIODE = '+QuotedStr(SLData.periode));

        //Codesite.Send('Q:'+QueryDB.SQL.Text );

        QueryDB.Open;

        if Not QueryDB.Eof then
        if QueryDB.Fields[0].Value >0 then
        begin

          if Not SQLiteTransaction.Active then
          SQLiteTransaction.StartTransaction;

          QueryDB.Close;
          QueryDB.SQL.Clear;
          QueryDB.SQL.Add( 'DELETE FROM '+SLData.table_name);
          QueryDB.SQL.Add( ' where IDWIL = '+QuotedStr(SLData.idwil));
          QueryDB.SQL.Add( ' AND PERIODE = '+QuotedStr(SLData.periode));

          QueryDB.ExecSQL;

          SQLiteTransaction.Commit;

          Codesite.Send('Deleted Q:Exect' );

        end;
      end;
    end;
  end;

  CodeSite.Send('Check Data :['+iif(iq=0,'Found data','Required Callculation')+']');

  Result := ( iq=0 );

end;

procedure TSQLIteIndexes.SLUpdateInMaster(SLData:TSLICS_UpdateMaster );
var AUpdate : boolean;
begin

  CodeSite.Send('SLUpdateInMaster:['+SLData.table_name+']');

  with DM do
  begin

    if Not SQLiteTransaction.Active then
    SQLiteTransaction.StartTransaction;

    CodeSite.Send('=1:'+SLData.idwil);
    CodeSite.Send('=2:'+SLData.periode);
    CodeSite.Send('=3:'+LowerCase(SLData.table_name));

    SQDBGetMaster.Close;
    SQDBGetMaster.Prepare;
    SQDBGetMaster.ParamByName('SIDWIL').AsString    := SLData.idwil;
    SQDBGetMaster.ParamByName('SPERIODE').AsString  := SLData.periode;
    SQDBGetMaster.ParamByName('STBL_NAME').AsString := LowerCase(SLData.table_name);
    SQDBGetMaster.Open();

    AUpdate := False;

    if SQDBGetMaster.Eof then
      AUpdate := True
    else
    begin

      if ( SQDBGetMaster.FieldByName('UPD_DATE').AsDateTime <= SLData.upd_date ) Then
      AUpdate := True;

    end;

    CodeSite.Send('6.2.1.'+iif( AUpdate,'True','False'));

    if AUpdate then
    begin

      CodeSite.Send('6.2.2.Update:'+LowerCase(SLData.table_name)+',periode:'+SLData.periode);

      SQDBUpdMaster.Close;
      SQDBUpdMaster.Prepare;
      SQDBUpdMaster.ParamByName('IDWIL').AsString      := SLData.idwil;
      SQDBUpdMaster.ParamByName('PERIODE').AsString    := SLData.periode;
      SQDBUpdMaster.ParamByName('TBL_NAME').AsString   := LowerCase(SLData.table_name);
      SQDBUpdMaster.ParamByName('TYPE').AsString       := LowerCase(SLData.type_data);
      SQDBUpdMaster.ParamByName('CRT_DATE').AsDate     := SLData.crt_date;
      SQDBUpdMaster.ParamByName('UPD_DATE').AsDateTime := SLData.upd_date;

      SQDBUpdMaster.ExecSQL;

      CodeSite.Send('6.3.SLUpdateInMaster.Post');

    end;

    DM.SQLiteTransaction.Commit;

  end;
end;
end.
