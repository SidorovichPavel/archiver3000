object MainForm: TMainForm
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Archiver3000'
  ClientHeight = 452
  ClientWidth = 634
  Color = clBtnFace
  Constraints.MinHeight = 480
  Constraints.MinWidth = 640
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = createMainForm
  PixelsPerInch = 96
  TextHeight = 13
  object SFS: TLabel
    Left = 343
    Top = 269
    Width = 103
    Height = 13
    Caption = 'source file size (byte)'
  end
  object CFS: TLabel
    Left = 343
    Top = 316
    Width = 125
    Height = 13
    Caption = 'compressed file size(byte)'
  end
  object CompR: TLabel
    Left = 343
    Top = 363
    Width = 84
    Height = 13
    Caption = 'compression ratio'
  end
  object Label1: TLabel
    Left = 8
    Top = 247
    Width = 82
    Height = 16
    Caption = 'Full file name:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ArchiveHafButton: TButton
    Left = 8
    Top = 269
    Width = 89
    Height = 41
    Action = ArchiveHafman
    TabOrder = 0
  end
  object ArchiveLZWButton: TButton
    Left = 111
    Top = 269
    Width = 89
    Height = 41
    Action = ArchiveLZW
    TabOrder = 1
  end
  object ArchiveRLEButton: TButton
    Left = 216
    Top = 269
    Width = 89
    Height = 41
    Action = ArchiveRLE
    TabOrder = 2
  end
  object path: TEdit
    Left = 91
    Top = 242
    Width = 525
    Height = 21
    TabOrder = 3
    Text = 'path'
  end
  object DecodeButton: TButton
    Left = 8
    Top = 316
    Width = 297
    Height = 41
    Action = Decode
    TabOrder = 4
  end
  object Files: TFileListBox
    Left = 343
    Top = 33
    Width = 273
    Height = 176
    ItemHeight = 13
    TabOrder = 5
    OnChange = changeFileDir
  end
  object Folders: TDirectoryListBox
    Left = 8
    Top = 56
    Width = 313
    Height = 177
    TabOrder = 6
    OnChange = changeFileDir
  end
  object Drives: TDriveComboBox
    Left = 8
    Top = 31
    Width = 313
    Height = 19
    TabOrder = 7
    OnChange = changeFileDir
  end
  object Filter: TFilterComboBox
    Left = 343
    Top = 215
    Width = 273
    Height = 21
    TabOrder = 8
    OnChange = changeFileDir
  end
  object Button1: TButton
    Left = 527
    Top = 269
    Width = 89
    Height = 41
    Action = DirectoryUpdate
    TabOrder = 9
  end
  object SFS_text: TEdit
    Left = 343
    Top = 289
    Width = 121
    Height = 21
    TabOrder = 10
    Text = 'SFS_text'
  end
  object CFS_text: TEdit
    Left = 343
    Top = 335
    Width = 121
    Height = 21
    TabOrder = 11
    Text = 'CFS_text'
  end
  object CompR_text: TEdit
    Left = 343
    Top = 382
    Width = 121
    Height = 21
    TabOrder = 12
    Text = 'CompR_text'
  end
  object Actions: TActionList
    Left = 8
    Top = 400
    object ArchiveHafman: TAction
      Caption = 'ArchiveHafman'
      ShortCut = 16456
      OnExecute = ArchiveHafmanExecute
    end
    object ArchiveLZW: TAction
      Caption = 'ArchiveLZW'
      ShortCut = 16460
      OnExecute = ArchiveLZWExecute
    end
    object ArchiveRLE: TAction
      Caption = 'ArchiveRLE'
      ShortCut = 16466
      OnExecute = ArchiveRLEExecute
    end
    object Decode: TAction
      Caption = 'Decode'
      ShortCut = 16452
      OnExecute = DecodeExecute
    end
    object DirectoryUpdate: TAction
      Caption = 'DirectoryUpdate'
      OnExecute = DirectoryUpdateExecute
    end
  end
end
