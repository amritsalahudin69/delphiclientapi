object fAppAnalys: TfAppAnalys
  Left = 0
  Top = 0
  Caption = 'fAppAnalys'
  ClientHeight = 284
  ClientWidth = 758
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object scGPPanel2: TscGPPanel
    Left = 0
    Top = 0
    Width = 758
    Height = 65
    Align = alTop
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
    FillGradientAngle = 90
    FillGradientBeginAlpha = 255
    FillGradientEndAlpha = 255
    FillGradientBeginColorOffset = 25
    FillGradientEndColorOffset = 25
    FrameWidth = 2
    FillColor = clBtnFace
    FillColorAlpha = 150
    FillColor2 = clNone
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
    Caption = 'scGPPanel1'
    TransparentBackground = True
    StorePaintBuffer = True
    Sizeable = False
    WallpaperIndex = -1
    WordWrap = False
    DesignSize = (
      758
      65)
    object scLabel1: TscLabel
      Left = 20
      Top = 31
      Width = 243
      Height = 13
      Anchors = []
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
      UseFontColorToStyleColor = False
      Caption = 'Analisa pra-Approval Calon Anggota dari Peminjam'
    end
  end
  object scGPPanel1: TscGPPanel
    Left = 0
    Top = 65
    Width = 758
    Height = 219
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
    FillGradientAngle = 90
    FillGradientBeginAlpha = 255
    FillGradientEndAlpha = 255
    FillGradientBeginColorOffset = 25
    FillGradientEndColorOffset = 25
    FrameWidth = 2
    FillColor = clBtnFace
    FillColorAlpha = 150
    FillColor2 = clNone
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
    Caption = 'scGPPanel1'
    TransparentBackground = True
    StorePaintBuffer = True
    Sizeable = False
    WallpaperIndex = -1
    WordWrap = False
    object GridPanel1: TGridPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 748
      Height = 209
      Align = alClient
      ColumnCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 130.000000000000000000
        end
        item
          Value = 100.000000000000000000
        end>
      ControlCollection = <
        item
          Column = 0
          Control = eCIF
          Row = 0
        end
        item
          Column = 0
          Control = eNama
          Row = 1
        end
        item
          Column = 0
          Control = ePinjaman
          Row = 2
        end
        item
          Column = 0
          Control = ePerihal
          Row = 3
        end
        item
          Column = 0
          Control = eStatus
          Row = 5
        end
        item
          Column = 0
          Control = eTglMohon
          Row = 4
        end
        item
          Column = 1
          Control = eBtrima
          Row = 6
        end
        item
          Column = -1
          Row = 5
        end
        item
          Column = 1
          Control = elCif
          Row = 0
        end
        item
          Column = 1
          Control = elNama
          Row = 1
        end
        item
          Column = 1
          Control = elNomor
          Row = 2
        end
        item
          Column = 1
          Control = elPerihal
          Row = 3
        end
        item
          Column = 1
          Control = elTglMohon
          Row = 4
        end
        item
          Column = 1
          Control = elStatus
          Row = 5
        end>
      RowCollection = <
        item
          SizeStyle = ssAbsolute
          Value = 25.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 30.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 30.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 30.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 30.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 30.000000000000000000
        end
        item
          SizeStyle = ssAbsolute
          Value = 30.000000000000000000
        end>
      TabOrder = 0
      DesignSize = (
        748
        209)
      object eCIF: TscLabel
        Left = 57
        Top = 7
        Width = 17
        Height = 13
        Anchors = []
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
        UseFontColorToStyleColor = False
        Caption = 'CIF'
      end
      object eNama: TscLabel
        Left = 15
        Top = 34
        Width = 101
        Height = 13
        Anchors = []
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
        UseFontColorToStyleColor = False
        Caption = 'Nama Calon Anggota'
      end
      object ePinjaman: TscLabel
        Left = 27
        Top = 64
        Width = 77
        Height = 13
        Anchors = []
        FluentUIOpaque = False
        TabOrder = 2
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
        UseFontColorToStyleColor = False
        Caption = 'Nomor Pinjaman'
      end
      object ePerihal: TscLabel
        Left = 18
        Top = 94
        Width = 95
        Height = 13
        Anchors = []
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
        UseFontColorToStyleColor = False
        Caption = 'Perihal Permohonan'
      end
      object eStatus: TscLabel
        Left = 25
        Top = 154
        Width = 81
        Height = 13
        Anchors = []
        FluentUIOpaque = False
        TabOrder = 4
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
        UseFontColorToStyleColor = False
        Caption = 'Status Registrasi'
      end
      object eTglMohon: TscLabel
        Left = 25
        Top = 124
        Width = 81
        Height = 13
        Anchors = []
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
        UseFontColorToStyleColor = False
        Caption = 'Tgl. Permohonan'
      end
      object eBtrima: TscButton
        Left = 131
        Top = 176
        Width = 100
        Height = 30
        Align = alLeft
        FluentUIOpaque = False
        TabOrder = 5
        TabStop = True
        OnClick = eBtrimaClick
        Animation = False
        Caption = 'Diterima'
        CaptionCenterAlignment = False
        CanFocused = True
        CustomDropDown = False
        Margin = -1
        Spacing = 1
        Layout = blGlyphLeft
        ImageIndex = -1
        ImageMargin = 0
        TransparentBackground = True
        ColorOptions.NormalColor = clBtnFace
        ColorOptions.HotColor = clBtnFace
        ColorOptions.PressedColor = clBtnShadow
        ColorOptions.FocusedColor = clBtnFace
        ColorOptions.DisabledColor = clBtnFace
        ColorOptions.FrameNormalColor = clBtnShadow
        ColorOptions.FrameHotColor = clHighlight
        ColorOptions.FramePressedColor = clHighlight
        ColorOptions.FrameFocusedColor = clHighlight
        ColorOptions.FrameDisabledColor = clBtnShadow
        ColorOptions.FrameWidth = 1
        ColorOptions.FontNormalColor = clBtnText
        ColorOptions.FontHotColor = clBtnText
        ColorOptions.FontPressedColor = clBtnText
        ColorOptions.FontFocusedColor = clBtnText
        ColorOptions.FontDisabledColor = clBtnShadow
        ColorOptions.TitleFontNormalColor = clBtnText
        ColorOptions.TitleFontHotColor = clBtnText
        ColorOptions.TitleFontPressedColor = clBtnText
        ColorOptions.TitleFontFocusedColor = clBtnText
        ColorOptions.TitleFontDisabledColor = clBtnShadow
        ColorOptions.StyleColors = True
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = [fsBold]
        ToggleMode = False
        HotImageIndex = -1
        ModalResult = 1
        ModalSetting = True
        FocusedImageIndex = -1
        PressedImageIndex = -1
        StyleKind = scbsPushButton
        UseGalleryMenuImage = False
        UseGalleryMenuCaption = False
        CustomImageNormalIndex = -1
        CustomImageHotIndex = -1
        CustomImagePressedIndex = -1
        CustomImageDisabledIndex = -1
        CustomImageFocusedIndex = -1
        ScaleMarginAndSpacing = False
        WidthWithCaption = 0
        WidthWithoutCaption = 0
        UseFontColorToStyleColor = False
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
        SplitButton = False
        ShowFocusRect = True
        Down = False
        GroupIndex = 0
        AllowAllUp = False
      end
      object elCif: TscLabel
        Left = 131
        Top = 1
        Width = 300
        Height = 25
        Align = alLeft
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
        AutoSize = False
        Layout = tlCenter
        VertAlignment = scvtaCenter
        UseFontColorToStyleColor = False
      end
      object elNama: TscLabel
        Left = 131
        Top = 26
        Width = 300
        Height = 30
        Align = alLeft
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
        AutoSize = False
        Layout = tlCenter
        VertAlignment = scvtaCenter
        UseFontColorToStyleColor = False
      end
      object elNomor: TscLabel
        Left = 131
        Top = 56
        Width = 300
        Height = 30
        Align = alLeft
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
        AutoSize = False
        Layout = tlCenter
        VertAlignment = scvtaCenter
        UseFontColorToStyleColor = False
      end
      object elPerihal: TscLabel
        Left = 131
        Top = 86
        Width = 300
        Height = 30
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
      object elTglMohon: TscLabel
        Left = 131
        Top = 116
        Width = 300
        Height = 30
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
        Layout = tlCenter
        VertAlignment = scvtaCenter
        UseFontColorToStyleColor = False
      end
      object elStatus: TscLabel
        Left = 131
        Top = 146
        Width = 300
        Height = 30
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
        Layout = tlCenter
        VertAlignment = scvtaCenter
        UseFontColorToStyleColor = False
      end
    end
  end
end
