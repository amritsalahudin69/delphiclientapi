object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  OnDestroy = DataModuleDestroy
  Height = 655
  Width = 1360
  object briRCliX: TRESTClient
    Authenticator = briOAuth2Authenticator
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AcceptEncoding = 'identity'
    BaseURL = 
      'https://partner.api.bri.co.id/oauth/client_credential/accesstoke' +
      'n?grant_type=client_credentials'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 1264
    Top = 216
  end
  object briRReq: TRESTRequest
    Client = briRCliX
    Method = rmPOST
    Params = <
      item
        Name = 'client_id'
        Options = [poDoNotEncode]
        Value = 'AZIYonXl5N7ALrtEmrEO5CRvdk7l3EAR'
      end
      item
        Name = 'client_secret'
        Options = [poDoNotEncode]
        Value = 'qwHVCTb1eGrRcRfG'
      end>
    SynchronizedEvents = False
    Left = 1264
    Top = 280
  end
  object briRResX: TRESTResponse
    Left = 1264
    Top = 344
  end
  object SQLiteConnection: TFDConnection
    Params.Strings = (
      'Encrypt=aes-256'
      'Password=Tanhana5ngruwa'
      'Database=c:\Users\Jaya Lukita\Documents\icsgo396.sdb'
      'LockingMode=Normal'
      'SharedCache=False'
      'DriverID=SQLite')
    Left = 104
    Top = 24
  end
  object FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink
    Left = 360
    Top = 16
  end
  object FDSQLiteSecurity: TFDSQLiteSecurity
    DriverLink = FDPhysSQLiteDriverLink1
    Left = 456
    Top = 56
  end
  object SQLiteCekTable: TFDQuery
    Connection = SQLiteConnection
    SQL.Strings = (
      'select'
      'case when exists'
      
        ' ( select 1 FROM sqlite_master WHERE type='#39'table'#39' AND lower( nam' +
        'e )= lower(:TableName))'
      ' then 1 else 0 end as TableExists')
    Left = 104
    Top = 88
    ParamData = <
      item
        Name = 'TABLENAME'
        DataType = ftString
        ParamType = ptInput
        Value = 'npl_enduser'
      end>
  end
  object SQLiteGetCrnDate: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT datetime('#39'now'#39') as crn_DateTime')
    Left = 104
    Top = 144
  end
  object FDT_ConfigApp: TFDTable
    IndexFieldNames = 'CONFNAME'
    Connection = SQLiteConnection
    UpdateOptions.UpdateTableName = 'CONFIG_APP'
    TableName = 'CONFIG_APP'
    Left = 104
    Top = 256
  end
  object FDT_ConfigAPI: TFDTable
    IndexFieldNames = 'API_ID;API_COMMAND'
    Connection = SQLiteConnection
    UpdateOptions.UpdateTableName = 'CONFIG_API'
    TableName = 'CONFIG_API'
    Left = 104
    Top = 328
  end
  object QGetConfigApi: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT '
      ' API_ID,'
      ' API_COMMAND,'
      ' API_VALUE,'
      ' SYSDINAMIS,'
      ' DATEVERSION,'
      ' VER_ID,'
      ' UPD_DATE'
      'FROM CONFIG_API'
      'WHERE ( ( API_ID = :API_ID ) AND (API_COMMAND= :API_COMMAND) )'
      '')
    Left = 104
    Top = 392
    ParamData = <
      item
        Name = 'API_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '13594'
      end
      item
        Name = 'API_COMMAND'
        DataType = ftString
        ParamType = ptInput
        Value = 'CREATE_NEW_VA'
      end>
  end
  object QGetApiCount: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT count(*) as reccount'
      'FROM CONFIG_API'
      'WHERE ( API_ID = :API_ID )  '
      '')
    Left = 104
    Top = 448
    ParamData = <
      item
        Name = 'API_ID'
        DataType = ftString
        ParamType = ptInput
        Value = '13594'
      end>
  end
  object Q_Config: TFDQuery
    Connection = SQLiteConnection
    Left = 160
    Top = 200
  end
  object dsFDT_ConfigApp: TDataSource
    DataSet = FDT_ConfigApp
    Left = 160
    Top = 280
  end
  object QMenuActive: TFDQuery
    MasterSource = dsGetDashItem
    MasterFields = 'REG_ID'
    DetailFields = 'REG_ID;GROUPINDEX'
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'select '
      '    MenuItems.reg_id,'
      '    MenuItems.groupindex,'
      '    MenuItems.title1 ,'
      '    MenuItems.menucategory,'
      '    MenuItems.GroupHeader,'
      '    MenuItems.imageindex,'
      '    MenuItems.image_icon,'
      '    MenuItems.ApiKey_id,'
      '    MenuItems.Api_Command,'
      '    MenuItems.item_tag,'
      '    MenuItems.tile1_aling,'
      '    MenuItems.tile1_fontsize,'
      '    MenuItems.tile1_identhorz,'
      '    MenuItems.tile1_identvert,'
      '    MenuItems.tile1_color,'
      ''
      '    MenuItems.title2 ,'
      '    MenuItems.tile2_aling,'
      '    MenuItems.tile2_fontsize,'
      '    MenuItems.tile2_identhorz,'
      '    MenuItems.tile2_identvert,'
      '    MenuItems.tile2_color,'
      ''
      '    MenuItems.tile_size,'
      '    MenuItems.tile_border,'
      '    MenuItems.tile_begincolor,'
      '    MenuItems.tile_endcolor,'
      '    MenuItems.item_class'
      ''
      'from MenuItems '
      'where'
      '  ( MenuItems.reg_id = :reg_id ) '
      '  and ( MenuItems.groupindex = :groupindex ) '
      'order by item_tag')
    Left = 264
    Top = 88
    ParamData = <
      item
        Name = 'REG_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 301
      end
      item
        Name = 'GROUPINDEX'
        DataType = ftInteger
        ParamType = ptInput
        Value = 1
      end>
  end
  object MenuItem_Vacum: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'DELETE FROM MENUITEMS;'
      'DELETE FROM DASHBOARD;'
      '--DELETE FROM CONFIG_API;'
      'VACUUM;')
    Left = 272
    Top = 176
  end
  object Insert_FirstApp: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'ics_id_key'#39','#39'ICS'#39', '#39'ID Key'#39',1 ,'#39'2022-07-20 07:00l00'#39 +
        ' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'ics_secret_key'#39','#39'9N0GFNWhcKD52z43hI9yyw=='#39', '#39'Secret ' +
        'Key'#39',1 ,'#39'2022-07-20 07:00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'ics_projectserver'#39','#39'1'#39', '#39'Online Server Mode'#39',1 ,'#39'202' +
        '2-07-20 07:00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'ics_dupa'#39','#39'35argan1n9k4MulyanRahayu85uki396'#39', '#39'atcbc' +
        #39',1 ,'#39'2022-07-20 07:00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'icsgo_version'#39','#39'ICSgo 396.1'#39', '#39'Version'#39',1 ,'#39'2022-07-' +
        '20 07:00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'ims_login'#39','#39'/system/users/logged'#39', '#39'Login Path'#39',1 ,'#39 +
        '2022-07-20 07:00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      '  VALUES ( '#39'ims_server'#39','#39#39', '#39'Server'#39',1 ,'#39'2022-07-20 07:00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      '  VALUES ( '#39'ims_port'#39','#39#39', '#39'Port'#39',1 ,'#39'2022-07-20 07:00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'ics_server'#39','#39'103.226.49.114'#39', '#39'Api Server'#39',1 ,'#39'2022-' +
        '07-20 07:00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'ics_port'#39','#39'9919'#39', '#39'Api Port'#39',1 ,'#39'2022-07-20 07:00l00' +
        #39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'ics_DirSystem'#39','#39'Z:\KSP\SYSTEM'#39', '#39'ICS Directory Syste' +
        'm'#39',1 ,'#39'2022-07-20 07:00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'ics_DirTemp'#39','#39'c:\Temp'#39', '#39'ICS Temporary System'#39',1 ,'#39'2' +
        '022-07-20 07:00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'ics_Printer'#39','#39'Default'#39', '#39'Printer Default'#39',1 ,'#39'2022-0' +
        '7-20 07:00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'employee'#39','#39'indrajit'#39', '#39'Employe ID'#39',1 ,'#39'2022-07-20 07' +
        ':00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'office_id'#39','#39'234'#39', '#39'Office Dept'#39',1 ,'#39'2022-07-20 07:00' +
        'l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'telephone'#39','#39'+62'#39', '#39'Telephone'#39',1 ,'#39'2022-07-20 07:00l0' +
        '0'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'eMail'#39','#39'yourMail@host.com'#39', '#39'Email'#39',1 ,'#39'2022-07-20 0' +
        '7:00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'deviceid'#39','#39'This Device'#39', '#39'Device ID'#39',1 ,'#39'2022-07-20 ' +
        '07:00l00'#39' );'
      ''
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFCAP' +
        'TION, APP_VERSION, APP_UPDATEVERSION )'
      
        '  VALUES ( '#39'ics_database'#39','#39'himawan'#39', '#39'Tri Padmana'#39',1 ,'#39'2022-07-2' +
        '0 07:00l00'#39' );')
    Left = 368
    Top = 208
  end
  object QGetConfigApp: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT '
      ' CONFVALUE,'
      ' CONFBLOB,'
      ' CONFCAPTION,'
      ' APP_VERSION,'
      ' APP_UPDATEVERSION,'
      ' UPD_DATE'
      'FROM CONFIG_APP '
      'WHERE ( CONFNAME = :CONFIGNAME )'
      '')
    Left = 272
    Top = 248
    ParamData = <
      item
        Name = 'CONFIGNAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
  object MenuApi_Vacum: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'DELETE FROM CONFIG_API;'
      'VACUUM;')
    Left = 272
    Top = 312
  end
  object ListOffice_Vacum: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'DELETE FROM CAT_OFFICE;'
      ''
      'VACUUM;')
    Left = 448
    Top = 384
  end
  object FDT_OFFICE: TFDTable
    IndexFieldNames = 'IDO'
    Connection = SQLiteConnection
    UpdateOptions.UpdateTableName = 'CAT_OFFICE'
    TableName = 'CAT_OFFICE'
    Left = 448
    Top = 296
  end
  object FDT_Dashboard: TFDTable
    Connection = SQLiteConnection
    UpdateOptions.UpdateTableName = 'DASHBOARD'
    TableName = 'DASHBOARD'
    Left = 272
    Top = 360
  end
  object ConfigApp_MasSql: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS CONFIG_APP ('
      '[CONFNAME] VARCHAR (60),'
      '[CONFVALUE] VARCHAR (135),'
      '[CONFBLOB] BLOB,'
      '[CONFCAPTION] VARCHAR (60),'
      '[APP_VERSION] VARCHAR (21),'
      '[APP_UPDATEVERSION] TIMESTAM,'
      'PRIMARY KEY( CONFNAME )'
      ' );'
      ''
      'CREATE INDEX CONFIG_APP_IDX ON [CONFIG_APP]([CONFNAME]);')
    Left = 368
    Top = 88
  end
  object ConfigApp_InsSql: TFDQuery
    SQL.Strings = (
      
        'INSERT OR REPLACE INTO CONFIG_APP ( CONFNAME, CONFVALUE, CONFBLO' +
        'B, CONFCAPTION, APP_VERSION, APP_UPDATEVERSION )'
      'SELECT '
      
        'CONFNAME, CONFVALUE, CONFBLOB, CONFCAPTION, APP_VERSION, APP_UPD' +
        'ATEVERSION FROM CONFIG_APP3')
    Left = 368
    Top = 144
  end
  object icsRClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    AcceptEncoding = 'identity'
    BaseURL = 'http://103.226.49.114:8181/system/users/logged'
    ContentType = 'application/x-www-form-urlencoded'
    Params = <>
    RaiseExceptionOn500 = False
    Left = 1264
    Top = 32
  end
  object icsRRequest: TRESTRequest
    Client = icsRClient
    Method = rmPOST
    Params = <
      item
        Kind = pkHTTPHEADER
        Name = 'ICS-Timestamp'
        Options = [poDoNotEncode]
        Value = '2022-10-28T03:14:32.024Z'
      end
      item
        Kind = pkHTTPHEADER
        Name = 'ICS-Signature'
        Value = 'c6P3j8BmzbUFMlczV3CxPQqPYWf5TpYn37mLqsfqJQw='
      end
      item
        Kind = pkREQUESTBODY
        Name = 'body'
        Value = 
          '{"username":"pCs4tH0H9Xoif71jfR8k7dSO1c9VHPsxwutClGDI1NE=","pass' +
          'word":"nIIi6o1uZSdYhUfCSHfdfpmTflrLWQY91wiwvDVAYlU="}'
      end>
    Response = icsRResponse
    SynchronizedEvents = False
    Left = 1264
    Top = 96
  end
  object icsRResponse: TRESTResponse
    ContentType = 'application/json'
    Left = 1264
    Top = 152
  end
  object briOAuth2Authenticator: TOAuth2Authenticator
    ClientID = 'AZIYonXl5N7ALrtEmrEO5CRvdk7l3EAR'
    ClientSecret = 'qwHVCTb1eGrRcRfG'
    ResponseType = rtTOKEN
    TokenType = ttBEARER
    Left = 1312
    Top = 32
  end
  object FDT_VaPaymentHist: TFDTable
    IndexFieldNames = 'Va_Number;Jurnal_No'
    Connection = SQLiteConnection
    UpdateOptions.UpdateTableName = 'VA_PAYMENTHISTORY'
    TableName = 'VA_PAYMENTHISTORY'
    Left = 592
    Top = 312
  end
  object dsPaymentHistory: TDataSource
    DataSet = FDT_VaPaymentHist
    Left = 592
    Top = 360
  end
  object VaPaymentHist_Vacum: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'DELETE FROM VA_PAYMENTHISTORY;'
      'VACUUM;')
    Left = 592
    Top = 408
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 536
    Top = 24
  end
  object QGetDashItem: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT '
      '  REG_ID, GROUPINDEX, TITLE, IMAGEINDEX '
      'FROM DASHBOARD'
      'WHERE ( REG_ID = :REG_ID ) '
      '--AND ( GROUPINDEX = :GROUPINDEX )'
      '')
    Left = 264
    Top = 40
    ParamData = <
      item
        Name = 'REG_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 301
      end>
  end
  object QGetMenuItem: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT '
      '  REG_ID, ITEM_TAG, GROUPINDEX'
      'FROM MENUITEMS'
      'WHERE ( REG_ID = :REG_ID ) -- AND ( ITEM_TAG= :ITEM_TAG)'
      'order  by ITEM_TAG'
      '')
    Left = 360
    Top = 408
    ParamData = <
      item
        Name = 'REG_ID'
        DataType = ftInteger
        ParamType = ptInput
        Value = 301
      end>
  end
  object FDT_MenuItem: TFDTable
    IndexName = 'sqlite_autoindex_MENUITEMS_1'
    Connection = SQLiteConnection
    UpdateOptions.UpdateTableName = 'MenuItems'
    TableName = 'MenuItems'
    Left = 360
    Top = 312
  end
  object dsGetDashItem: TDataSource
    DataSet = QGetDashItem
    Left = 208
    Top = 56
  end
  object dsFDT_OFFICE: TDataSource
    DataSet = FDT_OFFICE
    Left = 496
    Top = 312
  end
  object SQLiteSDB: TFDConnection
    ConnectionName = 'ICSdb3'
    Params.Strings = (
      'LockingMode=Normal'
      
        'Database=e:\Project\DXE6\Senkuko\v3.3LC\Win32\Release\sdb\skk_cc' +
        'h.ib3'
      'DateTimeFormat=DateTime'
      'DriverID=SQLite')
    LoginPrompt = False
    Transaction = SQLiteTransaction
    UpdateTransaction = SQLiteTransaction
    Left = 769
    Top = 32
  end
  object SQLiteTransaction: TFDTransaction
    Connection = SQLiteSDB
    Left = 823
    Top = 64
  end
  object SQDbCekTable: TFDQuery
    Connection = SQLiteSDB
    SQL.Strings = (
      'select'
      'case when exists'
      
        ' ( select 1 FROM sqlite_master WHERE type='#39'table'#39' AND lower( nam' +
        'e )= lower(:TableName))'
      ' then 1 else 0 end as TableExists')
    Left = 777
    Top = 120
    ParamData = <
      item
        Name = 'TABLENAME'
        DataType = ftString
        ParamType = ptInput
        Value = 'npl_enduser'
      end>
  end
  object QueryDB: TFDQuery
    Connection = SQLiteSDB
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      '')
    Left = 777
    Top = 344
  end
  object SQDBUpdMaster: TFDQuery
    Connection = SQLiteSDB
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'INSERT OR REPLACE INTO ics_master '
      '( IDWIL, PERIODE, TBL_NAME, TYPE, CRT_DATE, UPD_DATE )'
      
        'VALUES(:IDWIL, :PERIODE, :TBL_NAME, :TYPE, :CRT_DATE, :UPD_DATE ' +
        ')'
      '')
    Left = 777
    Top = 232
    ParamData = <
      item
        Name = 'IDWIL'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PERIODE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TBL_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'TYPE'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CRT_DATE'
        DataType = ftDate
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'UPD_DATE'
        DataType = ftDateTime
        ParamType = ptInput
        Value = Null
      end>
  end
  object SQDbGetMaster: TFDQuery
    Connection = SQLiteSDB
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      
        'SELECT IDWIL, PERIODE, TBL_NAME, TYPE, CRT_DATE, UPD_DATE FROM i' +
        'cs_master '
      
        'WHERE  ( IDWIL=:SIDWIL ) AND (PERIODE=:SPERIODE) AND( TBL_NAME=:' +
        'STBL_NAME )')
    Left = 777
    Top = 176
    ParamData = <
      item
        Name = 'SIDWIL'
        DataType = ftString
        ParamType = ptInput
        Value = '001'
      end
      item
        Name = 'SPERIODE'
        DataType = ftString
        ParamType = ptInput
        Value = '202008'
      end
      item
        Name = 'STBL_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = 'npl_dreport'
      end>
  end
  object SQDBGetCrnDate: TFDQuery
    Connection = SQLiteSDB
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT datetime('#39'now'#39') as crn_DateTime')
    Left = 777
    Top = 288
  end
  object Dbf_masterTable: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evMode, evRecordCountMode, evUnidirectional]
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      
        'SELECT * FROM DBF_MASTER WHERE (DB_NAME = :DB_NAME AND ENABLED_1' +
        '='#39'T'#39')')
    Left = 536
    Top = 127
    ParamData = <
      item
        Name = 'DB_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = 'NPL_ES'
      end>
  end
  object Dbf_indexsTable: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode]
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      'SELECT * FROM DBF_INDEXS WHERE DB_NAME = :DB_NAME '
      'ORDER BY NTX_ORD')
    Left = 536
    Top = 178
    ParamData = <
      item
        Name = 'DB_NAME'
        DataType = ftString
        ParamType = ptInput
        Value = 'STOR'
      end>
  end
  object QuerySL: TFDQuery
    Connection = SQLiteConnection
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      '')
    Left = 673
    Top = 129
  end
  object SQCLiteCekTable: TFDQuery
    Connection = SQLiteConnection
    SQL.Strings = (
      'select'
      'case when exists'
      
        ' ( select 1 FROM sqlite_master WHERE type='#39'table'#39' AND lower( nam' +
        'e )= lower(:TableName))'
      ' then 1 else 0 end as TableExists')
    Left = 537
    Top = 240
    ParamData = <
      item
        Name = 'TABLENAME'
        DataType = ftString
        ParamType = ptInput
        Value = 'npl_enduser'
      end>
  end
  object SQLLiteCon: TFDConnection
    Params.Strings = (
      'DriverID=SQLite')
    LoginPrompt = False
    Left = 960
    Top = 32
  end
  object FDLocalSQL1: TFDLocalSQL
    DisableControls = False
    Connection = SQLLiteCon
    Active = True
    DataSets = <
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end
      item
      end>
    Left = 992
    Top = 88
  end
  object SLIKREDIT_FDB: TFDMemTable
    FieldOptions.PositionMode = poFirst
    FieldDefs = <
      item
        Name = 'ENDUSER_NO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'NO_REK'
        Attributes = [faRequired]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'IDWIL'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'RELESE_DATE'
        DataType = ftDate
      end
      item
        Name = 'PLAFOND'
        DataType = ftFloat
        Precision = 16
      end
      item
        Name = 'KODE_BUNGA'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'TEMPO'
        DataType = ftSmallint
      end
      item
        Name = 'RTEMPO'
        DataType = ftLargeint
      end
      item
        Name = 'UMUR_KREDIT'
        DataType = ftLargeint
      end
      item
        Name = 'PAIDOFF_DATE'
        DataType = ftDate
      end
      item
        Name = 'CLOSE_DATE'
        DataType = ftDate
      end
      item
        Name = 'FULL_NAME'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'IDCART'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'GHEAD'
        DataType = ftString
        Size = 22
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 2147483647
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CheckRequired = False
    LocalSQL = FDLocalSQL1
    StoreDefs = True
    Left = 992
    Top = 216
  end
  object SLIM_FDB: TFDMemTable
    FieldOptions.PositionMode = poFirst
    FieldDefs = <
      item
        Name = 'IDWIL'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'WIL_NAME'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'IDRES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NO_REK'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'HIST_COUNT'
        DataType = ftInteger
      end
      item
        Name = 'TA'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TEMPO'
        DataType = ftString
        Size = 6
      end
      item
        Name = 'RELESE_DATE'
        DataType = ftDate
      end
      item
        Name = 'PAIDOFF_DATE'
        DataType = ftDate
      end
      item
        Name = 'PLAFOND'
        DataType = ftSingle
        Precision = 15
      end
      item
        Name = 'INFOSALDO'
        DataType = ftFloat
        Precision = 15
      end
      item
        Name = 'STORAN_ZERO'
        DataType = ftInteger
      end
      item
        Name = 'STORAN_STD'
        DataType = ftSingle
        Precision = 15
      end
      item
        Name = 'BILL'
        DataType = ftSingle
        Precision = 15
      end
      item
        Name = 'UMUR_KREDIT'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'ENDUSER_NO'
        DataType = ftInteger
      end
      item
        Name = 'RSIDCALLREGNO'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'LNPL'
        DataType = ftString
        Size = 15
      end
      item
        Name = 'NPL'
        DataType = ftInteger
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode, evRecordCountMode]
    FetchOptions.Mode = fmAll
    FetchOptions.RecordCountMode = cmTotal
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 2147483647
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvRefreshMode, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable]
    UpdateOptions.CheckRequired = False
    LocalSQL = FDLocalSQL1
    StoreDefs = True
    Left = 992
    Top = 150
  end
  object QSqlLite: TFDQuery
    Connection = SQLLiteCon
    FetchOptions.AssignedValues = [evRecordCountMode, evCursorKind]
    FetchOptions.CursorKind = ckDynamic
    FetchOptions.RecordCountMode = cmTotal
    SQL.Strings = (
      '')
    Left = 1065
    Top = 89
  end
  object SLIKREDIT_FDBxx: TFDMemTable
    FieldDefs = <
      item
        Name = 'IDWIL'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'WIL_NAME'
        Attributes = [faFixed]
        DataType = ftFixedChar
        Size = 30
      end
      item
        Name = 'IDRES'
        DataType = ftString
        Size = 2
      end
      item
        Name = 'NO_REK'
        Attributes = [faRequired]
        DataType = ftString
        Size = 12
      end
      item
        Name = 'TA'
        Attributes = [faRequired]
        DataType = ftString
        Size = 3
      end
      item
        Name = 'TEMPO'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'RELESE_DATE'
        DataType = ftDate
      end
      item
        Name = 'COALESCE'
        DataType = ftDate
      end
      item
        Name = 'PLAFOND'
        DataType = ftFloat
        Precision = 16
      end
      item
        Name = 'INFOSALDO'
        DataType = ftFloat
        Precision = 16
      end
      item
        Name = 'STORAN_ZERO'
        DataType = ftInteger
      end
      item
        Name = 'STORAN_STD'
        DataType = ftFloat
        Precision = 16
      end
      item
        Name = 'BILL'
        DataType = ftFloat
        Precision = 16
      end
      item
        Name = 'UMUR_KREDIT'
        DataType = ftString
        Size = 23
      end
      item
        Name = 'ENDUSER_NO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'CALLSIDCART'
        Attributes = [faRequired]
        DataType = ftString
        Size = 20
      end
      item
        Name = 'PASANGAN_IDCART'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    FormatOptions.AssignedValues = [fvMaxBcdPrecision, fvMaxBcdScale]
    FormatOptions.MaxBcdPrecision = 2147483647
    FormatOptions.MaxBcdScale = 1073741823
    ResourceOptions.AssignedValues = [rvPersistent, rvSilentMode]
    ResourceOptions.Persistent = True
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvUpdateChngFields, uvUpdateMode, uvLockMode, uvLockPoint, uvLockWait, uvRefreshMode, uvFetchGeneratorsPoint, uvCheckRequired, uvCheckReadOnly, uvCheckUpdatable, uvAutoCommitUpdates]
    UpdateOptions.LockWait = True
    UpdateOptions.FetchGeneratorsPoint = gpNone
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    LocalSQL = FDLocalSQL1
    StoreDefs = True
    Left = 992
    Top = 288
  end
  object repoMain: TcxEditRepository
    Left = 776
    Top = 432
    PixelsPerInch = 96
    object repoApprovBtn: TcxEditRepositoryButtonItem
      Properties.Alignment.Horz = taCenter
      Properties.Buttons = <
        item
          Caption = 'Approval'
          Default = True
          Kind = bkText
        end>
      Properties.ViewStyle = vsButtonsAutoWidth
    end
    object repoMainHyperLinkItem1: TcxEditRepositoryHyperLinkItem
    end
  end
end
