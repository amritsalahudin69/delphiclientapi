object FCustRegister: TFCustRegister
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Pendaftaran Anggota'
  ClientHeight = 752
  ClientWidth = 1046
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesigned
  StyleElements = [seFont, seClient]
  OnCreate = FormCreate
  OnShow = FormShow
  DesignSize = (
    1046
    752)
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMaster: TscGPPanel
    Left = 40
    Top = 0
    Width = 1006
    Height = 752
    Align = alClient
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    FluentUIOpaque = False
    TabOrder = 0
    StyleElements = [seFont, seClient]
    BlurBackground = False
    BlurBackgroundAmount = 5
    BackgroundStyle = gppbsFormBackground
    ContentMarginLeft = 0
    ContentMarginRight = 0
    ContentMarginTop = 0
    ContentMarginBottom = 0
    CustomImageIndex = -1
    DragForm = False
    DragTopForm = True
    DrawTextMode = scdtmGDI
    FrameSides = []
    FillGradientAngle = 255
    FillGradientBeginAlpha = 255
    FillGradientEndAlpha = 255
    FillGradientBeginColorOffset = 25
    FillGradientEndColorOffset = 25
    FrameWidth = 0
    FillColor = clBtnShadow
    FillColorAlpha = 255
    FillColor2 = clBtnShadow
    FrameColor = clBtnShadow
    FrameColorAlpha = 255
    FrameRadius = 0
    ScaleFrameWidth = False
    ShowCaption = False
    CaptionGlowEffect.Enabled = False
    CaptionGlowEffect.Color = clBtnShadow
    CaptionGlowEffect.AlphaValue = 255
    CaptionGlowEffect.GlowSize = 5
    CaptionGlowEffect.Offset = 0
    CaptionGlowEffect.Intensive = True
    CaptionGlowEffect.StyleColors = True
    Color = clBtnFace
    Caption = 'scGPPanel1'
    TransparentBackground = True
    StorePaintBuffer = True
    Sizeable = False
    WallpaperIndex = -1
    WordWrap = False
    object scPageCentral: TscPageViewer
      AlignWithMargins = True
      Left = 12
      Top = 60
      Width = 991
      Height = 680
      Margins.Left = 12
      Margins.Top = 12
      Margins.Bottom = 12
      Align = alClient
      FluentUIOpaque = False
      TabOrder = 0
      Color = clBtnShadow
      PageIndex = 0
      Pages = <
        item
          Page = scPageRegister
        end
        item
          Page = scPageDaftar
        end
        item
          Page = scPageCetakMtList
        end>
      ActivePage = scPageRegister
      object scPageCetakMtList: TscPageViewerPage
        Left = 0
        Top = 0
        Width = 991
        Height = 680
        HorzScrollBar.Tracking = True
        VertScrollBar.Tracking = True
        Align = alClient
        BorderStyle = bsNone
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 2
        Visible = False
        WallpaperIndex = -1
        CustomBackgroundImageIndex = -1
        FullUpdate = True
        FluentUIOpaque = False
        StorePaintBuffer = False
        MouseWheelSupport = False
        BackgroundStyle = scsbsFormBackground
        object scPanelmain: TscPanel
          Left = 0
          Top = 0
          Width = 991
          Height = 680
          Align = alClient
          FluentUIOpaque = False
          TabOrder = 0
          CustomImageIndex = -1
          DragForm = False
          DragTopForm = True
          StyleKind = scpsPanel
          ShowCaption = False
          BorderStyle = scpbsNone
          WallpaperIndex = -1
          LightBorderColor = clBtnHighlight
          ShadowBorderColor = clBtnShadow
          CaptionGlowEffect.Enabled = False
          CaptionGlowEffect.Color = clBtnShadow
          CaptionGlowEffect.AlphaValue = 255
          CaptionGlowEffect.GlowSize = 7
          CaptionGlowEffect.Offset = 0
          CaptionGlowEffect.Intensive = True
          CaptionGlowEffect.StyleColors = True
          Color = clBtnFace
          Caption = 'scPanelmain'
          StorePaintBuffer = False
          WordWrap = False
          object WPToolbar1: TWPToolbar
            Left = 0
            Top = 0
            Width = 991
            Height = 45
            ImageStretch = False
            DrawOptions = [wptPaintThemed]
            ColorTo = 15790316
            UseDockManager = False
            ConfigString = 'D3D4F1F21a1b1cB4B5B6F5'
            ShowAllElements = wpSelectedElements
            Align = alTop
            BevelLines = []
            AutoEnabling = True
            WidthBetweenGroups = 4
            MarginBottom = 4
            MarginTop = 4
            sel_ListBoxes = []
            sel_StatusIcons = []
            sel_ActionIcons = []
            sel_DatabaseIcons = []
            sel_EditIcons = []
            sel_TableIcons = []
            FlatButtons = True
            ButtonHeight = 26
            TrueTypeOnly = True
            object ShowFields: TCheckBox
              Left = 551
              Top = 7
              Width = 97
              Height = 17
              Caption = 'ShowFields'
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = ShowFieldsClick
            end
            object DBNavigator2: TDBNavigator
              Left = 648
              Top = 7
              Width = 156
              Height = 25
              DataSource = dsList
              VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
              TabOrder = 1
            end
          end
          object WPRuler1: TWPRuler
            Left = 0
            Top = 45
            Width = 991
            Height = 26
            DrawOptions = []
            ColorMargin = clAppWorkSpace
            ColorBack = clBtnFace
            ColorTableMarker = clBtnShadow
            Align = alTop
          end
          object WPVertRuler1: TWPVertRuler
            Left = 0
            Top = 71
            Width = 26
            Height = 609
            DrawOptions = []
            ColorMargin = clAppWorkSpace
            ColorBack = clBtnFace
          end
          object WPRichText1: TWPRichText
            Left = 26
            Top = 71
            Width = 965
            Height = 609
            Cursor = crIBeam
            RTFText.Data = {
              3C215750546F6F6C735F466F726D617420563D3730302F3E0D0A3C5374616E64
              617264466F6E742077706373733D2243686172466F6E743A27417269616C273B
              43686172466F6E7453697A653A313130303B222F3E0D0A3C7661726961626C65
              733E0D0A3C7661726961626C65206E616D653D2247656E657261746F72222064
              6174613D22616E73692220746578743D225750546F6F6C735F372E3237303B22
              2F3E0D0A3C7661726961626C65206E616D653D22417574686F72222064617461
              3D22616E73692220746578743D2241737469616A6920726979616E746F222F3E
              0D0A3C7661726961626C65206E616D653D224F70657261746F72222064617461
              3D22616E73692220746578743D2245445020323131222F3E3C2F766172696162
              6C65733E0D0A3C6E756D6265727374796C65733E3C2F6E756D6265727374796C
              65733E0D0A3C7374796C6573686565743E3C707374796C65206E616D653D224E
              6F726D616C22206E723D312077707374793D5B5B496E64656E744C6566743A30
              3B496E64656E7446697273743A303B496E64656E7452696768743A303B537061
              63654265666F72653A303B537061636541667465723A303B416C69676E6D656E
              743A303B56657274416C69676E6D656E743A303B43686172466F6E7453697A65
              3A313230303B5D5D2F3E0D0A3C707374796C65206E616D653D2244656661756C
              742050617261677261706820466F6E7422206E723D322077707374793D5B5B49
              6E64656E744C6566743A303B496E64656E7446697273743A303B496E64656E74
              52696768743A303B53706163654265666F72653A303B53706163654166746572
              3A303B416C69676E6D656E743A303B56657274416C69676E6D656E743A303B43
              686172466F6E7453697A653A313130303B5D5D2F3E0D0A3C707374796C65206E
              616D653D2242616C6C6F6F6E205465787422206E723D33206E6578743D224261
              6C6C6F6F6E2054657874222077707374793D5B5B496E64656E744C6566743A30
              3B496E64656E7446697273743A303B496E64656E7452696768743A303B537061
              63654265666F72653A303B537061636541667465723A303B416C69676E6D656E
              743A303B56657274416C69676E6D656E743A303B43686172466F6E743A262333
              393B5365676F65205549262333393B3B43686172436861727365743A313B4368
              6172466F6E7453697A653A3930303B5D5D2F3E0D0A3C707374796C65206E616D
              653D2242616C6C6F6F6E2054657874204368617222206E723D34207770737479
              3D5B5B496E64656E744C6566743A303B496E64656E7446697273743A303B496E
              64656E7452696768743A303B53706163654265666F72653A303B537061636541
              667465723A303B416C69676E6D656E743A303B56657274416C69676E6D656E74
              3A303B43686172466F6E743A262333393B5365676F65205549262333393B3B43
              686172436861727365743A313B43686172466F6E7453697A653A3930303B5D5D
              2F3E0D0A3C2F7374796C6573686565743E3C656C656D656E74206B696E643D22
              486561646572222052616E67653D224F6E416C6C5061676573223E0D0A3C6373
              206E723D312077707374793D5B5B43686172466F6E743A262333393B41726961
              6C262333393B3B43686172436861727365743A313B43686172466F6E7453697A
              653A313130303B5D5D2F3E3C6469762063733D312077707374793D5B5B546162
              523A383234383B5D5D3E3C63206E723D312F3E486561646572206F6E20616C6C
              2050616765732623393B50616765203C7478746F626A2077707374793D5B5B54
              7970653A373B4E616D653A262333343B50414745262333343B3B506172616D73
              3A5B5B315D5D3B57696474683A3132323B4865696768743A3234373B57726170
              3A303B5D5D2063683D312F3E0D0A206F66203C7478746F626A2077707374793D
              5B5B547970653A373B4E616D653A262333343B4E554D5041474553262333343B
              3B506172616D733A5B5B315D5D3B57696474683A3132323B4865696768743A32
              34373B577261703A303B5D5D2063683D312F3E0D0A3C2F6469763E0D0A3C2F65
              6C656D656E743E0D0A3C6469763E3C2F6469763E0D0A}
            RTFVariables = <
              item
                Name = 'Databases'
                SubType = wpxDefault
              end
              item
                Name = 'Generator'
                SubType = wpxDefault
                text = 'WPTools_7.270;'
              end
              item
                Name = 'Author'
                SubType = wpxDefault
                text = 'Astiaji riyanto'
              end
              item
                Name = 'Operator'
                SubType = wpxDefault
                text = 'EDP 211'
              end>
            WPToolBar = WPToolbar1
            WPRuler = WPRuler1
            YOffset = 141
            EditOptions = [wpTableResizing, wpTableColumnResizing, wpObjectMoving, wpObjectResizingWidth, wpObjectResizingHeight, wpObjectResizingKeepRatio, wpObjectSelecting, wpObjectDeletion, wpSpreadsheetCursorMovement, wpActivateUndo, wpActivateUndoHotkey, wpActivateRedo, wpActivateRedoHotkey, wpMoveCPOnPageUpDown]
            ProtectedProp = []
            InsertPointAttr.TextColor = clRed
            InsertPointAttr.BackgroundColor = 13041663
            InsertPointAttr.UseTextColor = True
            InsertPointAttr.UseBackgroundColor = True
            InsertPointAttr.HotEffect = wpeffOutline
            InsertPointAttr.HotStyleIsActive = True
            InsertPointAttr.HotEffectColor = 33023
            HyperlinkTextAttr.Underline = tsTRUE
            HyperlinkTextAttr.UnderlineColor = clBlue
            HyperlinkTextAttr.UseUnderlineColor = True
            HyperlinkTextAttr.HotUnderlineColor = clRed
            HyperlinkTextAttr.HotBackgroundColor = clNavy
            HyperlinkTextAttr.UseHotBackgroundColor = True
            HyperlinkTextAttr.HotTextColor = clRed
            HyperlinkTextAttr.HotUnderline = tsTRUE
            HyperlinkTextAttr.HotStyleIsActive = True
            HiddenTextAttr.Hidden = True
            AutomaticTextAttr.HotBackgroundColor = 33023
            AutomaticTextAttr.UseHotBackgroundColor = True
            AutomaticTextAttr.HotEffect = wpeffOutline
            AutomaticTextAttr.HotStyleIsActive = True
            AutomaticTextAttr.OnHintEventIsActive = True
            AutomaticTextAttr.HotEffectColor = clYellow
            WriteObjectMode = wobStandard
            ClickableCodes = [wpobjMergeField]
            Align = alClient
            ParentColor = False
            TabOrder = 3
          end
        end
      end
      object scPageDaftar: TscPageViewerPage
        Left = 0
        Top = 0
        Width = 991
        Height = 680
        HorzScrollBar.Tracking = True
        VertScrollBar.Tracking = True
        Align = alClient
        BorderStyle = bsNone
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 1
        Visible = False
        WallpaperIndex = -1
        CustomBackgroundImageIndex = -1
        FullUpdate = True
        FluentUIOpaque = False
        StorePaintBuffer = False
        MouseWheelSupport = False
        BackgroundStyle = scsbsFormBackground
        object GridPanel1: TGridPanel
          Left = 0
          Top = 36
          Width = 991
          Height = 77
          Align = alTop
          BevelOuter = bvNone
          ColumnCollection = <
            item
              SizeStyle = ssAbsolute
              Value = 300.000000000000000000
            end
            item
              SizeStyle = ssAbsolute
              Value = 300.000000000000000000
            end
            item
              Value = 100.000000000000000000
            end>
          ControlCollection = <
            item
              Column = 0
              Control = cxLabel5
              Row = 0
            end
            item
              Column = 0
              Control = eDate1
              Row = 1
            end
            item
              Column = 1
              Control = eDate2
              Row = 1
            end
            item
              Column = 1
              Control = cxLabel7
              Row = 0
            end
            item
              Column = 2
              Control = scGPButton1
              Row = 1
            end
            item
              Column = 0
              Row = 2
            end>
          RowCollection = <
            item
              Value = 50.000000000000000000
            end
            item
              Value = 50.000000000000000000
            end
            item
              SizeStyle = ssAuto
            end>
          TabOrder = 0
          object cxLabel5: TcxLabel
            Left = 0
            Top = 0
            Align = alClient
            Caption = 'Tanggal Mulai Permohonan'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            AnchorX = 150
            AnchorY = 19
          end
          object eDate1: TcxDateEdit
            AlignWithMargins = True
            Left = 3
            Top = 41
            Align = alClient
            ParentFont = False
            Properties.DateButtons = [btnClear, btnToday]
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.View = cavModern
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 0
            ExplicitHeight = 21
            Width = 294
          end
          object eDate2: TcxDateEdit
            AlignWithMargins = True
            Left = 303
            Top = 41
            Align = alLeft
            ParentFont = False
            Properties.DateButtons = [btnClear, btnToday]
            Properties.SaveTime = False
            Properties.ShowTime = False
            Properties.View = cavModern
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -16
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            TabOrder = 1
            ExplicitHeight = 21
            Width = 282
          end
          object cxLabel7: TcxLabel
            Left = 339
            Top = 2
            Align = alCustom
            AutoSize = False
            Caption = 'Tanggal Selesai Permohonan'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -13
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = []
            Style.IsFontAssigned = True
            Properties.Alignment.Horz = taCenter
            Properties.Alignment.Vert = taVCenter
            Height = 33
            Width = 170
            AnchorX = 424
            AnchorY = 19
          end
          object scGPButton1: TscGPButton
            Left = 600
            Top = 38
            Width = 100
            Height = 38
            Align = alLeft
            FluentUIOpaque = False
            TabOrder = 4
            TabStop = True
            OnClick = scGPButton1Click
            Animation = False
            Badge.Color = clRed
            Badge.ColorAlpha = 255
            Badge.Font.Charset = DEFAULT_CHARSET
            Badge.Font.Color = clWhite
            Badge.Font.Height = -11
            Badge.Font.Name = 'Tahoma'
            Badge.Font.Style = [fsBold]
            Badge.Visible = False
            Caption = 'Cari'
            CaptionCenterAlignment = False
            CanFocused = True
            CustomDropDown = False
            DrawTextMode = scdtmGDI
            Margin = -1
            Spacing = 1
            Layout = blGlyphLeft
            ImageIndex = -1
            ImageMargin = 0
            TransparentBackground = True
            Options.NormalColor = clBtnFace
            Options.HotColor = clBtnFace
            Options.PressedColor = clBtnShadow
            Options.FocusedColor = clBtnFace
            Options.DisabledColor = clBtnFace
            Options.NormalColor2 = clNone
            Options.HotColor2 = clNone
            Options.PressedColor2 = clNone
            Options.FocusedColor2 = clNone
            Options.DisabledColor2 = clNone
            Options.NormalColorAlpha = 255
            Options.HotColorAlpha = 255
            Options.PressedColorAlpha = 255
            Options.FocusedColorAlpha = 255
            Options.DisabledColorAlpha = 255
            Options.NormalColor2Alpha = 255
            Options.HotColor2Alpha = 255
            Options.PressedColor2Alpha = 255
            Options.FocusedColor2Alpha = 255
            Options.DisabledColor2Alpha = 255
            Options.FrameNormalColor = clBtnShadow
            Options.FrameHotColor = clHighlight
            Options.FramePressedColor = clHighlight
            Options.FrameFocusedColor = clHighlight
            Options.FrameDisabledColor = clBtnShadow
            Options.FrameWidth = 1
            Options.FrameNormalColorAlpha = 255
            Options.FrameHotColorAlpha = 255
            Options.FramePressedColorAlpha = 255
            Options.FrameFocusedColorAlpha = 255
            Options.FrameDisabledColorAlpha = 255
            Options.FontNormalColor = clBtnText
            Options.FontHotColor = clBtnText
            Options.FontPressedColor = clBtnText
            Options.FontFocusedColor = clBtnText
            Options.FontDisabledColor = clBtnShadow
            Options.ShapeFillGradientAngle = 90
            Options.ShapeFillGradientPressedAngle = -90
            Options.ShapeFillGradientColorOffset = 25
            Options.ShapeCornerRadius = 10
            Options.ShapeStyle = scgpRect
            Options.ShapeStyleLineSize = 0
            Options.ArrowSize = 9
            Options.ArrowAreaSize = 0
            Options.ArrowType = scgpatDefault
            Options.ArrowThickness = 2
            Options.ArrowThicknessScaled = False
            Options.ArrowNormalColor = clBtnText
            Options.ArrowHotColor = clBtnText
            Options.ArrowPressedColor = clBtnText
            Options.ArrowFocusedColor = clBtnText
            Options.ArrowDisabledColor = clBtnText
            Options.ArrowNormalColorAlpha = 200
            Options.ArrowHotColorAlpha = 255
            Options.ArrowPressedColorAlpha = 255
            Options.ArrowFocusedColorAlpha = 200
            Options.ArrowDisabledColorAlpha = 125
            Options.StyleColors = True
            Options.PressedHotColors = False
            HotImageIndex = -1
            FluentLightEffect = False
            FocusedImageIndex = -1
            PressedImageIndex = -1
            UseGalleryMenuImage = False
            UseGalleryMenuCaption = False
            ScaleMarginAndSpacing = False
            WidthWithCaption = 0
            WidthWithoutCaption = 0
            SplitButton = False
            RepeatClick = False
            RepeatClickInterval = 100
            GlowEffect.Enabled = False
            GlowEffect.Color = clHighlight
            GlowEffect.AlphaValue = 255
            GlowEffect.GlowSize = 7
            GlowEffect.Offset = 0
            GlowEffect.Intensive = True
            GlowEffect.StyleColors = True
            GlowEffect.HotColor = clNone
            GlowEffect.PressedColor = clNone
            GlowEffect.FocusedColor = clNone
            GlowEffect.PressedGlowSize = 7
            GlowEffect.PressedAlphaValue = 255
            GlowEffect.States = [scsHot, scsPressed, scsFocused]
            ImageGlow = True
            ShowGalleryMenuFromTop = False
            ShowGalleryMenuFromRight = False
            ShowMenuArrow = True
            ShowFocusRect = True
            Down = False
            GroupIndex = 0
            AllowAllUp = False
            ToggleMode = False
          end
        end
        object scLabel21: TscLabel
          Left = 0
          Top = 0
          Width = 991
          Height = 36
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          FluentUIOpaque = False
          TabOrder = 1
          DragForm = False
          DragTopForm = True
          GlowEffect.Enabled = False
          GlowEffect.Color = clBtnShadow
          GlowEffect.AlphaValue = 255
          GlowEffect.GlowSize = 7
          GlowEffect.Offset = 0
          GlowEffect.Intensive = True
          GlowEffect.StyleColors = True
          AutoSize = False
          UseFontColorToStyleColor = False
          Caption = 'Periode Permohonan'
        end
        object cxGrid1: TcxGrid
          Left = 0
          Top = 113
          Width = 991
          Height = 567
          Align = alClient
          TabOrder = 2
          object gxList: TcxGridDBTableView
            Navigator.Buttons.CustomButtons = <>
            FindPanel.ClearFindFilterTextOnClose = False
            DataController.DataSource = dsList
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
            object gxListGOID: TcxGridDBColumn
              Caption = 'No. Permohonan'
              DataBinding.FieldName = 'GOID'
              Options.Editing = False
              Options.Filtering = False
            end
            object gxListPART_NOTICE: TcxGridDBColumn
              DataBinding.FieldName = 'PART_NOTICE'
              Options.Editing = False
              Options.Filtering = False
            end
            object gxListID_LEGAL: TcxGridDBColumn
              DataBinding.FieldName = 'ID_LEGAL'
              Options.Editing = False
              Options.Filtering = False
            end
            object gxListENDUSER_NO: TcxGridDBColumn
              DataBinding.FieldName = 'ENDUSER_NO'
              Options.Editing = False
              Options.Filtering = False
            end
            object gxListIDWIL_PEMOHON: TcxGridDBColumn
              DataBinding.FieldName = 'IDWIL_PEMOHON'
              Options.Editing = False
              Options.Filtering = False
            end
            object gxListNAMA_KANTOR1: TcxGridDBColumn
              DataBinding.FieldName = 'NAMA_KANTOR1'
              Options.Editing = False
              Options.Filtering = False
            end
            object gxListTYPE_ANGGOTA: TcxGridDBColumn
              DataBinding.FieldName = 'TYPE_ANGGOTA'
              Options.Editing = False
              Options.Filtering = False
            end
            object gxListSTATUS_REG: TcxGridDBColumn
              DataBinding.FieldName = 'STATUS_REG'
              Options.Editing = False
              Options.Filtering = False
            end
            object gxListDATE_REGISTER: TcxGridDBColumn
              DataBinding.FieldName = 'DATE_REGISTER'
              Options.Editing = False
              Options.Filtering = False
              Width = 100
            end
            object gxListAPPROVAL: TcxGridDBColumn
              DataBinding.FieldName = 'APPROVAL'
              Options.Editing = False
              Options.Filtering = False
              Width = 113
            end
            object gxListID_ANGGOTA: TcxGridDBColumn
              DataBinding.FieldName = 'ID_ANGGOTA'
              Options.Editing = False
              Options.Filtering = False
            end
            object gxListNO_REK: TcxGridDBColumn
              DataBinding.FieldName = 'NO_REK'
              Options.Editing = False
              Options.Filtering = False
            end
            object gxListIDWIL_DEBT: TcxGridDBColumn
              DataBinding.FieldName = 'IDWIL_DEBT'
              Options.Editing = False
              Options.Filtering = False
            end
            object gxListGO_DATE: TcxGridDBColumn
              DataBinding.FieldName = 'GO_DATE'
            end
            object gxListCRT_DATE: TcxGridDBColumn
              DataBinding.FieldName = 'CRT_DATE'
            end
            object gxListCRT_USER: TcxGridDBColumn
              DataBinding.FieldName = 'CRT_USER'
            end
            object gxListOI_ANGGOTA: TcxGridDBColumn
              DataBinding.FieldName = 'OI_ANGGOTA'
            end
            object gxListNAMA: TcxGridDBColumn
              DataBinding.FieldName = 'NAMA'
            end
            object gxListKOTALAHIR: TcxGridDBColumn
              DataBinding.FieldName = 'KOTALAHIR'
            end
            object gxListTGLLAHIR: TcxGridDBColumn
              DataBinding.FieldName = 'TGLLAHIR'
            end
            object gxListKOTA: TcxGridDBColumn
              DataBinding.FieldName = 'KOTA'
            end
            object gxListKECAMATAN: TcxGridDBColumn
              DataBinding.FieldName = 'KECAMATAN'
            end
            object gxListDESA: TcxGridDBColumn
              DataBinding.FieldName = 'DESA'
            end
            object gxListRTRW: TcxGridDBColumn
              DataBinding.FieldName = 'RTRW'
            end
          end
          object gxReport: TcxGridDBBandedTableView
            Navigator.Buttons.CustomButtons = <>
            DataController.DataSource = dsList
            DataController.Summary.DefaultGroupSummaryItems = <>
            DataController.Summary.FooterSummaryItems = <>
            DataController.Summary.SummaryGroups = <>
            OptionsView.GroupByBox = False
            Bands = <
              item
                Caption = 'No'
                FixedKind = fkLeft
                Width = 350
              end
              item
                Caption = 'Data'
              end>
            object gxReportColNo: TcxGridDBBandedColumn
              Caption = 'No'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Width = 23
              Position.BandIndex = 0
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object gxReportNO_REK: TcxGridDBBandedColumn
              Caption = 'No. Pinjaman'
              DataBinding.FieldName = 'NO_REK'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Width = 83
              Position.BandIndex = 0
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object gxReportIDWIL_DEBT: TcxGridDBBandedColumn
              DataBinding.FieldName = 'IDWIL_DEBT'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Width = 68
              Position.BandIndex = 0
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object gxReportGOID: TcxGridDBBandedColumn
              DataBinding.FieldName = 'GOID'
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 0
              Position.RowIndex = 0
            end
            object gxReportGO_DATE: TcxGridDBBandedColumn
              Caption = 'Tg. Permohonan'
              DataBinding.FieldName = 'GO_DATE'
              Options.Editing = False
              Options.Filtering = False
              Width = 133
              Position.BandIndex = 1
              Position.ColIndex = 1
              Position.RowIndex = 0
            end
            object gxReportCRT_DATE: TcxGridDBBandedColumn
              Caption = 'Tg. Pengerjaam'
              DataBinding.FieldName = 'CRT_DATE'
              Options.Editing = False
              Options.Filtering = False
              Width = 131
              Position.BandIndex = 1
              Position.ColIndex = 2
              Position.RowIndex = 0
            end
            object gxReportOI_ANGGOTA: TcxGridDBBandedColumn
              DataBinding.FieldName = 'OI_ANGGOTA'
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object gxReportPART_NOTICE: TcxGridDBBandedColumn
              Caption = 'Perihal Pemohon'
              DataBinding.FieldName = 'PART_NOTICE'
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object gxReportIDWIL_PEMOHON: TcxGridDBBandedColumn
              Caption = 'Kode Kantor Pemohon'
              DataBinding.FieldName = 'IDWIL_PEMOHON'
              Options.Editing = False
              Options.Filtering = False
              Width = 47
              Position.BandIndex = 1
              Position.ColIndex = 5
              Position.RowIndex = 0
            end
            object gxReportNAMA_KANTOR1: TcxGridDBBandedColumn
              Caption = 'Terdaftar di Kantor '
              DataBinding.FieldName = 'NAMA_KANTOR1'
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 6
              Position.RowIndex = 0
            end
            object gxReportTYPE_ANGGOTA: TcxGridDBBandedColumn
              Caption = 'Tipe Anggota'
              DataBinding.FieldName = 'TYPE_ANGGOTA'
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 7
              Position.RowIndex = 0
            end
            object gxReportSTATUS_REG: TcxGridDBBandedColumn
              DataBinding.FieldName = 'STATUS_REG'
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 8
              Position.RowIndex = 0
            end
            object gxReportDATE_REGISTER: TcxGridDBBandedColumn
              Caption = 'Tg. Jadi Anggota'
              DataBinding.FieldName = 'DATE_REGISTER'
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 9
              Position.RowIndex = 0
            end
            object gxReportDATE_RESIGN: TcxGridDBBandedColumn
              Caption = 'Tgl. Keluar Anggota'
              DataBinding.FieldName = 'DATE_RESIGN'
              Options.Editing = False
              Options.Filtering = False
              Width = 37
              Position.BandIndex = 1
              Position.ColIndex = 11
              Position.RowIndex = 0
            end
            object gxReportDATE_APPROVAL: TcxGridDBBandedColumn
              Caption = 'Tg.Persetujuan'
              DataBinding.FieldName = 'DATE_APPROVAL'
              Options.Editing = False
              Options.Filtering = False
              Width = 114
              Position.BandIndex = 1
              Position.ColIndex = 10
              Position.RowIndex = 0
            end
            object gxReportSTATUS_REGISTER: TcxGridDBBandedColumn
              DataBinding.FieldName = 'STATUS_REGISTER'
              Options.Editing = False
              Options.Filtering = False
              Width = 73
              Position.BandIndex = 1
              Position.ColIndex = 12
              Position.RowIndex = 0
            end
            object gxReportID_ANGGOTA: TcxGridDBBandedColumn
              DataBinding.FieldName = 'ID_ANGGOTA'
              Options.Editing = False
              Options.Filtering = False
              Position.BandIndex = 1
              Position.ColIndex = 13
              Position.RowIndex = 0
            end
            object gxReportGO_STATUS: TcxGridDBBandedColumn
              DataBinding.FieldName = 'GO_STATUS'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Width = 73
              Position.BandIndex = 0
              Position.ColIndex = 3
              Position.RowIndex = 0
            end
            object gxReportNAMA: TcxGridDBBandedColumn
              DataBinding.FieldName = 'NAMA'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Options.FilteringFilteredItemsList = False
              Options.FilteringMRUItemsList = False
              Options.FilteringPopup = False
              Width = 103
              Position.BandIndex = 0
              Position.ColIndex = 4
              Position.RowIndex = 0
            end
            object gxReportKOTALAHIR: TcxGridDBBandedColumn
              DataBinding.FieldName = 'KOTALAHIR'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Position.BandIndex = 1
              Position.ColIndex = 14
              Position.RowIndex = 0
            end
            object gxReportTGLLAHIR: TcxGridDBBandedColumn
              DataBinding.FieldName = 'TGLLAHIR'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Position.BandIndex = 1
              Position.ColIndex = 15
              Position.RowIndex = 0
            end
            object gxReportKOTA: TcxGridDBBandedColumn
              DataBinding.FieldName = 'KOTA'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Position.BandIndex = 1
              Position.ColIndex = 16
              Position.RowIndex = 0
            end
            object gxReportKECAMATAN: TcxGridDBBandedColumn
              DataBinding.FieldName = 'KECAMATAN'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Position.BandIndex = 1
              Position.ColIndex = 17
              Position.RowIndex = 0
            end
            object gxReportDESA: TcxGridDBBandedColumn
              DataBinding.FieldName = 'DESA'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Position.BandIndex = 1
              Position.ColIndex = 18
              Position.RowIndex = 0
            end
            object gxReportRTRW: TcxGridDBBandedColumn
              DataBinding.FieldName = 'RTRW'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Position.BandIndex = 1
              Position.ColIndex = 19
              Position.RowIndex = 0
            end
            object gxReportPEKERJAAN: TcxGridDBBandedColumn
              DataBinding.FieldName = 'PEKERJAAN'
              Options.Editing = False
              Options.Filtering = False
              Options.FilteringAddValueItems = False
              Position.BandIndex = 1
              Position.ColIndex = 20
              Position.RowIndex = 0
            end
            object gxReportNAMA_IDLEGAL: TcxGridDBBandedColumn
              DataBinding.FieldName = 'NAMA_IDLEGAL'
              Position.BandIndex = 1
              Position.ColIndex = 21
              Position.RowIndex = 0
            end
            object gxReportUMUR: TcxGridDBBandedColumn
              DataBinding.FieldName = 'UMUR'
              Position.BandIndex = 1
              Position.ColIndex = 22
              Position.RowIndex = 0
            end
            object gxReportGENDER: TcxGridDBBandedColumn
              DataBinding.FieldName = 'GENDER'
              Position.BandIndex = 1
              Position.ColIndex = 23
              Position.RowIndex = 0
            end
          end
          object cxGrid1Level1: TcxGridLevel
            GridView = gxReport
          end
        end
      end
      object scPageRegister: TscPageViewerPage
        Tag = 6
        Left = 0
        Top = 0
        Width = 991
        Height = 680
        HorzScrollBar.Tracking = True
        VertScrollBar.Tracking = True
        Align = alClient
        BorderStyle = bsNone
        Color = clWindow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentColor = False
        ParentFont = False
        TabOrder = 0
        WallpaperIndex = -1
        CustomBackgroundImageIndex = -1
        FullUpdate = True
        FluentUIOpaque = False
        StorePaintBuffer = False
        MouseWheelSupport = False
        BackgroundStyle = scsbsFormBackground
        object scLabel23: TscLabel
          AlignWithMargins = True
          Left = 12
          Top = 3
          Width = 976
          Height = 45
          Margins.Left = 12
          Align = alTop
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Tahoma'
          Font.Style = []
          ParentFont = False
          FluentUIOpaque = False
          TabOrder = 0
          DragForm = False
          DragTopForm = True
          GlowEffect.Enabled = False
          GlowEffect.Color = clBtnShadow
          GlowEffect.AlphaValue = 255
          GlowEffect.GlowSize = 7
          GlowEffect.Offset = 0
          GlowEffect.Intensive = True
          GlowEffect.StyleColors = True
          AutoSize = False
          VertAlignment = scvtaCenter
          UseFontColorToStyleColor = False
          Caption = 'Form 1 - Identifikasi Data'
        end
        object sCVA_p1: TscGPPanel
          AlignWithMargins = True
          Left = 12
          Top = 51
          Width = 357
          Height = 629
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alLeft
          Padding.Left = 12
          Padding.Top = 12
          Padding.Right = 12
          Padding.Bottom = 12
          FluentUIOpaque = False
          TabOrder = 1
          BlurBackground = False
          BlurBackgroundAmount = 5
          BackgroundStyle = gppbsColor
          ContentMarginLeft = 0
          ContentMarginRight = 0
          ContentMarginTop = 0
          ContentMarginBottom = 0
          CustomImageIndex = -1
          DragForm = False
          DragTopForm = True
          DrawTextMode = scdtmGDI
          FrameSides = [gppfsLeft, gppfsTop, gppfsBottom]
          FillGradientAngle = 90
          FillGradientBeginAlpha = 255
          FillGradientEndAlpha = 255
          FillGradientBeginColorOffset = 25
          FillGradientEndColorOffset = 25
          FrameWidth = 1
          FillColor = clWindow
          FillColorAlpha = 150
          FillColor2 = clWindow
          FrameColor = clBtnShadow
          FrameColorAlpha = 255
          FrameRadius = 0
          ShowCaption = False
          CaptionGlowEffect.Enabled = False
          CaptionGlowEffect.Color = clBtnShadow
          CaptionGlowEffect.AlphaValue = 255
          CaptionGlowEffect.GlowSize = 7
          CaptionGlowEffect.Offset = 0
          CaptionGlowEffect.Intensive = True
          CaptionGlowEffect.StyleColors = True
          Color = clBtnFace
          Caption = 'Data Pemohon'
          TransparentBackground = True
          StorePaintBuffer = True
          Sizeable = False
          WallpaperIndex = -1
          WordWrap = False
          object scGPPanel1: TscGPPanel
            AlignWithMargins = True
            Left = 13
            Top = 13
            Width = 344
            Height = 148
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alTop
            Padding.Bottom = 12
            FluentUIOpaque = False
            TabOrder = 0
            BlurBackground = False
            BlurBackgroundAmount = 5
            BackgroundStyle = gppbsColor
            ContentMarginLeft = 0
            ContentMarginRight = 0
            ContentMarginTop = 0
            ContentMarginBottom = 0
            CustomImageIndex = -1
            DragForm = False
            DragTopForm = True
            DrawTextMode = scdtmGDI
            FrameSides = [gppfsBottom]
            FillGradientAngle = 90
            FillGradientBeginAlpha = 255
            FillGradientEndAlpha = 255
            FillGradientBeginColorOffset = 25
            FillGradientEndColorOffset = 25
            FrameWidth = 1
            FillColor = clWindow
            FillColorAlpha = 150
            FillColor2 = clWindow
            FrameColor = clBtnShadow
            FrameColorAlpha = 255
            FrameRadius = 0
            ShowCaption = False
            CaptionGlowEffect.Enabled = False
            CaptionGlowEffect.Color = clBtnShadow
            CaptionGlowEffect.AlphaValue = 255
            CaptionGlowEffect.GlowSize = 7
            CaptionGlowEffect.Offset = 0
            CaptionGlowEffect.Intensive = True
            CaptionGlowEffect.StyleColors = True
            Color = clBtnFace
            Caption = 'Data Pemohon'
            TransparentBackground = True
            StorePaintBuffer = True
            Sizeable = False
            WallpaperIndex = -1
            WordWrap = False
            object cbKategoryRek: TcxComboBox
              AlignWithMargins = True
              Left = 3
              Top = 33
              Align = alTop
              AutoSize = False
              ParentFont = False
              Properties.Items.Strings = (
                'NIK'
                'PINJAMAN'
                'SIMPANAN')
              Properties.OnEditValueChanged = cbKategoryRekPropertiesEditValueChanged
              Style.Edges = [bLeft, bTop, bRight, bBottom]
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -13
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.Shadow = False
              Style.IsFontAssigned = True
              TabOrder = 0
              Text = 'PINJAMAN'
              Height = 27
              Width = 338
            end
            object cxLabel4: TcxLabel
              Left = 0
              Top = 0
              Align = alTop
              AutoSize = False
              Caption = 'Type Source Account'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -15
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Height = 30
              Width = 344
            end
            object cxLabel2: TcxLabel
              AlignWithMargins = True
              Left = 3
              Top = 66
              Align = alTop
              AutoSize = False
              Caption = 'Account Source'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -15
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
              Height = 30
              Width = 338
            end
            object scGPPanel5: TscGPPanel
              Left = 0
              Top = 99
              Width = 344
              Height = 36
              Align = alClient
              FluentUIOpaque = False
              TabOrder = 3
              BlurBackground = False
              BlurBackgroundAmount = 5
              BackgroundStyle = gppbsColor
              ContentMarginLeft = 0
              ContentMarginRight = 0
              ContentMarginTop = 0
              ContentMarginBottom = 0
              CustomImageIndex = -1
              DragForm = False
              DragTopForm = True
              DrawTextMode = scdtmGDI
              FrameSides = []
              FillGradientAngle = 90
              FillGradientBeginAlpha = 255
              FillGradientEndAlpha = 255
              FillGradientBeginColorOffset = 25
              FillGradientEndColorOffset = 25
              FrameWidth = 1
              FillColor = clWindow
              FillColorAlpha = 150
              FillColor2 = clWindow
              FrameColor = clBtnShadow
              FrameColorAlpha = 255
              FrameRadius = 0
              ShowCaption = False
              CaptionGlowEffect.Enabled = False
              CaptionGlowEffect.Color = clBtnShadow
              CaptionGlowEffect.AlphaValue = 255
              CaptionGlowEffect.GlowSize = 7
              CaptionGlowEffect.Offset = 0
              CaptionGlowEffect.Intensive = True
              CaptionGlowEffect.StyleColors = True
              Color = clBtnFace
              Caption = 'scGPPanel5'
              TransparentBackground = True
              StorePaintBuffer = True
              Sizeable = False
              WallpaperIndex = -1
              WordWrap = False
              object edLoadiD: TscGPEdit
                Left = 0
                Top = 0
                Width = 239
                Height = 36
                AutoSize = False
                FluentUIOpaque = False
                Options.NormalColor = clWindow
                Options.HotColor = clWindow
                Options.FocusedColor = clWindow
                Options.DisabledColor = clWindow
                Options.NormalColorAlpha = 200
                Options.HotColorAlpha = 255
                Options.FocusedColorAlpha = 255
                Options.DisabledColorAlpha = 150
                Options.FrameNormalColor = clBtnText
                Options.FrameHotColor = clHighlight
                Options.FrameFocusedColor = clHighlight
                Options.FrameDisabledColor = clBtnText
                Options.FrameWidth = 1
                Options.FrameNormalColorAlpha = 100
                Options.FrameHotColorAlpha = 255
                Options.FrameFocusedColorAlpha = 255
                Options.FrameDisabledColorAlpha = 50
                Options.FontNormalColor = clWindowText
                Options.FontHotColor = clWindowText
                Options.FontFocusedColor = clWindowText
                Options.FontDisabledColor = clGrayText
                Options.FocusedLineColor = clHighlight
                Options.FocusedLineWidth = 0
                Options.ShapeFillGradientAngle = 90
                Options.ShapeCornerRadius = 21
                Options.ShapeStyle = scgpessLine
                Options.ScaleFrameWidth = False
                Options.StyleColors = True
                ContentMarginLeft = 5
                ContentMarginRight = 5
                ContentMarginTop = 5
                ContentMarginBottom = 5
                PromptText = 'Nomor Pinjaman'
                HideMaskWithEmptyText = False
                HidePromptTextIfFocused = False
                PromptTextColor = clNone
                Transparent = True
                LeftButton.Kind = scgpebClear
                LeftButton.Enabled = True
                LeftButton.Visible = False
                LeftButton.ImageIndex = -1
                LeftButton.ImageHotIndex = -1
                LeftButton.ImagePressedIndex = -1
                LeftButton.RepeatClick = False
                LeftButton.RepeatClickInterval = 200
                LeftButton.ShowHint = False
                LeftButton.GlyphColor = clWindowText
                LeftButton.GlyphColorAlpha = 180
                LeftButton.GlyphColorHotAlpha = 240
                LeftButton.GlyphColorPressedAlpha = 150
                LeftButton.GlyphThickness = 2
                LeftButton.GlyphSize = 0
                LeftButton.Width = 0
                RightButton.Kind = scgpebClear
                RightButton.Enabled = True
                RightButton.Visible = True
                RightButton.ImageIndex = -1
                RightButton.ImageHotIndex = -1
                RightButton.ImagePressedIndex = -1
                RightButton.RepeatClick = False
                RightButton.RepeatClickInterval = 200
                RightButton.ShowHint = False
                RightButton.GlyphColor = clHighlight
                RightButton.GlyphColorAlpha = 180
                RightButton.GlyphColorHotAlpha = 240
                RightButton.GlyphColorPressedAlpha = 150
                RightButton.GlyphThickness = 2
                RightButton.GlyphSize = 0
                RightButton.Width = 0
                CustomDraw = False
                Text = ''
                Align = alClient
                Color = clBtnFace
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                OnRightButtonClick = edLoadiDRightButtonClick
                OnKeyDown = edLoadiDKeyDown
              end
              object btCheckVA: TscGPCharGlyphButton
                AlignWithMargins = True
                Left = 242
                Top = 1
                Width = 99
                Height = 34
                Margins.Top = 1
                Margins.Bottom = 1
                Align = alRight
                FluentUIOpaque = False
                TabOrder = 1
                TabStop = True
                OnClick = btCheckVAClick
                Animation = False
                Badge.Color = clRed
                Badge.ColorAlpha = 255
                Badge.Font.Charset = DEFAULT_CHARSET
                Badge.Font.Color = clWhite
                Badge.Font.Height = -11
                Badge.Font.Name = 'Tahoma'
                Badge.Font.Style = [fsBold]
                Badge.Visible = False
                Caption = '&Check'
                CaptionCenterAlignment = False
                CanFocused = True
                CustomDropDown = False
                DrawTextMode = scdtmGDI
                FluentLightEffect = False
                Layout = blGlyphLeft
                TransparentBackground = True
                Options.NormalColor = clBtnText
                Options.HotColor = clBtnText
                Options.PressedColor = clBtnText
                Options.FocusedColor = clBtnFace
                Options.DisabledColor = clBtnText
                Options.NormalColor2 = clNone
                Options.HotColor2 = clNone
                Options.PressedColor2 = clNone
                Options.FocusedColor2 = clNone
                Options.DisabledColor2 = clNone
                Options.NormalColorAlpha = 10
                Options.HotColorAlpha = 20
                Options.PressedColorAlpha = 30
                Options.FocusedColorAlpha = 255
                Options.DisabledColorAlpha = 5
                Options.NormalColor2Alpha = 255
                Options.HotColor2Alpha = 255
                Options.PressedColor2Alpha = 255
                Options.FocusedColor2Alpha = 255
                Options.DisabledColor2Alpha = 255
                Options.FrameNormalColor = clBtnText
                Options.FrameHotColor = clBtnText
                Options.FramePressedColor = clBtnText
                Options.FrameFocusedColor = clHighlight
                Options.FrameDisabledColor = clBtnText
                Options.FrameWidth = 1
                Options.FrameNormalColorAlpha = 70
                Options.FrameHotColorAlpha = 100
                Options.FramePressedColorAlpha = 150
                Options.FrameFocusedColorAlpha = 255
                Options.FrameDisabledColorAlpha = 30
                Options.FontNormalColor = clBtnText
                Options.FontHotColor = clBtnText
                Options.FontPressedColor = clBtnText
                Options.FontFocusedColor = clBtnText
                Options.FontDisabledColor = clBtnShadow
                Options.ShapeFillGradientAngle = 90
                Options.ShapeFillGradientPressedAngle = -90
                Options.ShapeFillGradientColorOffset = 25
                Options.ShapeCornerRadius = 18
                Options.ShapeStyle = scgpRoundedRect
                Options.ShapeStyleLineSize = 0
                Options.ArrowSize = 9
                Options.ArrowAreaSize = 0
                Options.ArrowType = scgpatDefault
                Options.ArrowThickness = 2
                Options.ArrowThicknessScaled = False
                Options.ArrowNormalColor = clBtnText
                Options.ArrowHotColor = clBtnText
                Options.ArrowPressedColor = clBtnText
                Options.ArrowFocusedColor = clBtnText
                Options.ArrowDisabledColor = clBtnText
                Options.ArrowNormalColorAlpha = 200
                Options.ArrowHotColorAlpha = 255
                Options.ArrowPressedColorAlpha = 255
                Options.ArrowFocusedColorAlpha = 200
                Options.ArrowDisabledColorAlpha = 125
                Options.StyleColors = True
                Options.PressedHotColors = False
                GlyphOptions.NormalColor = clBtnText
                GlyphOptions.HotColor = clBtnText
                GlyphOptions.PressedColor = clBtnText
                GlyphOptions.FocusedColor = clBtnText
                GlyphOptions.DisabledColor = clBtnText
                GlyphOptions.NormalColorAlpha = 200
                GlyphOptions.HotColorAlpha = 255
                GlyphOptions.PressedColorAlpha = 255
                GlyphOptions.FocusedColorAlpha = 255
                GlyphOptions.DisabledColorAlpha = 100
                GlyphOptions.Index = 2
                GlyphOptions.Margin = 0
                GlyphOptions.Size = 20
                GlyphOptions.StyleColors = True
                TextMargin = 10
                WidthWithCaption = 0
                WidthWithoutCaption = 0
                ShowCaption = True
                SplitButton = False
                RepeatClick = False
                RepeatClickInterval = 100
                ShowGalleryMenuFromTop = False
                ShowGalleryMenuFromRight = False
                ShowMenuArrow = True
                ShowFocusRect = True
                Down = False
                GroupIndex = 0
                AllowAllUp = False
                ToggleMode = False
              end
            end
          end
          object scGPPanel3: TscGPPanel
            AlignWithMargins = True
            Left = 13
            Top = 423
            Width = 344
            Height = 193
            Margins.Left = 0
            Margins.Top = 0
            Margins.Right = 0
            Margins.Bottom = 0
            Align = alClient
            FluentUIOpaque = False
            TabOrder = 1
            BlurBackground = False
            BlurBackgroundAmount = 5
            BackgroundStyle = gppbsColor
            ContentMarginLeft = 0
            ContentMarginRight = 0
            ContentMarginTop = 0
            ContentMarginBottom = 0
            CustomImageIndex = -1
            DragForm = False
            DragTopForm = True
            DrawTextMode = scdtmGDI
            FrameSides = [gppfsBottom]
            FillGradientAngle = 90
            FillGradientBeginAlpha = 255
            FillGradientEndAlpha = 255
            FillGradientBeginColorOffset = 25
            FillGradientEndColorOffset = 25
            FrameWidth = 1
            FillColor = clWindow
            FillColorAlpha = 150
            FillColor2 = clWindow
            FrameColor = clBtnShadow
            FrameColorAlpha = 255
            FrameRadius = 0
            ShowCaption = False
            CaptionGlowEffect.Enabled = False
            CaptionGlowEffect.Color = clBtnShadow
            CaptionGlowEffect.AlphaValue = 255
            CaptionGlowEffect.GlowSize = 7
            CaptionGlowEffect.Offset = 0
            CaptionGlowEffect.Intensive = True
            CaptionGlowEffect.StyleColors = True
            Color = clBtnFace
            Caption = 'Data Pemohon'
            TransparentBackground = True
            StorePaintBuffer = True
            Sizeable = False
            WallpaperIndex = -1
            WordWrap = False
            object cxLabel3: TcxLabel
              AlignWithMargins = True
              Left = 0
              Top = 1
              Margins.Left = 0
              Margins.Top = 1
              Margins.Right = 5
              Margins.Bottom = 0
              Align = alTop
              Caption = 'Catatan Keanggotaan'
              ParentFont = False
              Style.Font.Charset = DEFAULT_CHARSET
              Style.Font.Color = clWindowText
              Style.Font.Height = -15
              Style.Font.Name = 'Tahoma'
              Style.Font.Style = []
              Style.IsFontAssigned = True
            end
            object asgLoan: TStringGrid
              Left = 0
              Top = 23
              Width = 344
              Height = 169
              Align = alClient
              BorderStyle = bsNone
              ColCount = 2
              DefaultColWidth = 150
              RowCount = 8
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'Tahoma'
              Font.Style = []
              Options = [goHorzLine, goRangeSelect, goColSizing]
              ParentFont = False
              TabOrder = 1
              ExplicitTop = 22
              ExplicitHeight = 170
              RowHeights = (
                24
                24
                24
                24
                24
                24
                24
                24)
            end
          end
          object asgProfile: TStringGrid
            Left = 13
            Top = 161
            Width = 344
            Height = 262
            Align = alTop
            BorderStyle = bsNone
            ColCount = 2
            DefaultColWidth = 150
            RowCount = 8
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = []
            Options = [goHorzLine, goRangeSelect, goColSizing]
            ParentFont = False
            TabOrder = 2
            RowHeights = (
              24
              24
              24
              24
              26
              24
              24
              24)
          end
        end
        object sCVA_p2: TscGPPanel
          AlignWithMargins = True
          Left = 369
          Top = 51
          Width = 622
          Height = 629
          Margins.Left = 0
          Margins.Top = 0
          Margins.Right = 0
          Margins.Bottom = 0
          Align = alClient
          Padding.Bottom = 12
          FluentUIOpaque = False
          TabOrder = 2
          BlurBackground = False
          BlurBackgroundAmount = 5
          BackgroundStyle = gppbsColor
          ContentMarginLeft = 0
          ContentMarginRight = 0
          ContentMarginTop = 0
          ContentMarginBottom = 0
          CustomImageIndex = -1
          DragForm = False
          DragTopForm = True
          DrawTextMode = scdtmGDI
          FrameSides = [gppfsTop, gppfsRight, gppfsBottom]
          FillGradientAngle = 90
          FillGradientBeginAlpha = 255
          FillGradientEndAlpha = 255
          FillGradientBeginColorOffset = 25
          FillGradientEndColorOffset = 25
          FrameWidth = 1
          FillColor = clWindow
          FillColorAlpha = 150
          FillColor2 = clWindow
          FrameColor = clBtnShadow
          FrameColorAlpha = 255
          FrameRadius = 0
          ShowCaption = False
          CaptionGlowEffect.Enabled = False
          CaptionGlowEffect.Color = clBtnShadow
          CaptionGlowEffect.AlphaValue = 255
          CaptionGlowEffect.GlowSize = 7
          CaptionGlowEffect.Offset = 0
          CaptionGlowEffect.Intensive = True
          CaptionGlowEffect.StyleColors = True
          Color = clBtnFace
          Caption = 'Data Pemohon'
          TransparentBackground = True
          StorePaintBuffer = True
          Sizeable = False
          WallpaperIndex = -1
          WordWrap = False
          object GridP_Billing: TGridPanel
            AlignWithMargins = True
            Left = 5
            Top = 26
            Width = 611
            Height = 354
            Margins.Left = 5
            Margins.Top = 5
            Margins.Right = 5
            Margins.Bottom = 0
            Align = alClient
            BevelEdges = []
            ColumnCollection = <
              item
                SizeStyle = ssAbsolute
                Value = 100.000000000000000000
              end
              item
                Value = 100.000000000000000000
              end>
            ControlCollection = <
              item
                Column = 0
                Control = hm_NIC
                Row = 6
              end
              item
                Column = 1
                Control = ImageEnView1
                Row = 6
              end
              item
                Column = -1
                Row = -1
              end
              item
                Column = 1
                Control = pnLampiran
                Row = 7
              end
              item
                Column = 0
                Control = hmDescript
                Row = 4
              end
              item
                Column = 1
                Control = eAnggotaType
                Row = 4
              end
              item
                Column = 0
                Control = hmTglPermohonan
                Row = 0
              end
              item
                Column = 0
                Control = hmNoPermohonan
                Row = 1
              end
              item
                Column = 0
                Control = hmNoAnggota
                Row = 2
              end
              item
                Column = 0
                Control = hmTglPutusan
                Row = 3
              end
              item
                Column = 0
                Control = hmIdCab
                Row = 5
              end
              item
                Column = 1
                Control = eNoPermohonan
                Row = 1
              end
              item
                Column = 1
                Control = eNoAnggota
                Row = 2
              end
              item
                Column = 1
                Control = eIdCab
                Row = 5
              end
              item
                Column = 1
                Control = eTglPermohonan
                Row = 0
              end
              item
                Column = 1
                Control = eTglPutusan
                Row = 3
              end>
            RowCollection = <
              item
                SizeStyle = ssAbsolute
                Value = 27.000000000000000000
              end
              item
                SizeStyle = ssAbsolute
                Value = 27.000000000000000000
              end
              item
                SizeStyle = ssAbsolute
                Value = 27.000000000000000000
              end
              item
                SizeStyle = ssAbsolute
                Value = 27.000000000000000000
              end
              item
                SizeStyle = ssAbsolute
                Value = 27.000000000000000000
              end
              item
                SizeStyle = ssAbsolute
                Value = 27.000000000000000000
              end
              item
                Value = 100.000000000000000000
              end
              item
                SizeStyle = ssAbsolute
                Value = 30.000000000000000000
              end>
            ShowCaption = False
            TabOrder = 0
            ExplicitTop = 29
            ExplicitHeight = 348
            object hm_NIC: TscLabel
              AlignWithMargins = True
              Left = 4
              Top = 166
              Width = 94
              Height = 154
              Align = alClient
              FluentUIOpaque = False
              TabOrder = 0
              DragForm = False
              DragTopForm = True
              GlowEffect.Enabled = False
              GlowEffect.Color = clBtnShadow
              GlowEffect.AlphaValue = 255
              GlowEffect.GlowSize = 7
              GlowEffect.Offset = 0
              GlowEffect.Intensive = True
              GlowEffect.StyleColors = True
              AutoSize = True
              VertAlignment = scvtaCenter
              UseFontColorToStyleColor = False
              Caption = 'Gambar KTP'
            end
            object ImageEnView1: TImageEnView
              Left = 101
              Top = 163
              Width = 500
              Height = 160
              Background = clGreen
              BackgroundColor2 = clGreen
              MouseWheelParamsAlt.Action = iemwVScroll
              BorderStyle = bsNone
              OnImageChange = ImageEnView1ImageChange
              MouseInteractGeneral = [miSelect]
              SelectionBase = iesbBitmap
              Align = alLeft
              TabOrder = 2
            end
            object pnLampiran: TscGPPanel
              Left = 101
              Top = 323
              Width = 500
              Height = 30
              Margins.Left = 0
              Align = alLeft
              Padding.Bottom = 12
              FluentUIOpaque = False
              TabOrder = 1
              BlurBackground = False
              BlurBackgroundAmount = 5
              BackgroundStyle = gppbsColor
              ContentMarginLeft = 0
              ContentMarginRight = 0
              ContentMarginTop = 0
              ContentMarginBottom = 0
              CustomImageIndex = -1
              DragForm = False
              DragTopForm = True
              DrawTextMode = scdtmGDI
              FrameSides = []
              FillGradientAngle = 90
              FillGradientBeginAlpha = 255
              FillGradientEndAlpha = 255
              FillGradientBeginColorOffset = 25
              FillGradientEndColorOffset = 25
              FrameWidth = 1
              FillColor = clWindow
              FillColorAlpha = 150
              FillColor2 = clWindow
              FrameColor = clBtnShadow
              FrameColorAlpha = 255
              FrameRadius = 0
              ShowCaption = False
              CaptionGlowEffect.Enabled = False
              CaptionGlowEffect.Color = clBtnShadow
              CaptionGlowEffect.AlphaValue = 255
              CaptionGlowEffect.GlowSize = 7
              CaptionGlowEffect.Offset = 0
              CaptionGlowEffect.Intensive = True
              CaptionGlowEffect.StyleColors = True
              Color = clBtnFace
              Caption = 'Data Pemohon'
              TransparentBackground = True
              StorePaintBuffer = True
              Sizeable = False
              WallpaperIndex = -1
              WordWrap = False
              object btFromImageEn: TscGPCharGlyphButton
                AlignWithMargins = True
                Left = 2
                Top = 2
                Width = 80
                Height = 26
                Hint = 'Specify a new size for the image'
                Margins.Left = 2
                Margins.Top = 2
                Margins.Right = 0
                Margins.Bottom = 2
                Align = alLeft
                FluentUIOpaque = False
                TabOrder = 0
                TabStop = True
                OnClick = btFromImageEnClick
                Animation = False
                Badge.Color = clRed
                Badge.ColorAlpha = 255
                Badge.Font.Charset = DEFAULT_CHARSET
                Badge.Font.Color = clWhite
                Badge.Font.Height = -11
                Badge.Font.Name = 'Tahoma'
                Badge.Font.Style = [fsBold]
                Badge.Visible = False
                Caption = 'Edit'
                CaptionCenterAlignment = False
                CanFocused = True
                CustomDropDown = False
                DrawTextMode = scdtmGDI
                FluentLightEffect = False
                Layout = blGlyphLeft
                TransparentBackground = True
                Options.NormalColor = clBtnText
                Options.HotColor = clBtnText
                Options.PressedColor = clBtnText
                Options.FocusedColor = clBtnFace
                Options.DisabledColor = clBtnText
                Options.NormalColor2 = clNone
                Options.HotColor2 = clNone
                Options.PressedColor2 = clNone
                Options.FocusedColor2 = clNone
                Options.DisabledColor2 = clNone
                Options.NormalColorAlpha = 10
                Options.HotColorAlpha = 20
                Options.PressedColorAlpha = 30
                Options.FocusedColorAlpha = 255
                Options.DisabledColorAlpha = 5
                Options.NormalColor2Alpha = 255
                Options.HotColor2Alpha = 255
                Options.PressedColor2Alpha = 255
                Options.FocusedColor2Alpha = 255
                Options.DisabledColor2Alpha = 255
                Options.FrameNormalColor = clBtnText
                Options.FrameHotColor = clBtnText
                Options.FramePressedColor = clBtnText
                Options.FrameFocusedColor = clHighlight
                Options.FrameDisabledColor = clBtnText
                Options.FrameWidth = 1
                Options.FrameNormalColorAlpha = 70
                Options.FrameHotColorAlpha = 100
                Options.FramePressedColorAlpha = 150
                Options.FrameFocusedColorAlpha = 255
                Options.FrameDisabledColorAlpha = 30
                Options.FontNormalColor = clBtnText
                Options.FontHotColor = clBtnText
                Options.FontPressedColor = clBtnText
                Options.FontFocusedColor = clBtnText
                Options.FontDisabledColor = clBtnShadow
                Options.ShapeFillGradientAngle = 90
                Options.ShapeFillGradientPressedAngle = -90
                Options.ShapeFillGradientColorOffset = 25
                Options.ShapeCornerRadius = 18
                Options.ShapeStyle = scgpLeftLine
                Options.ShapeStyleLineSize = 0
                Options.ArrowSize = 9
                Options.ArrowAreaSize = 0
                Options.ArrowType = scgpatDefault
                Options.ArrowThickness = 2
                Options.ArrowThicknessScaled = False
                Options.ArrowNormalColor = clBtnText
                Options.ArrowHotColor = clBtnText
                Options.ArrowPressedColor = clBtnText
                Options.ArrowFocusedColor = clBtnText
                Options.ArrowDisabledColor = clBtnText
                Options.ArrowNormalColorAlpha = 200
                Options.ArrowHotColorAlpha = 255
                Options.ArrowPressedColorAlpha = 255
                Options.ArrowFocusedColorAlpha = 200
                Options.ArrowDisabledColorAlpha = 125
                Options.StyleColors = True
                Options.PressedHotColors = False
                GlyphOptions.NormalColor = clBtnText
                GlyphOptions.HotColor = clBtnText
                GlyphOptions.PressedColor = clBtnText
                GlyphOptions.FocusedColor = clBtnText
                GlyphOptions.DisabledColor = clBtnText
                GlyphOptions.NormalColorAlpha = 200
                GlyphOptions.HotColorAlpha = 255
                GlyphOptions.PressedColorAlpha = 255
                GlyphOptions.FocusedColorAlpha = 255
                GlyphOptions.DisabledColorAlpha = 100
                GlyphOptions.Index = 68
                GlyphOptions.Margin = 0
                GlyphOptions.Size = 20
                GlyphOptions.StyleColors = True
                TextMargin = 0
                WidthWithCaption = 0
                WidthWithoutCaption = 0
                ShowCaption = True
                SplitButton = False
                RepeatClick = False
                RepeatClickInterval = 100
                ShowGalleryMenuFromTop = False
                ShowGalleryMenuFromRight = False
                ShowMenuArrow = True
                ShowFocusRect = True
                Down = False
                GroupIndex = 0
                AllowAllUp = False
                ToggleMode = False
                ExplicitLeft = 248
              end
            end
            object hmDescript: TscLabel
              AlignWithMargins = True
              Left = 4
              Top = 112
              Width = 94
              Height = 21
              Align = alClient
              FluentUIOpaque = False
              TabOrder = 3
              DragForm = False
              DragTopForm = True
              GlowEffect.Enabled = False
              GlowEffect.Color = clBtnShadow
              GlowEffect.AlphaValue = 255
              GlowEffect.GlowSize = 7
              GlowEffect.Offset = 0
              GlowEffect.Intensive = True
              GlowEffect.StyleColors = True
              AutoSize = True
              VertAlignment = scvtaCenter
              UseFontColorToStyleColor = False
              Caption = 'Kategori Anggota'
            end
            object eAnggotaType: TcxLookupComboBox
              Left = 101
              Top = 109
              Align = alLeft
              Properties.KeyFieldNames = 'type_anggota'
              Properties.ListColumns = <
                item
                  FieldName = 'descript'
                end>
              Properties.ListOptions.ShowHeader = False
              Properties.ListSource = dsAngCom
              TabOrder = 4
              ExplicitHeight = 21
              Width = 300
            end
            object hmTglPermohonan: TscLabel
              AlignWithMargins = True
              Left = 4
              Top = 4
              Width = 94
              Height = 21
              Align = alClient
              FluentUIOpaque = False
              TabOrder = 5
              DragForm = False
              DragTopForm = True
              GlowEffect.Enabled = False
              GlowEffect.Color = clBtnShadow
              GlowEffect.AlphaValue = 255
              GlowEffect.GlowSize = 7
              GlowEffect.Offset = 0
              GlowEffect.Intensive = True
              GlowEffect.StyleColors = True
              AutoSize = True
              VertAlignment = scvtaCenter
              UseFontColorToStyleColor = False
              Caption = 'Tgl. Permohonan'
            end
            object hmNoPermohonan: TscLabel
              AlignWithMargins = True
              Left = 4
              Top = 31
              Width = 94
              Height = 21
              Align = alClient
              FluentUIOpaque = False
              TabOrder = 6
              DragForm = False
              DragTopForm = True
              GlowEffect.Enabled = False
              GlowEffect.Color = clBtnShadow
              GlowEffect.AlphaValue = 255
              GlowEffect.GlowSize = 7
              GlowEffect.Offset = 0
              GlowEffect.Intensive = True
              GlowEffect.StyleColors = True
              AutoSize = True
              VertAlignment = scvtaCenter
              UseFontColorToStyleColor = False
              Caption = 'No. Permohonan'
            end
            object hmNoAnggota: TscLabel
              AlignWithMargins = True
              Left = 4
              Top = 58
              Width = 94
              Height = 21
              Align = alClient
              FluentUIOpaque = False
              TabOrder = 7
              DragForm = False
              DragTopForm = True
              GlowEffect.Enabled = False
              GlowEffect.Color = clBtnShadow
              GlowEffect.AlphaValue = 255
              GlowEffect.GlowSize = 7
              GlowEffect.Offset = 0
              GlowEffect.Intensive = True
              GlowEffect.StyleColors = True
              AutoSize = True
              VertAlignment = scvtaCenter
              UseFontColorToStyleColor = False
              Caption = 'No. Anggota'
            end
            object hmTglPutusan: TscLabel
              AlignWithMargins = True
              Left = 4
              Top = 85
              Width = 94
              Height = 21
              Align = alClient
              FluentUIOpaque = False
              TabOrder = 8
              DragForm = False
              DragTopForm = True
              GlowEffect.Enabled = False
              GlowEffect.Color = clBtnShadow
              GlowEffect.AlphaValue = 255
              GlowEffect.GlowSize = 7
              GlowEffect.Offset = 0
              GlowEffect.Intensive = True
              GlowEffect.StyleColors = True
              AutoSize = True
              VertAlignment = scvtaCenter
              UseFontColorToStyleColor = False
              Caption = 'Tgl. Keputusan'
            end
            object hmIdCab: TscLabel
              AlignWithMargins = True
              Left = 4
              Top = 139
              Width = 94
              Height = 21
              Align = alClient
              FluentUIOpaque = False
              TabOrder = 9
              DragForm = False
              DragTopForm = True
              GlowEffect.Enabled = False
              GlowEffect.Color = clBtnShadow
              GlowEffect.AlphaValue = 255
              GlowEffect.GlowSize = 7
              GlowEffect.Offset = 0
              GlowEffect.Intensive = True
              GlowEffect.StyleColors = True
              AutoSize = True
              VertAlignment = scvtaCenter
              UseFontColorToStyleColor = False
              Caption = 'Kode Cabang'
            end
            object eNoPermohonan: TscLabel
              Left = 101
              Top = 28
              Width = 300
              Height = 27
              Align = alLeft
              FluentUIOpaque = False
              TabOrder = 10
              DragForm = False
              DragTopForm = True
              GlowEffect.Enabled = False
              GlowEffect.Color = clBtnShadow
              GlowEffect.AlphaValue = 255
              GlowEffect.GlowSize = 7
              GlowEffect.Offset = 0
              GlowEffect.Intensive = True
              GlowEffect.StyleColors = True
              AutoSize = False
              Layout = tlCenter
              VertAlignment = scvtaCenter
              UseFontColorToStyleColor = False
            end
            object eNoAnggota: TscLabel
              Left = 101
              Top = 55
              Width = 300
              Height = 27
              Align = alLeft
              FluentUIOpaque = False
              TabOrder = 11
              DragForm = False
              DragTopForm = True
              GlowEffect.Enabled = False
              GlowEffect.Color = clBtnShadow
              GlowEffect.AlphaValue = 255
              GlowEffect.GlowSize = 7
              GlowEffect.Offset = 0
              GlowEffect.Intensive = True
              GlowEffect.StyleColors = True
              AutoSize = False
              VertAlignment = scvtaCenter
              UseFontColorToStyleColor = False
            end
            object eIdCab: TscLabel
              Left = 101
              Top = 136
              Width = 300
              Height = 27
              Align = alLeft
              FluentUIOpaque = False
              TabOrder = 12
              DragForm = False
              DragTopForm = True
              GlowEffect.Enabled = False
              GlowEffect.Color = clBtnShadow
              GlowEffect.AlphaValue = 255
              GlowEffect.GlowSize = 7
              GlowEffect.Offset = 0
              GlowEffect.Intensive = True
              GlowEffect.StyleColors = True
              AutoSize = False
              VertAlignment = scvtaCenter
              UseFontColorToStyleColor = False
            end
            object eTglPermohonan: TdxDateTimeWheelPicker
              Left = 101
              Top = 1
              Align = alLeft
              Properties.Wheels = [pwYear, pwMonth, pwDay, pwHour, pwMinute, pwSecond]
              StyleDisabled.BorderColor = clWindowFrame
              StyleDisabled.BorderStyle = ebs3D
              StyleDisabled.Color = clWindow
              StyleDisabled.TextColor = clWindowText
              TabOrder = 13
              Height = 27
              Width = 300
            end
            object eTglPutusan: TcxDateEdit
              Left = 101
              Top = 82
              Align = alLeft
              TabOrder = 14
              ExplicitHeight = 21
              Width = 300
            end
          end
          object cxLabel1: TcxLabel
            AlignWithMargins = True
            Left = 5
            Top = 449
            Margins.Left = 5
            Margins.Top = 1
            Margins.Right = 5
            Margins.Bottom = 1
            Align = alBottom
            Caption = 'Respone Message'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
            ExplicitTop = 446
          end
          object cxLabel6: TcxLabel
            AlignWithMargins = True
            Left = 5
            Top = 2
            Margins.Left = 5
            Margins.Top = 1
            Margins.Right = 5
            Margins.Bottom = 1
            Align = alTop
            Caption = 'Lampiran'
            ParentFont = False
            Style.Font.Charset = DEFAULT_CHARSET
            Style.Font.Color = clWindowText
            Style.Font.Height = -12
            Style.Font.Name = 'Tahoma'
            Style.Font.Style = [fsBold]
            Style.IsFontAssigned = True
          end
          object pnSendPost: TscGPPanel
            AlignWithMargins = True
            Left = 0
            Top = 392
            Width = 621
            Height = 44
            Margins.Left = 0
            Margins.Top = 12
            Margins.Right = 0
            Margins.Bottom = 12
            Align = alBottom
            Padding.Bottom = 12
            FluentUIOpaque = False
            TabOrder = 3
            BlurBackground = False
            BlurBackgroundAmount = 5
            BackgroundStyle = gppbsColor
            ContentMarginLeft = 0
            ContentMarginRight = 0
            ContentMarginTop = 0
            ContentMarginBottom = 0
            CustomImageIndex = -1
            DragForm = False
            DragTopForm = True
            DrawTextMode = scdtmGDI
            FrameSides = [gppfsBottom]
            FillGradientAngle = 90
            FillGradientBeginAlpha = 255
            FillGradientEndAlpha = 255
            FillGradientBeginColorOffset = 25
            FillGradientEndColorOffset = 25
            FrameWidth = 1
            FillColor = clWindow
            FillColorAlpha = 150
            FillColor2 = clWindow
            FrameColor = clBtnShadow
            FrameColorAlpha = 255
            FrameRadius = 0
            ShowCaption = False
            CaptionGlowEffect.Enabled = False
            CaptionGlowEffect.Color = clBtnShadow
            CaptionGlowEffect.AlphaValue = 255
            CaptionGlowEffect.GlowSize = 7
            CaptionGlowEffect.Offset = 0
            CaptionGlowEffect.Intensive = True
            CaptionGlowEffect.StyleColors = True
            Color = clBtnFace
            Caption = 'Data Pemohon'
            TransparentBackground = True
            StorePaintBuffer = True
            Sizeable = False
            WallpaperIndex = -1
            WordWrap = False
            ExplicitTop = 389
            object btAppCreate: TscGPCharGlyphButton
              AlignWithMargins = True
              Left = 150
              Top = 0
              Width = 134
              Height = 31
              Margins.Left = 8
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alLeft
              FluentUIOpaque = False
              TabOrder = 0
              TabStop = True
              OnClick = btAppCreateClick
              Animation = False
              Badge.Color = clRed
              Badge.ColorAlpha = 255
              Badge.Font.Charset = DEFAULT_CHARSET
              Badge.Font.Color = clWhite
              Badge.Font.Height = -11
              Badge.Font.Name = 'Tahoma'
              Badge.Font.Style = [fsBold]
              Badge.Visible = False
              Caption = 'Proses'
              CaptionCenterAlignment = False
              CanFocused = True
              CustomDropDown = False
              DrawTextMode = scdtmGDI
              FluentLightEffect = False
              Layout = blGlyphLeft
              TransparentBackground = True
              Options.NormalColor = clBtnText
              Options.HotColor = clBtnText
              Options.PressedColor = clBtnText
              Options.FocusedColor = clBtnFace
              Options.DisabledColor = clBtnText
              Options.NormalColor2 = clNone
              Options.HotColor2 = clNone
              Options.PressedColor2 = clNone
              Options.FocusedColor2 = clNone
              Options.DisabledColor2 = clNone
              Options.NormalColorAlpha = 10
              Options.HotColorAlpha = 20
              Options.PressedColorAlpha = 30
              Options.FocusedColorAlpha = 255
              Options.DisabledColorAlpha = 5
              Options.NormalColor2Alpha = 255
              Options.HotColor2Alpha = 255
              Options.PressedColor2Alpha = 255
              Options.FocusedColor2Alpha = 255
              Options.DisabledColor2Alpha = 255
              Options.FrameNormalColor = clBtnText
              Options.FrameHotColor = clBtnText
              Options.FramePressedColor = clBtnText
              Options.FrameFocusedColor = clHighlight
              Options.FrameDisabledColor = clBtnText
              Options.FrameWidth = 1
              Options.FrameNormalColorAlpha = 70
              Options.FrameHotColorAlpha = 100
              Options.FramePressedColorAlpha = 150
              Options.FrameFocusedColorAlpha = 255
              Options.FrameDisabledColorAlpha = 30
              Options.FontNormalColor = clBtnText
              Options.FontHotColor = clBtnText
              Options.FontPressedColor = clBtnText
              Options.FontFocusedColor = clBtnText
              Options.FontDisabledColor = clBtnShadow
              Options.ShapeFillGradientAngle = 90
              Options.ShapeFillGradientPressedAngle = -90
              Options.ShapeFillGradientColorOffset = 25
              Options.ShapeCornerRadius = 21
              Options.ShapeStyle = scgpRoundedRect
              Options.ShapeStyleLineSize = 0
              Options.ArrowSize = 9
              Options.ArrowAreaSize = 0
              Options.ArrowType = scgpatDefault
              Options.ArrowThickness = 2
              Options.ArrowThicknessScaled = False
              Options.ArrowNormalColor = clBtnText
              Options.ArrowHotColor = clBtnText
              Options.ArrowPressedColor = clBtnText
              Options.ArrowFocusedColor = clBtnText
              Options.ArrowDisabledColor = clBtnText
              Options.ArrowNormalColorAlpha = 200
              Options.ArrowHotColorAlpha = 255
              Options.ArrowPressedColorAlpha = 255
              Options.ArrowFocusedColorAlpha = 200
              Options.ArrowDisabledColorAlpha = 125
              Options.StyleColors = True
              Options.PressedHotColors = False
              GlyphOptions.NormalColor = clBtnText
              GlyphOptions.HotColor = clBtnText
              GlyphOptions.PressedColor = clBtnText
              GlyphOptions.FocusedColor = clBtnText
              GlyphOptions.DisabledColor = clBtnText
              GlyphOptions.NormalColorAlpha = 200
              GlyphOptions.HotColorAlpha = 255
              GlyphOptions.PressedColorAlpha = 255
              GlyphOptions.FocusedColorAlpha = 255
              GlyphOptions.DisabledColorAlpha = 100
              GlyphOptions.Index = 472
              GlyphOptions.Margin = 0
              GlyphOptions.Size = 20
              GlyphOptions.StyleColors = True
              TextMargin = 0
              WidthWithCaption = 0
              WidthWithoutCaption = 0
              ShowCaption = True
              SplitButton = False
              RepeatClick = False
              RepeatClickInterval = 100
              ShowGalleryMenuFromTop = False
              ShowGalleryMenuFromRight = False
              ShowMenuArrow = True
              ShowFocusRect = True
              Down = False
              GroupIndex = 0
              AllowAllUp = False
              ToggleMode = False
            end
            object btBillDel: TscGPCharGlyphButton
              AlignWithMargins = True
              Left = 8
              Top = 0
              Width = 134
              Height = 31
              Hint = 'Clear the window'
              Margins.Left = 8
              Margins.Top = 0
              Margins.Right = 0
              Margins.Bottom = 0
              Align = alLeft
              Enabled = False
              FluentUIOpaque = False
              TabOrder = 1
              TabStop = True
              Animation = False
              Badge.Color = clRed
              Badge.ColorAlpha = 255
              Badge.Font.Charset = DEFAULT_CHARSET
              Badge.Font.Color = clWhite
              Badge.Font.Height = -11
              Badge.Font.Name = 'Tahoma'
              Badge.Font.Style = [fsBold]
              Badge.Visible = False
              Caption = 'Clear'
              CaptionCenterAlignment = False
              CanFocused = True
              CustomDropDown = False
              DrawTextMode = scdtmGDI
              FluentLightEffect = False
              Layout = blGlyphLeft
              TransparentBackground = True
              Options.NormalColor = clBtnText
              Options.HotColor = clBtnText
              Options.PressedColor = clBtnText
              Options.FocusedColor = clBtnFace
              Options.DisabledColor = clBtnText
              Options.NormalColor2 = clNone
              Options.HotColor2 = clNone
              Options.PressedColor2 = clNone
              Options.FocusedColor2 = clNone
              Options.DisabledColor2 = clNone
              Options.NormalColorAlpha = 10
              Options.HotColorAlpha = 20
              Options.PressedColorAlpha = 30
              Options.FocusedColorAlpha = 255
              Options.DisabledColorAlpha = 5
              Options.NormalColor2Alpha = 255
              Options.HotColor2Alpha = 255
              Options.PressedColor2Alpha = 255
              Options.FocusedColor2Alpha = 255
              Options.DisabledColor2Alpha = 255
              Options.FrameNormalColor = clBtnText
              Options.FrameHotColor = clBtnText
              Options.FramePressedColor = clBtnText
              Options.FrameFocusedColor = clHighlight
              Options.FrameDisabledColor = clBtnText
              Options.FrameWidth = 1
              Options.FrameNormalColorAlpha = 70
              Options.FrameHotColorAlpha = 100
              Options.FramePressedColorAlpha = 150
              Options.FrameFocusedColorAlpha = 255
              Options.FrameDisabledColorAlpha = 30
              Options.FontNormalColor = clBtnText
              Options.FontHotColor = clBtnText
              Options.FontPressedColor = clBtnText
              Options.FontFocusedColor = clBtnText
              Options.FontDisabledColor = clBtnShadow
              Options.ShapeFillGradientAngle = 90
              Options.ShapeFillGradientPressedAngle = -90
              Options.ShapeFillGradientColorOffset = 25
              Options.ShapeCornerRadius = 21
              Options.ShapeStyle = scgpRoundedRect
              Options.ShapeStyleLineSize = 0
              Options.ArrowSize = 9
              Options.ArrowAreaSize = 0
              Options.ArrowType = scgpatDefault
              Options.ArrowThickness = 2
              Options.ArrowThicknessScaled = False
              Options.ArrowNormalColor = clBtnText
              Options.ArrowHotColor = clBtnText
              Options.ArrowPressedColor = clBtnText
              Options.ArrowFocusedColor = clBtnText
              Options.ArrowDisabledColor = clBtnText
              Options.ArrowNormalColorAlpha = 200
              Options.ArrowHotColorAlpha = 255
              Options.ArrowPressedColorAlpha = 255
              Options.ArrowFocusedColorAlpha = 200
              Options.ArrowDisabledColorAlpha = 125
              Options.StyleColors = True
              Options.PressedHotColors = False
              GlyphOptions.NormalColor = clBtnText
              GlyphOptions.HotColor = clBtnText
              GlyphOptions.PressedColor = clBtnText
              GlyphOptions.FocusedColor = clBtnText
              GlyphOptions.DisabledColor = clBtnText
              GlyphOptions.NormalColorAlpha = 200
              GlyphOptions.HotColorAlpha = 255
              GlyphOptions.PressedColorAlpha = 255
              GlyphOptions.FocusedColorAlpha = 255
              GlyphOptions.DisabledColorAlpha = 100
              GlyphOptions.Index = 20
              GlyphOptions.Margin = 0
              GlyphOptions.Size = 20
              GlyphOptions.StyleColors = True
              TextMargin = 0
              WidthWithCaption = 0
              WidthWithoutCaption = 0
              ShowCaption = True
              SplitButton = False
              RepeatClick = False
              RepeatClickInterval = 100
              ShowGalleryMenuFromTop = False
              ShowGalleryMenuFromRight = False
              ShowMenuArrow = True
              ShowFocusRect = True
              Down = False
              GroupIndex = 0
              AllowAllUp = False
              ToggleMode = False
            end
          end
          object scGPPanel2: TscGPPanel
            AlignWithMargins = True
            Left = 0
            Top = 480
            Width = 621
            Height = 124
            HelpType = htKeyword
            Margins.Left = 0
            Margins.Top = 12
            Margins.Right = 0
            Margins.Bottom = 12
            Align = alBottom
            Padding.Bottom = 12
            FluentUIOpaque = False
            TabOrder = 4
            BlurBackground = False
            BlurBackgroundAmount = 5
            BackgroundStyle = gppbsColor
            ContentMarginLeft = 0
            ContentMarginRight = 0
            ContentMarginTop = 0
            ContentMarginBottom = 0
            CustomImageIndex = -1
            DragForm = False
            DragTopForm = True
            DrawTextMode = scdtmGDI
            FrameSides = [gppfsBottom]
            FillGradientAngle = 90
            FillGradientBeginAlpha = 255
            FillGradientEndAlpha = 255
            FillGradientBeginColorOffset = 25
            FillGradientEndColorOffset = 25
            FrameWidth = 1
            FillColor = clWindow
            FillColorAlpha = 150
            FillColor2 = clWindow
            FrameColor = clBtnShadow
            FrameColorAlpha = 255
            FrameRadius = 0
            ShowCaption = False
            CaptionGlowEffect.Enabled = False
            CaptionGlowEffect.Color = clBtnShadow
            CaptionGlowEffect.AlphaValue = 255
            CaptionGlowEffect.GlowSize = 7
            CaptionGlowEffect.Offset = 0
            CaptionGlowEffect.Intensive = True
            CaptionGlowEffect.StyleColors = True
            Color = clBtnFace
            Caption = 'Data Pemohon'
            TransparentBackground = True
            StorePaintBuffer = True
            Sizeable = False
            WallpaperIndex = -1
            WordWrap = False
            object grSimpanan: TcxGrid
              Left = 305
              Top = 0
              Width = 289
              Height = 111
              Align = alLeft
              TabOrder = 0
              object cxGridDBTableView1: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = InfoPinjaman
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsView.GroupByBox = False
              end
              object cxGridLevel1: TcxGridLevel
                GridView = cxGridDBTableView1
              end
            end
            object grPinjaman: TcxGrid
              Left = 0
              Top = 0
              Width = 305
              Height = 111
              Align = alLeft
              TabOrder = 1
              object gPinjaman: TcxGridDBTableView
                Navigator.Buttons.CustomButtons = <>
                DataController.DataSource = dsInfoPinjaman
                DataController.Summary.DefaultGroupSummaryItems = <>
                DataController.Summary.FooterSummaryItems = <>
                DataController.Summary.SummaryGroups = <>
                OptionsView.GroupByBox = False
                object gPinjamanNo: TcxGridDBColumn
                  Caption = 'No'
                  Options.Editing = False
                  Options.Filtering = False
                  Options.FilteringAddValueItems = False
                  Width = 43
                end
                object gPinjamanno_rek: TcxGridDBColumn
                  Caption = 'Nomor Pinjaman'
                  DataBinding.FieldName = 'no_rek'
                  Options.Editing = False
                  Options.Filtering = False
                  Options.FilteringAddValueItems = False
                end
                object gPinjamaninfosaldo: TcxGridDBColumn
                  Caption = 'Saldo'
                  DataBinding.FieldName = 'infosaldo'
                  PropertiesClassName = 'TcxCurrencyEditProperties'
                  Properties.DisplayFormat = ',0'
                  Options.Editing = False
                  Options.Filtering = False
                  Options.FilteringAddValueItems = False
                end
              end
              object cxGridLevel2: TcxGridLevel
                GridView = gPinjaman
              end
            end
          end
        end
        object cxSplitter1: TcxSplitter
          Left = 0
          Top = 51
          Width = 12
          Height = 629
        end
      end
    end
    object scPanel23: TscPanel
      AlignWithMargins = True
      Left = 12
      Top = 5
      Width = 991
      Height = 40
      Margins.Left = 12
      Margins.Top = 5
      Align = alTop
      FluentUIOpaque = False
      TabOrder = 1
      CustomImageIndex = -1
      DragForm = False
      DragTopForm = True
      StyleKind = scpsPanel
      ShowCaption = False
      BorderStyle = scpbsNone
      WallpaperIndex = -1
      LightBorderColor = clBtnHighlight
      ShadowBorderColor = clBtnShadow
      CaptionGlowEffect.Enabled = False
      CaptionGlowEffect.Color = clBtnShadow
      CaptionGlowEffect.AlphaValue = 255
      CaptionGlowEffect.GlowSize = 7
      CaptionGlowEffect.Offset = 0
      CaptionGlowEffect.Intensive = True
      CaptionGlowEffect.StyleColors = True
      Color = 15707240
      StorePaintBuffer = False
      WordWrap = False
      object scLabelCharImage: TscGPCharImage
        Left = 0
        Top = 0
        Width = 34
        Height = 40
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        FluentUIOpaque = False
        TabOrder = 0
        CustomImageIndex = -1
        DragForm = False
        DragTopForm = True
        StyleKind = scpsTransparent
        ShowCaption = False
        BorderStyle = scpbsNone
        WallpaperIndex = -1
        LightBorderColor = clBtnHighlight
        ShadowBorderColor = clBtnShadow
        CaptionGlowEffect.Enabled = False
        CaptionGlowEffect.Color = clBtnShadow
        CaptionGlowEffect.AlphaValue = 255
        CaptionGlowEffect.GlowSize = 7
        CaptionGlowEffect.Offset = 0
        CaptionGlowEffect.Intensive = True
        CaptionGlowEffect.StyleColors = True
        Color = 6333684
        Caption = 'scGPCharImage1'
        StorePaintBuffer = False
        WordWrap = False
        DrawTextMode = scdtmGDI
        ImageColor = clWhite
        ImageColorAlpha = 255
        ImageSize = 15
        ImageIndex = 192
        Frame = scgpcfNone
        FrameRadius = 10
        FrameFillColor = clWindow
        FrameFillColorAlpha = 255
        FrameColor = clBtnFace
        FrameWidth = 2
        RotationAngle = 0
        AnimationAcceleration = False
        RotateAnimation = False
      end
      object CaptionLabel: TscLabel
        Left = 34
        Top = 0
        Width = 181
        Height = 40
        Align = alLeft
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        FluentUIOpaque = False
        TabOrder = 1
        DragForm = False
        DragTopForm = True
        GlowEffect.Enabled = False
        GlowEffect.Color = clBtnShadow
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        AutoSize = True
        VertAlignment = scvtaCenter
        UseFontColorToStyleColor = False
        Caption = 'Form 1 - Identifikasi Data'
        ExplicitHeight = 19
      end
      object scCabangLook: TscDBLookupComboBox
        AlignWithMargins = True
        Left = 739
        Top = 3
        Width = 249
        Height = 27
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        KeyField = 'IDO'
        ListField = 'DESCRIPTION'
        ParentFont = False
        TabOrder = 2
        SelectionStyle = scstStyled
      end
      object scLabel25: TscLabel
        AlignWithMargins = True
        Left = 603
        Top = 7
        Width = 130
        Height = 30
        Margins.Top = 7
        Align = alRight
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
        FluentUIOpaque = False
        TabOrder = 3
        DragForm = False
        DragTopForm = True
        GlowEffect.Enabled = False
        GlowEffect.Color = clBtnShadow
        GlowEffect.AlphaValue = 255
        GlowEffect.GlowSize = 7
        GlowEffect.Offset = 0
        GlowEffect.Intensive = True
        GlowEffect.StyleColors = True
        AutoSize = False
        Layout = tlCenter
        Alignment = taRightJustify
        UseFontColorToStyleColor = False
        Caption = 'Kantor Cabang'
      end
    end
  end
  object scSplitView1: TscSplitView
    Left = 0
    Top = 0
    Width = 40
    Height = 0
    Anchors = [akLeft, akTop, akBottom]
    FluentUIOpaque = False
    TabOrder = 1
    CustomImageIndex = -1
    DragForm = False
    DragTopForm = True
    StyleKind = scpsPanel
    ShowCaption = False
    BorderStyle = scpbsNone
    WallpaperIndex = -1
    LightBorderColor = clBtnHighlight
    ShadowBorderColor = clBtnShadow
    CaptionGlowEffect.Enabled = False
    CaptionGlowEffect.Color = clBtnShadow
    CaptionGlowEffect.AlphaValue = 255
    CaptionGlowEffect.GlowSize = 7
    CaptionGlowEffect.Offset = 0
    CaptionGlowEffect.Intensive = True
    CaptionGlowEffect.StyleColors = True
    Color = clWindowFrame
    StorePaintBuffer = False
    WordWrap = False
    AnimationStep = 25
    AnimationType = scsvaInertial
    CompactWidth = 40
    CompactHeight = 20
    GripSize = 0
    Opened = False
    OpenedWidth = 250
    OpenedHeight = 0
    OpenedMinWidth = 0
    OpenedMaxWidth = 0
    OpenedMinHeight = 0
    OpenedMaxHeight = 0
    ParentBackground = False
    ParentColor = False
    Placement = scsvpLeft
    HideControls = False
    Animation = False
    DisplayMode = scsvmOverlay
    object btCreateBilling: TscGPCharGlyphButton
      Tag = 3
      Left = 0
      Top = 160
      Width = 40
      Height = 40
      Align = alTop
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      FluentUIOpaque = False
      TabOrder = 0
      TabStop = True
      OnClick = ButtonSplitClik
      Animation = False
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      Caption = 'Daftar Penolakan'
      CaptionCenterAlignment = False
      CanFocused = True
      CustomDropDown = False
      DrawTextMode = scdtmGDI
      FluentLightEffect = False
      Layout = blGlyphLeft
      TransparentBackground = True
      Options.NormalColor = clWhite
      Options.HotColor = clHighlightText
      Options.PressedColor = clBlack
      Options.FocusedColor = clHighlightText
      Options.DisabledColor = clHighlightText
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 25
      Options.PressedColorAlpha = 70
      Options.FocusedColorAlpha = 0
      Options.DisabledColorAlpha = 255
      Options.NormalColor2Alpha = 255
      Options.HotColor2Alpha = 255
      Options.PressedColor2Alpha = 255
      Options.FocusedColor2Alpha = 255
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clNone
      Options.FrameHotColor = clNone
      Options.FramePressedColor = clHighlightText
      Options.FrameFocusedColor = clNone
      Options.FrameDisabledColor = clHighlightText
      Options.FrameWidth = 1
      Options.FrameNormalColorAlpha = 0
      Options.FrameHotColorAlpha = 0
      Options.FramePressedColorAlpha = 255
      Options.FrameFocusedColorAlpha = 0
      Options.FrameDisabledColorAlpha = 0
      Options.FontNormalColor = clHighlightText
      Options.FontHotColor = clHighlightText
      Options.FontPressedColor = clHighlightText
      Options.FontFocusedColor = clHighlightText
      Options.FontDisabledColor = clHighlightText
      Options.ShapeFillGradientAngle = 0
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 10
      Options.ShapeStyle = scgpRightLine
      Options.ShapeStyleLineSize = 0
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 1
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      Options.PressedHotColors = False
      GlyphOptions.NormalColor = clWhite
      GlyphOptions.HotColor = clBtnText
      GlyphOptions.PressedColor = clBtnText
      GlyphOptions.FocusedColor = clBtnText
      GlyphOptions.DisabledColor = clBtnText
      GlyphOptions.NormalColorAlpha = 200
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 255
      GlyphOptions.DisabledColorAlpha = 100
      GlyphOptions.Index = 31
      GlyphOptions.Margin = 0
      GlyphOptions.Size = 20
      GlyphOptions.StyleColors = True
      TextMargin = 10
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ShowCaption = True
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 1
      AllowAllUp = False
      WordWrap = False
      ToggleMode = False
    end
    object scButtonGroup: TscGPCharGlyphButton
      Tag = 1
      Left = 0
      Top = 0
      Width = 40
      Height = 40
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
      FluentUIOpaque = False
      TabOrder = 1
      TabStop = True
      OnClick = scButtonGroupClick
      Animation = False
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      CaptionCenterAlignment = False
      CanFocused = True
      CustomDropDown = False
      DrawTextMode = scdtmGDI
      FluentLightEffect = False
      Layout = blGlyphLeft
      TransparentBackground = True
      Options.NormalColor = clWhite
      Options.HotColor = clHighlightText
      Options.PressedColor = clBlack
      Options.FocusedColor = clHighlightText
      Options.DisabledColor = clHighlightText
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 25
      Options.PressedColorAlpha = 70
      Options.FocusedColorAlpha = 0
      Options.DisabledColorAlpha = 255
      Options.NormalColor2Alpha = 255
      Options.HotColor2Alpha = 255
      Options.PressedColor2Alpha = 255
      Options.FocusedColor2Alpha = 255
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clNone
      Options.FrameHotColor = clNone
      Options.FramePressedColor = clNone
      Options.FrameFocusedColor = clNone
      Options.FrameDisabledColor = clHighlightText
      Options.FrameWidth = 1
      Options.FrameNormalColorAlpha = 0
      Options.FrameHotColorAlpha = 0
      Options.FramePressedColorAlpha = 0
      Options.FrameFocusedColorAlpha = 0
      Options.FrameDisabledColorAlpha = 0
      Options.FontNormalColor = clHighlightText
      Options.FontHotColor = clHighlightText
      Options.FontPressedColor = clHighlightText
      Options.FontFocusedColor = clHighlightText
      Options.FontDisabledColor = clHighlightText
      Options.ShapeFillGradientAngle = 0
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 10
      Options.ShapeStyle = scgpRect
      Options.ShapeStyleLineSize = 0
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 2
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      Options.PressedHotColors = False
      GlyphOptions.NormalColor = clBtnFace
      GlyphOptions.HotColor = clBtnText
      GlyphOptions.PressedColor = clBtnText
      GlyphOptions.FocusedColor = clBtnText
      GlyphOptions.DisabledColor = clBtnText
      GlyphOptions.NormalColorAlpha = 255
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 255
      GlyphOptions.DisabledColorAlpha = 100
      GlyphOptions.Index = 84
      GlyphOptions.Margin = 0
      GlyphOptions.Size = 20
      GlyphOptions.StyleColors = True
      TextMargin = 10
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ShowCaption = True
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 0
      AllowAllUp = False
      ToggleMode = False
    end
    object scCetakMtList: TscGPCharGlyphButton
      Tag = 2
      Left = 0
      Top = 120
      Width = 40
      Height = 40
      Hint = 'PAYMENT_HISTDATE'
      Align = alTop
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      FluentUIOpaque = False
      TabOrder = 2
      TabStop = True
      OnClick = ButtonSplitClik
      Animation = False
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      Caption = 'Daftar Pembayaran'
      CaptionCenterAlignment = False
      CanFocused = True
      CustomDropDown = False
      DrawTextMode = scdtmGDI
      FluentLightEffect = False
      Layout = blGlyphLeft
      TransparentBackground = True
      Options.NormalColor = clWhite
      Options.HotColor = clHighlightText
      Options.PressedColor = clBlack
      Options.FocusedColor = clHighlightText
      Options.DisabledColor = clHighlightText
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 25
      Options.PressedColorAlpha = 70
      Options.FocusedColorAlpha = 0
      Options.DisabledColorAlpha = 255
      Options.NormalColor2Alpha = 255
      Options.HotColor2Alpha = 255
      Options.PressedColor2Alpha = 255
      Options.FocusedColor2Alpha = 255
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clNone
      Options.FrameHotColor = clNone
      Options.FramePressedColor = clHighlightText
      Options.FrameFocusedColor = clNone
      Options.FrameDisabledColor = clHighlightText
      Options.FrameWidth = 1
      Options.FrameNormalColorAlpha = 0
      Options.FrameHotColorAlpha = 0
      Options.FramePressedColorAlpha = 255
      Options.FrameFocusedColorAlpha = 0
      Options.FrameDisabledColorAlpha = 0
      Options.FontNormalColor = clHighlightText
      Options.FontHotColor = clHighlightText
      Options.FontPressedColor = clHighlightText
      Options.FontFocusedColor = clHighlightText
      Options.FontDisabledColor = clHighlightText
      Options.ShapeFillGradientAngle = 0
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 10
      Options.ShapeStyle = scgpRightLine
      Options.ShapeStyleLineSize = 0
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 1
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      Options.PressedHotColors = False
      GlyphOptions.NormalColor = clWhite
      GlyphOptions.HotColor = clBtnText
      GlyphOptions.PressedColor = clBtnText
      GlyphOptions.FocusedColor = clBtnText
      GlyphOptions.DisabledColor = clBtnText
      GlyphOptions.NormalColorAlpha = 200
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 255
      GlyphOptions.DisabledColorAlpha = 100
      GlyphOptions.Index = 189
      GlyphOptions.Margin = 0
      GlyphOptions.Size = 20
      GlyphOptions.StyleColors = True
      TextMargin = 10
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ShowCaption = True
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 1
      AllowAllUp = False
      WordWrap = False
      ToggleMode = False
    end
    object btDaftar: TscGPCharGlyphButton
      Tag = 1
      Left = 0
      Top = 80
      Width = 40
      Height = 40
      Hint = 'ACCOUNT_HISTORY'
      Align = alTop
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      FluentUIOpaque = False
      TabOrder = 3
      TabStop = True
      OnClick = ButtonSplitClik
      Animation = False
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      Caption = 'Daftar Tunggu'
      CaptionCenterAlignment = False
      CanFocused = True
      CustomDropDown = False
      DrawTextMode = scdtmGDI
      FluentLightEffect = False
      Layout = blGlyphLeft
      TransparentBackground = True
      Options.NormalColor = clWhite
      Options.HotColor = clHighlightText
      Options.PressedColor = clBlack
      Options.FocusedColor = clHighlightText
      Options.DisabledColor = clHighlightText
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 25
      Options.PressedColorAlpha = 70
      Options.FocusedColorAlpha = 0
      Options.DisabledColorAlpha = 255
      Options.NormalColor2Alpha = 255
      Options.HotColor2Alpha = 255
      Options.PressedColor2Alpha = 255
      Options.FocusedColor2Alpha = 255
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clNone
      Options.FrameHotColor = clNone
      Options.FramePressedColor = clHighlightText
      Options.FrameFocusedColor = clNone
      Options.FrameDisabledColor = clHighlightText
      Options.FrameWidth = 1
      Options.FrameNormalColorAlpha = 0
      Options.FrameHotColorAlpha = 0
      Options.FramePressedColorAlpha = 255
      Options.FrameFocusedColorAlpha = 0
      Options.FrameDisabledColorAlpha = 0
      Options.FontNormalColor = clHighlightText
      Options.FontHotColor = clHighlightText
      Options.FontPressedColor = clHighlightText
      Options.FontFocusedColor = clHighlightText
      Options.FontDisabledColor = clHighlightText
      Options.ShapeFillGradientAngle = 0
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 10
      Options.ShapeStyle = scgpRightLine
      Options.ShapeStyleLineSize = 0
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 1
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      Options.PressedHotColors = False
      GlyphOptions.NormalColor = clWhite
      GlyphOptions.HotColor = clBtnText
      GlyphOptions.PressedColor = clBtnText
      GlyphOptions.FocusedColor = clBtnText
      GlyphOptions.DisabledColor = clBtnText
      GlyphOptions.NormalColorAlpha = 200
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 255
      GlyphOptions.DisabledColorAlpha = 100
      GlyphOptions.Index = 248
      GlyphOptions.Margin = 0
      GlyphOptions.Size = 20
      GlyphOptions.StyleColors = True
      TextMargin = 10
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ShowCaption = True
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 1
      AllowAllUp = False
      WordWrap = False
      ToggleMode = False
    end
    object btRigester: TscGPCharGlyphButton
      Left = 0
      Top = 40
      Width = 40
      Height = 40
      Hint = 'CREATE_NEW_VA'
      Align = alTop
      BiDiMode = bdLeftToRight
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = []
      ParentBiDiMode = False
      ParentFont = False
      FluentUIOpaque = False
      TabOrder = 4
      TabStop = True
      OnClick = ButtonSplitClik
      Animation = False
      Badge.Color = clRed
      Badge.ColorAlpha = 255
      Badge.Font.Charset = DEFAULT_CHARSET
      Badge.Font.Color = clWhite
      Badge.Font.Height = -11
      Badge.Font.Name = 'Tahoma'
      Badge.Font.Style = [fsBold]
      Badge.Visible = False
      Caption = 'Pengajuan Anggota'
      CaptionCenterAlignment = False
      CanFocused = True
      CustomDropDown = False
      DrawTextMode = scdtmGDI
      FluentLightEffect = False
      Layout = blGlyphLeft
      TransparentBackground = True
      Options.NormalColor = clWhite
      Options.HotColor = clHighlightText
      Options.PressedColor = clBlack
      Options.FocusedColor = clHighlightText
      Options.DisabledColor = clHighlightText
      Options.NormalColor2 = clNone
      Options.HotColor2 = clNone
      Options.PressedColor2 = clNone
      Options.FocusedColor2 = clNone
      Options.DisabledColor2 = clNone
      Options.NormalColorAlpha = 0
      Options.HotColorAlpha = 25
      Options.PressedColorAlpha = 70
      Options.FocusedColorAlpha = 0
      Options.DisabledColorAlpha = 2
      Options.NormalColor2Alpha = 255
      Options.HotColor2Alpha = 255
      Options.PressedColor2Alpha = 255
      Options.FocusedColor2Alpha = 255
      Options.DisabledColor2Alpha = 255
      Options.FrameNormalColor = clNone
      Options.FrameHotColor = clNone
      Options.FramePressedColor = clHighlightText
      Options.FrameFocusedColor = clNone
      Options.FrameDisabledColor = clHighlightText
      Options.FrameWidth = 1
      Options.FrameNormalColorAlpha = 0
      Options.FrameHotColorAlpha = 0
      Options.FramePressedColorAlpha = 255
      Options.FrameFocusedColorAlpha = 0
      Options.FrameDisabledColorAlpha = 0
      Options.FontNormalColor = clHighlightText
      Options.FontHotColor = clHighlightText
      Options.FontPressedColor = clHighlightText
      Options.FontFocusedColor = clHighlightText
      Options.FontDisabledColor = clHighlightText
      Options.ShapeFillGradientAngle = 0
      Options.ShapeFillGradientPressedAngle = -90
      Options.ShapeFillGradientColorOffset = 25
      Options.ShapeCornerRadius = 10
      Options.ShapeStyle = scgpRightLine
      Options.ShapeStyleLineSize = 0
      Options.ArrowSize = 9
      Options.ArrowAreaSize = 0
      Options.ArrowType = scgpatDefault
      Options.ArrowThickness = 1
      Options.ArrowThicknessScaled = False
      Options.ArrowNormalColor = clBtnText
      Options.ArrowHotColor = clBtnText
      Options.ArrowPressedColor = clBtnText
      Options.ArrowFocusedColor = clBtnText
      Options.ArrowDisabledColor = clBtnText
      Options.ArrowNormalColorAlpha = 200
      Options.ArrowHotColorAlpha = 255
      Options.ArrowPressedColorAlpha = 255
      Options.ArrowFocusedColorAlpha = 200
      Options.ArrowDisabledColorAlpha = 125
      Options.StyleColors = True
      Options.PressedHotColors = False
      GlyphOptions.NormalColor = clWhite
      GlyphOptions.HotColor = clBtnText
      GlyphOptions.PressedColor = clBtnText
      GlyphOptions.FocusedColor = clBtnText
      GlyphOptions.DisabledColor = clBtnText
      GlyphOptions.NormalColorAlpha = 200
      GlyphOptions.HotColorAlpha = 255
      GlyphOptions.PressedColorAlpha = 255
      GlyphOptions.FocusedColorAlpha = 255
      GlyphOptions.DisabledColorAlpha = 100
      GlyphOptions.Index = 473
      GlyphOptions.Margin = 0
      GlyphOptions.Size = 20
      GlyphOptions.StyleColors = True
      TextMargin = 10
      WidthWithCaption = 0
      WidthWithoutCaption = 0
      ShowCaption = True
      SplitButton = False
      RepeatClick = False
      RepeatClickInterval = 100
      ShowGalleryMenuFromTop = False
      ShowGalleryMenuFromRight = False
      ShowMenuArrow = True
      ShowFocusRect = True
      Down = False
      GroupIndex = 1
      AllowAllUp = False
      WordWrap = False
      ToggleMode = False
    end
  end
  object AdvMetroTaskDialog1: TAdvMetroTaskDialog
    AutoClose = True
    CommonButtons = []
    Title = 'ICS'
    Options = []
    Version = '1.0.2.0'
    Left = 384
    Top = 560
  end
  object scStyledForm1: TscStyledForm
    FluentUIBackground = scfuibNone
    FluentUIAcrylicColor = clBtnFace
    FluentUIAcrylicColorAlpha = 100
    FluentUIBorder = True
    FluentUIInactiveAcrylicColorOpaque = False
    DWMClientShadow = True
    DWMClientShadowHitTest = True
    DropDownForm = False
    DropDownAnimation = False
    DropDownBorderColor = clBtnShadow
    StylesMenuSorted = False
    ShowStylesMenu = False
    StylesMenuCaption = 'Styles'
    ClientWidth = 0
    ClientHeight = 0
    ShowHints = True
    Buttons = <
      item
        AllowAllUp = False
        ImageIndex = 1
        Down = False
        Enabled = True
        GroupIndex = 0
        Visible = False
        SplitButton = False
        Style = scncToolButtonTransparent
        Width = 50
        Height = 0
        MarginLeft = 0
        MarginTop = 1
        MarginRight = 5
        MarginBottom = 1
        Position = scbpLeft
        Spacing = 5
        Margin = -1
        ContentMargin = 0
        CustomDropDown = False
      end>
    ButtonFont.Charset = DEFAULT_CHARSET
    ButtonFont.Color = clWindowText
    ButtonFont.Height = -11
    ButtonFont.Name = 'Tahoma'
    ButtonFont.Style = []
    CaptionFont.Charset = DEFAULT_CHARSET
    CaptionFont.Color = clWindowText
    CaptionFont.Height = -13
    CaptionFont.Name = 'Tahoma'
    CaptionFont.Style = []
    CaptionAlignment = taRightJustify
    InActiveClientColor = clWindow
    InActiveClientColorAlpha = 100
    InActiveClientBlurAmount = 5
    Tabs = <>
    TabFont.Charset = DEFAULT_CHARSET
    TabFont.Color = clWindowText
    TabFont.Height = -11
    TabFont.Name = 'Tahoma'
    TabFont.Style = []
    ShowIcon = False
    ShowButtons = True
    ShowTabs = True
    TabIndex = 0
    TabsPosition = sctpLeft
    ShowInactiveTab = True
    CaptionWallpaperIndex = -1
    CaptionWallpaperInActiveIndex = -1
    CaptionWallpaperLeftMargin = 1
    CaptionWallpaperTopMargin = 1
    CaptionWallpaperRightMargin = 1
    CaptionWallpaperBottomMargin = 1
    Left = 387
    Top = 490
  end
  object dsVA_CheckSaldoRelasi: TDataSource
    Left = 395
    Top = 415
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Exel File|*.xlsx;*.xlsm;*.xls;*.xlm|All File|*.*'
    Left = 96
    Top = 374
  end
  object FDQ: TFDQuery
    AutoCalcFields = False
    SQL.Strings = (
      ' select '
      '        enduser_va.va_number,'
      '        enduser_va.idwil,'
      '        enduser.full_name,'
      '        enduser_va.phone,'
      '        coalesce(VUT.billing_id,'#39#39') as billing_id,'
      
        '        case when (VUT.expired_date is null ) then '#39'inactive'#39' el' +
        'se '#39'active'#39' end as Status ,'
      '        coalesce( VUT.expired_date, '#39#39' ) AS expired_date ,'
      '        coalesce( VUT.expired_time, '#39#39') AS expired_time,'
      
        '        coalesce(VUT.cumulative_payment_amount,0) AS cumulative_' +
        'payment_amount,'
      '        coalesce(VUT.va_currency,'#39'IDR'#39' ) AS va_currency,'
      
        '        coalesce( VUT.DESCRIPTION, '#39'AGS-'#39'|| va_listRekDetail.bil' +
        'l_torek ) as description,'
      '        va_listRekDetail.bill_torek,'
      '        TRUE as SELECTED,'
      
        '        enduser_va.Enduser_no, va_listrek.no_rekening, ref_legal' +
        '_id.nama_idlegal,'
      '        ref_virtualaccount.bank_name'
      ''
      '    from va_listrek'
      ''
      
        '       inner join va_listrekdetail on (va_listrekdetail.no_reken' +
        'ing = va_listrek.no_rekening )'
      
        '       inner join enduser_va on (va_listrek.va_number = enduser_' +
        'va.va_number)'
      
        '       join enduser on (enduser_VA.enduser_no = enduser.enduser_' +
        'no )'
      
        '       left join ( select VA_NUMBER, BILLING_ID, EXPIRED_DATE, E' +
        'XPIRED_TIME,'
      
        '                   CUMULATIVE_PAYMENT_AMOUNT, VA_CURRENCY, CREAT' +
        'E_DATE, DESCRIPTION from va_update_trans'
      '                   where'
      
        '                    ((va_update_trans.create_date >= :dexpired_d' +
        'ate)'
      
        '                    OR (va_update_trans.expired_date >= :dexpire' +
        'd_date ))'
      
        '                    ORDER BY va_update_trans.va_number,va_update' +
        '_trans.expired_date ) AS VUT '
      '     ON ( VUT.va_number = enduser_va.va_number) '
      
        '       join dir_cabang on ( dir_cabang.idwil = enduser_va.idwil ' +
        ')'
      
        '       join ref_legal_id on ( ref_legal_id.id_legal  = dir_caban' +
        'g.id_legal )'
      
        '       join ref_virtualaccount ON ( ref_virtualaccount.va_prefix' +
        ' = enduser_va.va_prefix )'
      '    where'
      ''
      '    va_listRekDetail.bill_torek = '#39'112010140234'#39
      '    '
      '    AND'
      ''
      '    ( CASE when (:SIDWIL = '#39'000'#39' or (:SIDWIL IS NULL)  ) then'
      '    ( NOT enduser_va.idwil IS NULL )'
      '    else'
      '    ( enduser_va.idwil = :SIDWIL )'
      '    end )'
      ''
      '    AND'
      ''
      '    ( CASE when (:SSource_rek is null) then'
      '      ( not  enduser_va.Source_rek is null )'
      '    else'
      '    ( enduser_va.Source_rek = 1 )'
      '    end )'
      ''
      '    order by va_listRekDetail.bill_torek'
      ''
      ''
      '    ')
    Left = 208
    Top = 473
    ParamData = <
      item
        Name = 'DEXPIRED_DATE'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'SIDWIL'
        DataType = ftFixedChar
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'SSOURCE_REK'
        DataType = ftFixedChar
        ParamType = ptInput
        Value = '1'
      end>
  end
  object dsFDQLite: TDataSource
    Left = 251
    Top = 494
  end
  object cxStyleRepository1: TcxStyleRepository
    Left = 384
    Top = 624
    PixelsPerInch = 96
    object cxNotProcessed: TcxStyle
      AssignedValues = [svColor]
      Color = clActiveCaption
    end
    object cxNotProcessedFocused: TcxStyle
      AssignedValues = [svColor]
      Color = clYellow
    end
    object cxDefault: TcxStyle
    end
    object styleSelected: TcxStyle
      AssignedValues = [svColor]
      Color = clActiveBorder
    end
    object cxCurrency: TcxStyle
    end
  end
  object OpenPictureDialog1: TOpenPictureDialog
    Left = 94
    Top = 434
  end
  object NetHTTPClient1: TNetHTTPClient
    Asynchronous = False
    ConnectionTimeout = 60000
    ResponseTimeout = 60000
    HandleRedirects = True
    AllowCookies = True
    UserAgent = 'Embarcadero URI Client/1.0'
    Left = 88
    Top = 312
  end
  object mtPinjaman: TFDMemTable
    Active = True
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 896
    Top = 496
    object mtPinjamanno_rek: TStringField
      FieldName = 'no_rek'
      Size = 16
    end
    object mtPinjamaninfosaldo: TCurrencyField
      FieldName = 'infosaldo'
    end
  end
  object dsInfoPinjaman: TDataSource
    DataSet = mtPinjaman
    Left = 960
    Top = 504
  end
  object InfoPinjaman: TDataSource
    DataSet = mtSimpanan
    Left = 960
    Top = 432
  end
  object mtSimpanan: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 728
    Top = 456
    object StringField1: TStringField
      FieldName = 'no_rek'
      Size = 16
    end
    object CurrencyField1: TCurrencyField
      FieldName = 'infosaldo'
    end
  end
  object dsAngCom: TDataSource
    DataSet = mtAngCom
    Left = 264
    Top = 400
  end
  object mtAngCom: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'type_anggota'
        DataType = ftInteger
      end
      item
        Name = 'descript'
        DataType = ftString
        Size = 30
      end>
    IndexDefs = <
      item
        Name = 'idxAng'
        Fields = 'type_anggota'
      end>
    Indexes = <
      item
        Active = True
        Selected = True
        Name = 'idxAng'
        Fields = 'type_anggota'
      end>
    IndexFieldNames = 'type_anggota'
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    StoreDefs = True
    Left = 216
    Top = 368
    object mtAngComtype_anggota: TIntegerField
      FieldName = 'type_anggota'
    end
    object mtAngComdescript: TStringField
      FieldName = 'descript'
      Size = 30
    end
  end
  object dsList: TDataSource
    DataSet = mtList
    Left = 968
    Top = 336
  end
  object dpMtList: TWPMMDataProvider
    Datasource = dsList
    EditBox = WPRichText1
    ShowFieldNames = False
    Options = []
    AutoLoadData = True
    AppendSpaceToNonEmpty = False
    AutoSaveData = False
    BooleanConversion = cvStandard
    Left = 595
    Top = 236
  end
  object mtList: TFDMemTable
    Active = True
    FieldDefs = <
      item
        Name = 'GOID'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'GO_STATUS'
        DataType = ftSmallint
      end
      item
        Name = 'GO_DATE'
        Attributes = [faRequired]
        DataType = ftTimeStamp
      end
      item
        Name = 'CLOSED'
        DataType = ftBoolean
      end
      item
        Name = 'DESCRIPTION'
        DataType = ftString
        Size = 80
      end
      item
        Name = 'CRT_DATE'
        DataType = ftTimeStamp
      end
      item
        Name = 'CRT_USER'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'OI_ANGGOTA'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'PROC_ID'
        DataType = ftSmallint
      end
      item
        Name = 'PART_NOTICE'
        Attributes = [faRequired]
        DataType = ftString
        Size = 15
      end
      item
        Name = 'ID_LEGAL'
        Attributes = [faRequired]
        DataType = ftLargeint
      end
      item
        Name = 'ENDUSER_NO'
        Attributes = [faRequired]
        DataType = ftInteger
      end
      item
        Name = 'IDWIL_PEMOHON'
        Attributes = [faFixed]
        DataType = ftFixedChar
        Size = 3
      end
      item
        Name = 'NAMA_KANTOR1'
        Attributes = [faFixed]
        DataType = ftFixedChar
        Size = 30
      end
      item
        Name = 'NAMA_IDLEGAL'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'TYPE_ANGGOTA'
        DataType = ftInteger
      end
      item
        Name = 'STATUS_REG'
        Attributes = [faFixed]
        DataType = ftFixedChar
        Size = 9
      end
      item
        Name = 'OLDOFDAY'
        DataType = ftLargeint
      end
      item
        Name = 'DATE_REGISTER'
        DataType = ftDate
      end
      item
        Name = 'DATE_RESIGN'
        DataType = ftDate
      end
      item
        Name = 'APPROVAL'
        DataType = ftString
        Size = 40
      end
      item
        Name = 'DATE_APPROVAL'
        DataType = ftTimeStamp
      end
      item
        Name = 'STATUS_REGISTER'
        DataType = ftBoolean
      end
      item
        Name = 'GOID_1'
        DataType = ftInteger
      end
      item
        Name = 'ID_ANGGOTA'
        DataType = ftInteger
      end
      item
        Name = 'NO_REK'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'IDWIL_DEBT'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'NAMA'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'KOTALAHIR'
        DataType = ftString
        Size = 25
      end
      item
        Name = 'TGLLAHIR'
        DataType = ftDate
      end
      item
        Name = 'UMUR'
        DataType = ftLargeint
      end
      item
        Name = 'GENDER'
        Attributes = [faFixed]
        DataType = ftFixedChar
        Size = 6
      end
      item
        Name = 'KOTA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'KECAMATAN'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'DESA'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'RTRW'
        DataType = ftString
        Size = 30
      end
      item
        Name = 'PEKERJAAN'
        DataType = ftString
        Size = 50
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
    StoreDefs = True
    Left = 880
    Top = 272
    Content = {
      414442530F001214F61C0000FF00010001FF02FF0304000C0000006D0074004C
      0069007300740005000A0000005400610062006C006500060000000000070000
      080032000000090000FF0AFF0B04000800000047004F00490044000500080000
      0047004F00490044000C00010000000E000D000F000110000111000112000113
      000114000800000047004F0049004400FEFF0B04001200000047004F005F0053
      005400410054005500530005001200000047004F005F00530054004100540055
      0053000C00020000000E0015000F000116000110000117000111000112000114
      001200000047004F005F00530054004100540055005300FEFF0B04000E000000
      47004F005F00440041005400450005000E00000047004F005F00440041005400
      45000C00030000000E0018000F000110000111000112000114000E0000004700
      4F005F004400410054004500FEFF0B04000C00000043004C004F005300450044
      0005000C00000043004C004F005300450044000C00040000000E0019000F0001
      16000110000117000111000112000114000C00000043004C004F005300450044
      00FEFF0B0400160000004400450053004300520049005000540049004F004E00
      0500160000004400450053004300520049005000540049004F004E000C000500
      00000E001A001B00500000000F00011600011000011700011100011200011400
      160000004400450053004300520049005000540049004F004E001C0050000000
      FEFF0B0400100000004300520054005F00440041005400450005001000000043
      00520054005F0044004100540045000C00060000000E0018000F000116000110
      00011700011100011200011400100000004300520054005F0044004100540045
      00FEFF0B0400100000004300520054005F005500530045005200050010000000
      4300520054005F0055005300450052000C00070000000E001A001B0028000000
      0F00011600011000011700011100011200011400100000004300520054005F00
      55005300450052001C0028000000FEFF0B0400140000004F0049005F0041004E
      00470047004F00540041000500140000004F0049005F0041004E00470047004F
      00540041000C00080000000E000D000F00011000011100011200011400140000
      004F0049005F0041004E00470047004F0054004100FEFF0B04000E0000005000
      52004F0043005F004900440005000E000000500052004F0043005F0049004400
      0C00090000000E0015000F000116000110000117000111000112000114000E00
      0000500052004F0043005F0049004400FEFF0B04001600000050004100520054
      005F004E004F00540049004300450005001600000050004100520054005F004E
      004F0054004900430045000C000A0000000E001A001B000F0000000F00011000
      0111000112000114001600000050004100520054005F004E004F005400490043
      0045001C000F000000FEFF0B040010000000490044005F004C00450047004100
      4C00050010000000490044005F004C004500470041004C000C000B0000000E00
      1D000F0001100001110001120001140010000000490044005F004C0045004700
      41004C00FEFF0B04001400000045004E00440055005300450052005F004E004F
      0005001400000045004E00440055005300450052005F004E004F000C000C0000
      000E000D000F000110000111000112000114001400000045004E004400550053
      00450052005F004E004F00FEFF0B04001A00000049004400570049004C005F00
      500045004D004F0048004F004E0005001A00000049004400570049004C005F00
      500045004D004F0048004F004E000C000D0000000E001A001B00030000000F00
      011600011E000110000117000111000112000114000A00000049004400570049
      004C001C0003000000FEFF0B0400180000004E0041004D0041005F004B004100
      4E0054004F00520031000500180000004E0041004D0041005F004B0041004E00
      54004F00520031000C000E0000000E001A001B001E0000000F00011600011E00
      011F0001200001100001170001210001140010000000570049004C005F004E00
      41004D0045001C001E000000FEFF0B0400180000004E0041004D0041005F0049
      0044004C004500470041004C000500180000004E0041004D0041005F00490044
      004C004500470041004C000C000F0000000E001A001B00280000000F00011600
      011F00012000011000011700012100011400180000004E0041004D0041005F00
      490044004C004500470041004C001C0028000000FEFF0B040018000000540059
      00500045005F0041004E00470047004F00540041000500180000005400590050
      0045005F0041004E00470047004F00540041000C00100000000E000D000F0001
      16000110000117000111000112000114001800000054005900500045005F0041
      004E00470047004F0054004100FEFF0B04001400000053005400410054005500
      53005F005200450047000500140000005300540041005400550053005F005200
      450047000C00110000000E001A001B00090000000F00011600011E00011F0001
      2000011000011700012100011400140000005300540041005400550053005F00
      5200450047001C0009000000FEFF0B0400100000004F004C0044004F00460044
      00410059000500100000004F004C0044004F0046004400410059000C00120000
      000E001D000F00011600011F0001200001100001170001210001140010000000
      4F004C0044004F004600440041005900FEFF0B04001A00000044004100540045
      005F005200450047004900530054004500520005001A00000044004100540045
      005F00520045004700490053005400450052000C00130000000E0022000F0001
      1600011F000120000110000117000121000114001A0000004400410054004500
      5F0052004500470049005300540045005200FEFF0B0400160000004400410054
      0045005F00520045005300490047004E0005001600000044004100540045005F
      00520045005300490047004E000C00140000000E0022000F00011600011F0001
      20000110000117000121000114001600000044004100540045005F0052004500
      5300490047004E00FEFF0B04001000000041005000500052004F00560041004C
      0005001000000041005000500052004F00560041004C000C00150000000E001A
      001B00280000000F00011600011F000120000110000117000121000114001000
      000041005000500052004F00560041004C001C0028000000FEFF0B04001A0000
      0044004100540045005F0041005000500052004F00560041004C0005001A0000
      0044004100540045005F0041005000500052004F00560041004C000C00160000
      000E0018000F00011600011F000120000110000117000121000114001A000000
      44004100540045005F0041005000500052004F00560041004C00FEFF0B04001E
      0000005300540041005400550053005F00520045004700490053005400450052
      0005001E0000005300540041005400550053005F005200450047004900530054
      00450052000C00170000000E0019000F00011600011F00012000011000011700
      0121000114001E0000005300540041005400550053005F005200450047004900
      5300540045005200FEFF0B04000C00000047004F00490044005F00310005000C
      00000047004F00490044005F0031000C00180000000E000D000F00011600011F
      000120000110000117000121000114000800000047004F0049004400FEFF0B04
      0014000000490044005F0041004E00470047004F005400410005001400000049
      0044005F0041004E00470047004F00540041000C00190000000E000D000F0001
      1600011F0001200001100001170001210001140014000000490044005F004100
      4E00470047004F0054004100FEFF0B04000C0000004E004F005F00520045004B
      0005000C0000004E004F005F00520045004B000C001A0000000E001A001B000C
      0000000F00011600011F000120000110000117000121000114000C0000004E00
      4F005F00520045004B001C000C000000FEFF0B04001400000049004400570049
      004C005F00440045004200540005001400000049004400570049004C005F0044
      004500420054000C001B0000000E001A001B00030000000F00011600011F0001
      20000110000117000121000114000A00000049004400570049004C001C000300
      0000FEFF0B0400080000004E0041004D0041000500080000004E0041004D0041
      000C001C0000000E001A001B00320000000F00011600011F0001200001100001
      170001210001140012000000460055004C004C005F004E0041004D0045001C00
      32000000FEFF0B0400120000004B004F00540041004C00410048004900520005
      00120000004B004F00540041004C0041004800490052000C001D0000000E001A
      001B00190000000F00011600011F000120000110000117000121000114001200
      000043004900540059005F0042004F0052004E001C0019000000FEFF0B040010
      000000540047004C004C004100480049005200050010000000540047004C004C
      0041004800490052000C001E0000000E0022000F00011600011F000120000110
      000117000121000114001200000044004100540045005F0042004F0052004E00
      FEFF0B04000800000055004D005500520005000800000055004D00550052000C
      001F0000000E001D000F00011600011F00012000011000011700012100011400
      0800000055004D0055005200FEFF0B04000C000000470045004E004400450052
      0005000C000000470045004E004400450052000C00200000000E001A001B0006
      0000000F00011600011E00011F000120000110000117000121000114000C0000
      00470045004E004400450052001C0006000000FEFF0B0400080000004B004F00
      540041000500080000004B004F00540041000C00210000000E001A001B001E00
      00000F00011600011F000120000110000117000121000114000C000000520045
      00470049004F004E001C001E000000FEFF0B0400120000004B00450043004100
      4D004100540041004E000500120000004B004500430041004D00410054004100
      4E000C00220000000E001A001B001E0000000F00011600011F00012000011000
      0117000121000114000C00000053004500430054004F0052001C001E000000FE
      FF0B040008000000440045005300410005000800000044004500530041000C00
      230000000E001A001B001E0000000F00011600011F0001200001100001170001
      21000114000E000000560049004C004C004100470045001C001E000000FEFF0B
      040008000000520054005200570005000800000052005400520057000C002400
      00000E001A001B001E0000000F00011600011F00012000011000011700012100
      0114001A000000530043004F00500045005F00560049004C004C004100470045
      001C001E000000FEFF0B040012000000500045004B00450052004A0041004100
      4E00050012000000500045004B00450052004A00410041004E000C0025000000
      0E001A001B00320000000F00011600011F000120000110000117000121000114
      00260000004400450053004B00520049005000530049005F00500045004B0045
      0052004A00410041004E001C0032000000FEFEFF23FEFF24FEFF25FF26270000
      000000FF28000011000000010000000200E70703001E0008000F001600020200
      00030000000400000000000500E70703001E0008000F00160002020000060000
      0000000700000000000800000009000A0000005065726D6F686F6E616E0A0076
      6DAC00050300000B00FD9F17000C00030000003032320D00050000004B756475
      730E000F0000004B5350205554414D41204B415259410F000200000010000600
      00004143544956451100020000000000000014000000000019000C0000003131
      323232303536303230321A00030000003032321B000D00000046455249204C49
      535449414E491C00050000004B554455531D0034080B001E002B000000000000
      001F000600000057616E6974612000050000004B554455532100050000004B55
      44555322000E0000004D4C415449204E4F524F5749544F230007000000303033
      2D303035240000000000FEFEFF26270001000000FF2800001100000001000000
      0200E70703001E0008000F00160002020000030000000400000000000500E707
      03001E0008000F00160002020000060000000000070000000000080000000900
      0A0000005065726D6F686F6E616E0A00766DAC00050300000B00FD9F17000C00
      030000003032320D00050000004B756475730E000F0000004B5350205554414D
      41204B415259410F000200000010000600000041435449564511000200000000
      00000014000000000019000C0000003131323232303536303230321A00030000
      003032321B000D00000046455249204C49535449414E491C00050000004B5544
      55531D0034080B001E002B000000000000001F000600000057616E6974612000
      050000004B554455532100050000004B5544555322000E0000004D4C41544920
      4E4F524F5749544F2300070000003030332D303035240000000000FEFEFF2627
      0002000000FF2800000A000000010000000200E6070700160000000000000000
      000000030000000400000000000500E70703001E00090004002700B800000006
      00000000000700000000000800000009000A0000005065726D6F686F6E616E0A
      00766DAC00050300000B0008A11F000C00030000003032320D00050000004B75
      6475730E000F0000004B5350205554414D41204B415259410F00020000001000
      060000004143544956451100020000000000000014000000000019000C000000
      3131323232303920303839341A00030000003032321B00080000005A554D524F
      54554E1C00060000004A45504152411D003E040B001E002E000000000000001F
      000600000057616E6974612000060000004A455041524121000C0000004B414C
      494E59414D4154414E22000700000042414B414C414E2300070000003031312D
      303032240000000000FEFEFF26270003000000FF2800000B0000000100000002
      00E6070700170000000000000000000000030000000400000000000500E70703
      001E0009000C0009006C0100000600000000000700000000000800000009000A
      0000005065726D6F686F6E616E0A00766DAC00050300000B0041171A000C0003
      0000003032320D00050000004B756475730E000F0000004B5350205554414D41
      204B415259410F00020000001000060000004143544956451100020000000000
      000014000000000019000C0000003131323232303920303839361A0003000000
      3032321B00060000004C41535452491C00050000004B554455531D00A4040B00
      1E002E000000000000001F000600000057616E6974612000050000004B554455
      532100050000004B55445553220009000000505552574F534152492300070000
      003030342D303035240000000000FEFEFF26270004000000FF2800000B000000
      010000000200E607070017000000000000000000000003000000040000000000
      0500E70703001E0009000C0009006C0100000600000000000700000000000800
      000009000A0000005065726D6F686F6E616E0A00766DAC00050300000B004117
      1A000C00030000003032320D00050000004B756475730E000F0000004B535020
      5554414D41204B415259410F0002000000100006000000414354495645110002
      0000000000000014000000000019000C0000003131323232303920303839361A
      00030000003032321B00060000004C41535452491C00050000004B554455531D
      00A4040B001E002E000000000000001F000600000057616E6974612000050000
      004B554455532100090000004B414C4957554E47552200050000004D494A454E
      2300070000003030362D303031240000000000FEFEFF26270005000000FF2800
      000B000000010000000200E60707001700000000000000000000000300000004
      00000000000500E70703001E0009000C0009006C010000060000000000070000
      0000000800000009000A0000005065726D6F686F6E616E0A00766DAC00050300
      000B0041171A000C00030000003032320D00050000004B756475730E000F0000
      004B5350205554414D41204B415259410F000200000010000600000041435449
      56451100020000000000000014000000000019000C0000003131323232303920
      303839361A00030000003032321B00060000004C41535452491C00050000004B
      554455531D00A4040B001E002E000000000000001F000600000057616E697461
      2000050000004B554455532100090000004B414C4957554E4755220005000000
      4D494A454E2300070000003030362D303031240000000000FEFEFF2627000600
      0000FF2800000B000000010000000200E6070700170000000000000000000000
      030000000400000000000500E70703001E0009000C0009006C01000006000000
      00000700000000000800000009000A0000005065726D6F686F6E616E0A00766D
      AC00050300000B0041171A000C00030000003032320D00050000004B75647573
      0E000F0000004B5350205554414D41204B415259410F00020000001000060000
      004143544956451100020000000000000014000000000019000C000000313132
      3232303920303839361A00030000003032321B00060000004C41535452491C00
      050000004B554455531D00A4040B001E002E000000000000001F000600000057
      616E6974612000050000004B554455532100090000004B414C4957554E475522
      00050000004D494A454E2300070000003030362D303031240000000000FEFEFF
      26270007000000FF2800000B000000010000000200E607070017000000000000
      0000000000030000000400000000000500E70703001E0009000C0009006C0100
      000600000000000700000000000800000009000A0000005065726D6F686F6E61
      6E0A00766DAC00050300000B0041171A000C00030000003032320D0005000000
      4B756475730E000F0000004B5350205554414D41204B415259410F0002000000
      1000060000004143544956451100020000000000000014000000000019000C00
      00003131323232303920303839361A00030000003032321B00060000004C4153
      5452491C00050000004B554455531D00A4040B001E002E000000000000001F00
      0600000057616E6974612000050000004B554455532100090000004B414C4957
      554E47552200050000004D494A454E2300070000003030362D30303124000000
      0000FEFEFF26270008000000FF2800000C000000010000000200E70703001900
      0C00040039007B030000030000000400000000000500E707030019000C000400
      39007B0300000600000000000700000000000800000009000A0000005065726D
      6F686F6E616E0A00766DAC00050300000B00F3A71F000C00030000003032320D
      00050000004B756475730E000F0000004B5350205554414D41204B415259410F
      0002000000100006000000414354495645110007000000000000001400000000
      0019000C0000003131323232303920303839371A00030000003032321B000E00
      00004953454820464149512052495A411C00060000004A45504152411D004713
      0B001E0023000000000000001F0004000000507269612000060000004A455041
      524121000700000057454C4148414E22000A00000054454C554B574554414E23
      00070000003031312D303032240000000000FEFEFF26270009000000FF280000
      0F000000010000000200E707010007000A001200240000000000030000000400
      000000000500E70703001D000A00120024009C03000006000000000007000000
      00000800000009000A0000005065726D6F686F6E616E0A00766DAC0005030000
      0B00A8D902000C00030000003032320D00050000004B756475730E000F000000
      4B5350205554414D41204B415259410F00020000001000060000004143544956
      451100030000000000000014000000000019000C000000313132323231333530
      3131331A00030000003032321B00050000004B41534E4F1C000800000047524F
      424F47414E1D0029010B001E0030000000000000001F00040000005072696120
      000800000047524F424F47414E21000A00000050454E4157414E47414E22000B
      0000004B4152414E475041494E472300070000003030332D3030322400000000
      00FEFEFEFEFEFF29FEFF2A2B0015000000FF2CFEFEFE0E004D0061006E006100
      6700650072001E00550070006400610074006500730052006500670069007300
      74007200790012005400610062006C0065004C006900730074000A0054006100
      62006C00650008004E0061006D006500140053006F0075007200630065004E00
      61006D0065000A0054006100620049004400240045006E0066006F0072006300
      650043006F006E00730074007200610069006E00740073001E004D0069006E00
      69006D0075006D00430061007000610063006900740079001800430068006500
      63006B004E006F0074004E0075006C006C00140043006F006C0075006D006E00
      4C006900730074000C0043006F006C0075006D006E00100053006F0075007200
      63006500490044000E006400740049006E007400330032001000440061007400
      610054007900700065001400530065006100720063006800610062006C006500
      0800420061007300650012004F0049006E005500700064006100740065001000
      4F0049006E00570068006500720065000C004F0049006E004B00650079001A00
      4F0072006900670069006E0043006F006C004E0061006D0065000E0064007400
      49006E00740031003600120041006C006C006F0077004E0075006C006C001400
      4F0041006C006C006F0077004E0075006C006C001E0064007400440061007400
      6500540069006D0065005300740061006D00700012006400740042006F006F00
      6C00650061006E0018006400740041006E007300690053007400720069006E00
      67000800530069007A006500140053006F007500720063006500530069007A00
      65000E006400740049006E007400360034001000460069007800650064004C00
      65006E00100052006500610064004F006E006C0079000E004400650066006100
      75006C00740020004F004100660074006500720049006E007300430068006100
      6E006700650064000C006400740044006100740065001C0043006F006E007300
      74007200610069006E0074004C00690073007400100056006900650077004C00
      6900730074000E0052006F0077004C00690073007400060052006F0077000A00
      52006F0077004900440010004F0072006900670069006E0061006C0018005200
      65006C006100740069006F006E004C006900730074001C005500700064006100
      7400650073004A006F00750072006E0061006C00120053006100760065005000
      6F0069006E0074000E004300680061006E00670065007300}
  end
end
