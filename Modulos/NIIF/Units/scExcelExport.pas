{--------------------------------------------------------------------------------
* Description : TscExcelExport

  This TscExcelExport component is an advanced, powerfull but easy component to
  export all records of a dataset from Delphi to MS Excel (97, 2000, XP or 2003).
  Many features are provided to change the layout, to add totals, to create groups, ...

* Dates : February 2000 - February 2005
* Version : 3.31 (Delphi 5,6,7 & 2005)

* Author : Stefan Cruysberghs
* Email : stefancr@scip.be
* Website : http://www.scip.be
  Visit SCIP.be for other components, tools and articles
--------------------------------------------------------------------------------
* $Archive: /Delphi/Delphi7/Component Library/SC_Public/scExcelExport.pas $
* $Author: StefanCr $
* $Date: 4/02/05 11:14 $
* $Modtime: 4/02/05 11:14 $
* $Revision: 7 $
--------------------------------------------------------------------------------
Copyrights and distribution
* All copyrights to this component are owned by the author Stefan Cruysberghs.
* This component is freeware for non-commercial use and may be freely distributed.
* The author doesn't give a warranty for error free running of this component.
* Registered users can count on it that bugs will be solved as soon as possible.
Registration
* If you like this component and/or you are using it in a commercial environment
  then you can register it.
* You will encourage the author to further develop and improve this component.
* You will receive an email when new versions or upgrades are available and
  support will be provided by e-mail.
* The registration cost is €30 or 30 US$.
* You can register yourself online on the website of Reg.Net (ID = 11696)
  https://secure.reg.net/product.asp?ID=11696
--------------------------------------------------------------------------------
Installation
* Open the run-time package (X=Delphi version) ExcelExportPackX.dpr and build it
* Open the design-time package (X=Delphi version) dclExcelExportPackX.dpr and compile and install it
* The TscExcelExport component can be found in the tabsheet 'SC' of the component palette.
* When you like to add the component to an existing package, add the unit
  scExcelExport to a run-time package. Make sure the DCP file dclOffice is added as required.
  This file can be found in the Borland\Delphi\Lib folder.
  The unit scExcelExportReg.pas contains the registration and property and component editor.
  This unit should be included in a design-time package.
--------------------------------------------------------------------------------
* Versions of Excel typelibraries which can be used
  - Delphi 5.0 : Excel97.pas
  - Delphi 5.0 & SP1 : Excel97.pas or Excel2000.pas (package DclOffice2k50)
  - Delphi 6.0 : Excel97.pas or Excel2000.pas (package DclOffice2k)
  - Delphi 7.0 : Excel97.pas or Excel2000.pas (package DclOffice2k)
                 ExcelXP.pas (package DclOfficeXP) can no be used
  - Delphi 8.0 : Not supported
  - Delphi 9.0 : Excel2000.pas (package DclOffice2k)
                 ExcelXP.pas (package DclOfficeXP) can no be used 
* Each typelibrary supports the extra features of the newer version of Office.
* The only extra feature of Excel2000.pas which is used in the TscExcelExport component
  is exporting an Excel worksheet to HTML. Excel97.pas does not support this.
  In some cases not all borderstyles and colors are supported.
  Avoid using them when you get errors.
* ExcelXP.pas can not be used because several methods and properties have been changed
* The installed version of MS Office should be the same or more recent
  as the version of the Delphi unit.
  e.g.
  - unit Excel97.pas can be used with MS Excel XP
  - unit Excel2000.pas can not be used with MS Excel 97
* The warnings 'unsafe code', 'unsafe type' and 'unsafe typecast' should be ignored.
  In Delphi 7 and 9 these warnings can be disabled in your project options.  
--------------------------------------------------------------------------------
Version 1.0 (February 2000)
Version 1.2 
  - Improved connection to Excel
Version 1.3
  - Added Orientation of titles
  - Added StyleColumnWidth
Version 1.4
  - Improved GetColumnCharacters
  - Added Border properties and background colors for Titles, Data and Summary
  - Added Summary properties (SummarySelection, SummaryFields, SummaryCalculation)
Version 1.5
  - Improved speed of exporting data
  - Improved exporting string-fields
  - Added ConnectTo property
Version 1.6
  - Suppression of reference to Dataset.RecordCount (thanks to Gérard Beneteau)
  - Added VisibleFieldsOnly property
Version 1.7
  - Notification when disconnecting dataset
  - Very fast export by using a variant matrix (thanks to Frank van den Bergh)
Version 1.8
  - Bug in exporting titles (thanks to Roberto Parola)
  - Setting format of cells before exporting data (thanks to Asbjørn Heggvik)
  - Added BlockOfRecords property : little bit faster and more control of memory
  - Added properties to set begin row of titles and data
Version 1.9
  - Added properties (Orientation, WrapText, Alignment) to font (thanks to David Balick)
    (property OrientationTitles is removed)
  - Added HeaderText (thanks to David Balick)
  - Improved some routines
Version 2.0
  - Added read only property with row number of last data row
  - Added property with the Excel tabsheet so after the export
    it is possible to access the cells in Excel
  - Added event OnExportRecords
Version 2.1
  - Bugfixes
Version 2.2
  - Bugfix when exporting filtered dataset (thanks to Heinz Faerber)
  - New column width styles : cwFieldDisplayWidth, cwFieldDataSize, cwEnhAutoFit (idea from Scott Stanek)
Version 2.3
  - Added properties begin column data/titles and header (idea from Knjazev Sergey)
  - Added property ShowTitles
Version 2.4
  - Support for Delphi 6.0
Version 2.5
  - D6 : problem when using disconnect
Version 2.6
  - Bugfixes and some improvements
  - Added method LoadDefaultProperties to reset all properties
  - Improvement SetFormat (thanks to Enrico Chiaramonte)
  - Improvements using borders (thanks to Otávio)
  - Added event OnGetCellBackgroundColorEvent (thanks to Yuri Plotnikov)
  - Added events to export data without using a TDataset
    and new property DataPipe : dpDataset, dpCustom (thanks to David Balick)
  - Event OnExportRecords will be triggered after exporting the record
Version 2.7
  - Some bugfixes
  - Added new unit scExcelExportReg which contains a component editor
  - Added exceptions to prevent access violations
    (EFileNotExists, ENoDatasetConnected, EDatasetNotActive, ENoActiveWorkbook)
  - Added new property Filename which can be used to add data to existing file
  - Add data to existing worksheet when name of given worksheet already exists
  - Added new feature to group rows (thanks to Vadim Mescheryakov & Stijn Vansummeren)
  - Added new group options properties : ClearContents, BorderRange, IntervalFontSize
  - New events for exporting without dataset : OnGotoFirstRecord, OnGotoNextRecord
Version 2.81
  - Created a package for Delphi5 and Delphi6 to make installation easier
  - Added new public method Connect. Can be used to make a connection to Excel before
    exporting data. When exporting more datasets at the same time, the Disconnect
    method should be used after using the ExportDataset method !
  - Added new read only property Connected.
  - Text property of field in stead of Value property is exported
    so OnGetText events can be used
Version 2.91
  - Improvements SetFormat (before exporting data)
  - Added support for fieldtype ftTimeStamp
  - Added fieldtype ftMemo, ftOraClob, ftFmtMemo, these kinds of fields are exported
    using AsVariant not the Text property like other fields
  - Improvement for regional settings of floats (thanks to Jorge Pinetta)
  - Improvement ShowTitles and BeginRowData properties (thanks to Jordi March i Nogué)
  - Added FooterText properties
  - Small changes for Delphi 7.0
Version 3.0
  - Bugfix for Delphi 5 (added extra compiler directives)
  - Improvements constants of Borders, Colors, ...
  - Use OnGetText event for memo field when it is assigned,
    otherwise export contents of memo
  - Improvement exporting string data when DataPipe = dpCustom
  - New demonstration program
Version 3.1
  - Bugfix for displayformat (InitFormatNumbers was disabled)
  - Improvements for exporting currency fields (a kind of curency displayformat
    is created so that the result in Excel looks the same as in your Delphi program)
  - Improvement for setting displayformat for cells. This has to be done before
    exporting. In previous version this was done from row 1 to 9999.
    When exporting more records they had no displayformat.
    Now displayformat for each block of rows is set.
    This will also increase the file size !
  - Added resource strings for the exceptions. Now these error
    messages can be translated.
  - Added scAVG (average) as new TSummaryCalculation type
Version 3.11
  - Add support for displayformat of datetime fields
Version 3.12
  - Bugfix displayformat of time field
Version 3.2 (May 2004)
  - Bugfix displayformat with thousand seperators
  - Bugfix date time fields with Excel 2003 (internal American datetime format should be used)
  - Tested with MS Excel 2003
Version 3.3 (February 2005)
  - Bugfixes : ExcelVersion, Excel 2003, ...
  - Created 2 packages, a run-time (ExcelExportPack) and a design-time (dclExcelExportPack)
  - Tested with Delphi 2005
  - Added new OnCellStyle event which can be used to change the background color
    and font color, size, name and bold style of a cell
  - Added new OnFieldCellStyle event which can be used to change the background color
    and font color, size, name and bold style of a cell when datapipe is set to dpCustom
  - Added ftBCD and ftFMTBCD datatype in IsValueField function
  - Added ftFMTBCD datatype to CanConvertFieldToCell function
Version 3.31 (February 2003)
  - Empty datetime fields are exported as '' instead of 31/12/1899 (thanks to Peter Hannah)
-------------------------------------------------------------------------------}

unit scExcelExport;

interface

{$IFDEF VER170}
  {$DEFINE DELPHI9}
{$ENDIF}

{$IFDEF VER150}
  {$DEFINE DELPHI7}
{$ENDIF}

{$IFDEF VER140}
  {$DEFINE DELPHI6}
{$ENDIF}

{$IFDEF VER130}
  {$DEFINE DELPHI5}
{$ENDIF}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, DB,
  StdCtrls, Registry, 
  OleServer, // used for TConnectKind
  {$IFDEF DELPHI5}
    Excel97; // Excel97 or Excel2000
  {$ELSE}
    Excel2000,
    Variants;
  {$ENDIF}

type
  // Given file (property filename) does not exists (ConnectTo = ctNewExcel)
  EFileNotExists = class(Exception);
  // No TDataset is connected to TscExcelExport component
  ENoDatasetConnected = class(Exception);
  // Dataset is not active
  EDatasetNotActive = class(Exception);
  // There is no active workbook to create a new worksheet (ConnectTo = ctNewWorksheet)
  ENoActiveWorkbook = class(Exception);

  TDataPipe = (dpDataSet, dpCustom);
  TFileFormat = (ffXLS, ffHTM, ffCSV, ffXL97);
  TStyleColumnWidth = (cwDefault, cwOwnerWidth, cwAutoFit, cwFieldDisplayWidth, cwFieldDataSize, cwEnhAutoFit);
    // cwOwnerWidth : width specified with property ColumnWidth
    // cwAutoFit : Excel autofit
    // cwFieldDisplayWidth : width of DisplayWidth of TField
    // cwFieldDataSize : width of Datasize of TField
    //    Datasize = amount of memory to store value, for datetime fields width is set to 16
    // cwEnhAutoFit (enhanced autofit) : width of DisplayWidth of TField except when title is larger
  TBorderWeight = (bwHairline,bwMedium,bwThick,bwThin);
  TBorderLineStyle = (blContinuous, blDash, blDashDot, blDashDotDot,
                      blDot, blDouble, blSlantDashDot, blLine, blNone);
    // blLine is same as blnContinous, but it is necessary for compatibility reasons
  TSummarySelection = (ssNone, ssValues, ssGiven);
  TSummaryCalculation = (scSUM, scMIN, scMAX, scAVG);
  THAlignment = (haGeneral, haLeft, haRight, haCenter);
  TConnectTo = (ctNewExcel, ctNewWorkbook, ctNewWorksheet);
  TBorderRange = (bsCell, bsRow);

  TxlFont = class(TFont)
  private
    FAlignment: THAlignment;
    FBlnWrapText: Boolean;
    FIntOrientation: Integer;
  published
    // Alignment of font : haGeneral, haLeft, haRight, haCenter
    property Alignment: THAlignment read FAlignment write FAlignment;
    // Wrap text when cell is to small for value
    property WrapText: Boolean read FBlnWrapText write FBlnWrapText;
    // Rotate font
    property Orientation: Integer read FIntOrientation write FIntOrientation;
  end;

  TCellBorder = class(TPersistent)
  private
    FBackColor : TColor;
    FBorderColor : TColor;
    FBorderWeight : TBorderWeight;
    FBorderLineStyle : TBorderLineStyle;
  published
    // Background color
    property BackColor : TColor read FBackColor write FBackColor default clWhite;
    // Border color
    property BorderColor : TColor read FBorderColor write FBorderColor default clBlack;
    // Weight : bwHairline,bwMedium,bwThick,bwThin
    property Weight : TBorderWeight read FBorderWeight write FBorderWeight default bwMedium;
    // LineStyle : blDash, blDouble, blLine, blNone, ...
    property LineStyle : TBorderLineStyle read FBorderLineStyle write FBorderLineStyle default blNone;
  end;

  TGroupOptions = class(TPersistent)
  private
    FBlnClearContents : Boolean;
    FBorderRange : TBorderRange;
    FIntIntervalFontSize : Integer;
  published
    // Clear contents of group cells, only header of group is visible : bsCell, bsRow
    property ClearContents : Boolean read FBlnClearContents write FBlnClearContents;
    // Set Font and Border for the cell or the whole row of the grouped cell
    property BorderRange : TBorderRange read FBorderRange write FBorderRange;
    // Decrease font size for each subgroups (default 2)
    property IntervalFontSize : Integer read FIntIntervalFontSize write FIntIntervalFontSize;
  end;

  TOnExportEvent = procedure(Sender : TObject; IntRecordNumber : Integer) of object;
  // Old event which still exists for compatiblity reasons
  TOnGetCellBackgroundColorEvent = procedure(Sender : TObject;  Field: TField; var ColorBackground : TColor) of object;
  // New event which can change background and font color of cell
  TOnGetCellStyleEvent = procedure(Sender : TObject;  Field: TField; var ColorBackground : TColor; FontCell : TxlFont) of object;

  // Events for using this component without a TDataset, so when DataPipe type = dpCustom
  TOnGetFieldCount = procedure(Sender: TObject; var IntFieldCount : Integer) of object;
  TOnGetFieldName = procedure(Sender: TObject; const IntFieldIndex : Integer; var StrFieldName : String) of object;
  TOnGetFieldDisplayName = procedure(Sender: TObject; const IntFieldIndex: Integer; var StrFieldDisplayName : String) of object;
  TOnGetFieldDisplayWidth = procedure(Sender: TObject; const IntFieldIndex: Integer; var IntFieldDisplayWidth : Integer) of object;
  TOnGetFieldDataSize = procedure(Sender: TObject; const IntFieldIndex : Integer; var IntFieldDataSize : Integer) of object;
  TOnGetFieldDataType = procedure(Sender: TObject; const IntFieldIndex : Integer; var FieldDataType : TFieldType) of object;
  TOnGetFieldVisible = procedure(Sender: TObject; const IntFieldIndex : Integer; var BlnFieldVisible : Boolean) of object;
  TOnGetEOF = procedure(Sender: TObject; var BlnEOF: Boolean) of object;
  TOnGetFieldValue = procedure(Sender: TObject; const IntFieldIndex: Integer; var VarValue: Variant) of object;
  // The TOnGetCellStyleEvent event can be used when using a dataset, when DataPipe type = dpCustom,
  // then this TOnGetFieldCellStyleEvent event should be used
  TOnGetFieldCellStyleEvent = procedure(Sender : TObject; const IntFieldIndex: Integer; var ColorBackground : TColor; FontCell : TxlFont) of object;

  TscExcelExport = class(TComponent)
  private
    FDataset : TDataset;
    FIntRecordNo : integer;
    FIntBeginRowHeader : Integer;
    FIntBeginRowTitles : Integer;
    FIntBeginRowData : Integer;
    FIntBeginColumnData : Integer;
    FIntBeginColumnHeader : Integer;
    FIntBeginFooter : Integer;

    FBlnConnected : Boolean;
    FIntEndRowData : Integer;

    FExcelApplication : TExcelApplication;
    FExcelWorkbook : TExcelWorkbook;
    FExcelWorksheet : TExcelWorksheet;

    FSLFieldNames : TStrings;

    FBlnShowTitles : Boolean;
    FBlnExcelVisible : Boolean;
    FStrFilename : String;
    FStrWorksheetName : String;
    FIntColumnWidth : Integer;
    FStyleColumnWidth : TStyleColumnWidth;
    FConnectTo : TConnectTo;

    FFontHeader: TxlFont;
    FBorderHeader : TCellBorder;
    FSLHeaderText: TStrings;

    FFontTitles : TxlFont;
    FBorderTitles : TCellBorder;

    FFontData : TxlFont;
    FBorderData : TCellBorder;

    FFontSummary : TxlFont;
    FBorderSummary : TCellBorder;
    FSummarySelection : TSummarySelection;
    FSLSummaryFields : TStrings;
    FSummaryCalculation : TSummaryCalculation;

    FSLGroupFields : TStrings;
    FFontGroup : TxlFont;
    FBorderGroup : TCellBorder;
    FGroupOptions : TGroupOptions;

    FBorderFooter: TCellBorder;
    FSLFooterText: TStrings;
    FFontFooter: TxlFont;

    FIntBlockOfRecords : Integer;

    FStrBeginColumnDataChar : String;

    LCID : Integer;
    FVisibleFieldsOnly: Boolean;

    FOnExportRecords : TOnExportEvent;
    FOnGetCellBackgroundColorEvent : TOnGetCellBackgroundColorEvent;
    FOnGetCellStyleEvent: TOnGetCellStyleEvent;

    FDataPipe: TDataPipe;

    FOnGetFieldCount: TOnGetFieldCount;
    FOnGetFieldName: TOnGetFieldName;
    FOnGetFieldDisplayName: TOnGetFieldDisplayName;
    FOnGetFieldDisplayWidth: TOnGetFieldDisplayWidth;
    FOnGetFieldDataSize: TOnGetFieldDataSize;
    FOnGetFieldDataType: TOnGetFieldDataType;
    FOnGetFieldVisible: TOnGetFieldVisible;
    FOnGetEOF: TOnGetEOF;
    FOnGetFieldValue: TOnGetFieldValue;
    FOnGotoFirstRecord : TNotifyEvent;
    FOnGotoNextRecord : TNotifyEvent;
    FOnGetFieldCellStyleEvent: TOnGetFieldCellStyleEvent;

    FDecimalSeparator : Char;
    FThousandSeparator : Char;
    FIntExcelVersion: Integer;
  protected
    procedure SetFontHeader(const Value: TxlFont);
    procedure SetHeaderText(const Value: TStrings);
    procedure SetFontTitles(Value : TxlFont);
    procedure SetFontData(Value : TxlFont);
    procedure SetFontSummary(Value : TxlFont);
    procedure SetSummaryFields(Value : TStrings);
    procedure SetVisibleFieldsOnly(const Value: Boolean);
    procedure SetBeginRowHeader(const Value: Integer);
    procedure SetBeginRowTitles(const Value: Integer);
    procedure SetBeginRowData(const Value: Integer);
    procedure SetBeginColumnData(const Value: Integer);
    procedure SetBeginColumnHeader(const Value: Integer);
    procedure SetFontGroup(const Value: TxlFont);
    procedure SetGroupFields(const Value: TStrings);
    procedure SetFontFooter(const Value: TxlFont);
    procedure SetFooterText(const Value: TStrings);
    procedure SetShowTitles(const Value: Boolean);
    function GetExcelVersion: Integer;

    procedure SetColumnWidth;
    function SetNumberSeparator(const StrFormat: string): string;
    procedure SetFormat(const IntBeginRow, IntEndRow : Integer);
    procedure InitFormatNumbers;

    function CanConvertFieldToCell(const IntFieldIndex: Integer) : Boolean;
    function IsValueField(const IntFieldIndex: Integer) : Boolean;
    function IsMemoField(const IntFieldIndex: Integer) : Boolean;
    function GetWidthFromDatasize(const IntFieldIndex: Integer) : Integer;
    function GetFieldDataType(IntIndex : Integer): TFieldType;
    function IsEOF : Boolean;
    function GetNameOfWorksheet : String;
    function GetRegistryExcelVersion: integer;

    procedure ExportHeader;
    procedure ExportTitles;
    procedure ExportFieldData;
    procedure ExportSummary;
    procedure ExportGroup;
    procedure ExportFooter;

    property FieldDataType[Index: Integer]: TFieldType read GetFieldDataType;
  public
    constructor Create(Owner: TComponent); override;
    destructor Destroy; override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;

    // READ-ONLY PROPERTIES
    //---------------------
    // Example how to add extra information after exportdataset
    // scExcelExport1.ExcelWorkSheet.Range[Format('A%d',[scExcelExport1.EndRowData+3]),
    //   Format('A%d',[scExcelExport1.EndRowData+3])].Value
    //   := 'Adding extra information to Excel worksheet';
    // Line number of last row of data is filled in after the export
    property EndRowData : Integer read FIntEndRowData;
    // Link to the Excel worksheet, can be used to add extra data after the export
    property ExcelWorkSheet : TExcelWorksheet read FExcelWorksheet write FExcelWorksheet;
    // Check if there is already a connection with Excel
    property Connected : Boolean read FBlnConnected;
    // Excel version 8=97 9=2000 10=2002, 11=2003
    property ExcelVersion : Integer read GetExcelVersion;

    // METHODS
    //--------
    // Connect to excel and export dataset
    procedure ExportDataset; virtual;
    // After exporting dataset, save it to a file
    procedure SaveAs(const StrFileName : String; const FileFormat : TFileFormat); virtual;
    // After exporting dataset, show print preview of Excel
    procedure PrintPreview(const BlnPrintGridLines : Boolean); virtual;
    // Can be used to connect to Excel to so worksheet can be used
    // before exporting data. ExportDataset will call this procedure when
    // there is not connection yet
    procedure Connect;
    // Disconnect after using Excel !
    procedure Disconnect; virtual;

    // Load default properties
    procedure LoadDefaultProperties;
    // For testing purposes, close all active Excel applications
    procedure CloseAllExcelApps;
    // These internal functions are made public to use them after exporting
    // Use the property ExcelWorkSheet to access te excel worksheet
    function GetIndexOfWorksheet(const StrWorksheetName: String): Integer;
    function GetColumnCharacters(IntNumber : Integer) : String;
    procedure SetFontAndBorderRange(DelphiFont : TxlFont; Border : TCellBorder; StrBeginCell, StrEndCell : String);
  published
    // MOST IMPORTANT PROPERTIES
    //--------------------------
    // Show or hide excel (default True)
    property ExcelVisible : Boolean read FBlnExcelVisible write FBlnExcelVisible default True;
    // New instance of Excel application, new workbook or new worksheet (default is new instance of Excel)
    property ConnectTo : TConnectTo read FConnectTo write FConnectTo default ctNewExcel;
    // Use a TDataset given by the Dataset property
    // or use the events when using another database object
    property DataPipe: TDataPipe read FDataPipe write FDataPipe;
    // Existing XLS file
    property Filename : string read FStrFilename write FStrFilename;
    // Name of new or existing worksheet
    property WorksheetName : String read FStrWorksheetName write FStrWorksheetName;
    // Dataset which will be exported (TTable, TQuery, TClientDataset, TADODataset, ...)
    property Dataset : TDataset read FDataset write FDataset;

    // Style of columnswidth : Excel default, width of property ColumnWidth, AutoFit
    property StyleColumnWidth : TStyleColumnWidth read FStyleColumnWidth write FStyleColumnWidth;
    property ColumnWidth : Integer read FIntColumnWidth write FIntColumnWidth;

    // Export only visible fields or all fields
    property VisibleFieldsOnly : Boolean read FVisibleFieldsOnly write SetVisibleFieldsOnly default True;

    // HEADER
    //-------
    // Font and border of header
    // Fill in header texts
    property FontHeader: TxlFont read FFontHeader write SetFontHeader;
    property HeaderText: TStrings read FSLHeaderText write SetHeaderText;
    property BorderHeader : TCellBorder read FBorderHeader write FBorderHeader;

    // TITELS
    //-------
    // Font and border of titles
    property ShowTitles : Boolean read FBlnShowTitles write SetShowTitles default True;
    property FontTitles : TxlFont read FFontTitles write SetFontTitles;
    property BorderTitles : TCellBorder read FBorderTitles write FBorderTitles;

    // DATA
    //-----
    // Font and border of data
    property FontData : TxlFont read FFontData write SetFontData;
    property BorderData : TCellBorder read FBorderData write FBorderData;

    // SUMMARY
    //--------
    // Font and border of summary
    property FontSummary : TxlFont read FFontSummary write SetFontSummary;
    property BorderSummary : TCellBorder read FBorderSummary write FBorderSummary;
    // Which fields will be summerized : all numeric fields, the fields of SummaryFields, none
    property SummarySelection : TSummarySelection read FSummarySelection write FSummarySelection;
    property SummaryFields : TStrings read FSLSummaryFields write SetSummaryFields;
    // Calculation : SUM, MIN, MAX
    property SummaryCalculation : TSummaryCalculation read FSummaryCalculation write FSummaryCalculation;

    // FOOTER
    //-------
    // Font and border of footer
    // Fill in footer texts
    property FontFooter: TxlFont read FFontFooter write SetFontFooter;
    property FooterText: TStrings read FSLFooterText write SetFooterText;
    property BorderFooter : TCellBorder read FBorderFooter write FBorderFooter;

    // GROUP
    //------
    // Grouping fields, font and border of group
    // Make sure data is sorted on group fields !
    property GroupFields: TStrings read FSLGroupFields write SetGroupFields;
    property FontGroup : TxlFont read FFontGroup write SetFontGroup;
    property BorderGroup : TCellBorder read FBorderGroup write FBorderGroup;
    property GroupOptions : TGroupOptions read FGroupOptions write FGroupOptions;

    // Number of records which will be exported in one variant matrix (default 20)
    // Try to increase and decrease this property for the optimal speed
    property BlockOfRecords : Integer read FIntBlockOfRecords write FIntBlockOfRecords default 20;

    // Begin row of titles and data
    property BeginRowHeader : Integer read FIntBeginRowHeader write SetBeginRowHeader default 1;
    property BeginRowTitles : Integer read FIntBeginRowTitles write SetBeginRowTitles default 1;
    property BeginRowData : Integer read FIntBeginRowData write SetBeginRowData default 2;

    // Begin column header and data/titles
    property BeginColumnHeader : Integer read FIntBeginColumnHeader write SetBeginColumnHeader default 1;
    property BeginColumnData : Integer read FIntBeginColumnData write SetBeginColumnData default 1;

    // EVENTS
    //-------
    // Event which is triggered after each export of a record
    property OnExportRecords : TOnExportEvent read FOnExportRecords write FOnExportRecords;
    // Event which is triggered for each field and record. It can be used to change the background color
    // the cell. This event still exists because of compatibility reasons. Do not use it anymore,
    // instead use the new OnGetCellStyleEvent event.
    property OnGetCellBackgroundColorEvent : TOnGetCellBackgroundColorEvent read FOnGetCellBackgroundColorEvent write FOnGetCellBackgroundColorEvent;
    // Event which is triggered for each field and record. It can be used to change the background color
    // or font color, name, size or bold style of the cell. All other properties of the TxlFont class
    // are not implemented yet. This event only works when using a TDataset.
    // Be aware that this slows down the export of data because individual cells in
    // the worksheet have to be accessed
    property OnGetCellStyleEvent : TOnGetCellStyleEvent read FOnGetCellStyleEvent write FOnGetCellStyleEvent;

    // Events for using this component without a TDataset, so when DataPipe type = dpCustom
    property OnGetFieldCount: TOnGetFieldCount read FOnGetFieldCount write FOnGetFieldCount;
    property OnGetFieldName: TOnGetFieldName read FOnGetFieldName write FOnGetFieldName;
    property OnGetFieldDisplayName: TOnGetFieldDisplayName read FOnGetFieldDisplayName write FOnGetFieldDisplayName;
    property OnGetFieldDisplayWidth: TOnGetFieldDisplayWidth read FOnGetFieldDisplayWidth write FOnGetFieldDisplayWidth;
    property OnGetFieldDataSize: TOnGetFieldDataSize read FOnGetFieldDataSize write FOnGetFieldDataSize;
    property OnGetFieldDataType: TOnGetFieldDataType read FOnGetFieldDataType write FOnGetFieldDataType;
    property OnGetFieldVisible: TOnGetFieldVisible read FOnGetFieldVisible write FOnGetFieldVisible;
    property OnGetEOF: TOnGetEOF read FOnGetEOF write FOnGetEOF;
    property OnGetFieldValue: TOnGetFieldValue read FOnGetFieldValue write FOnGetFieldValue;
    property OnGotoFirstRecord : TNotifyEvent read FOnGotoFirstRecord write FOnGotoFirstRecord;
    property OnGotoNextRecord : TNotifyEvent read FOnGotoNextRecord write FOnGotoNextRecord;
    property OnGetFieldCellStyleEvent : TOnGetFieldCellStyleEvent read FOnGetFieldCellStyleEvent write FOnGetFieldCellStyleEvent;
  end;

resourcestring
  rsFileDoesNotExist = 'File %s does not exist';
  rsNoActiveWorkbookOrExcel = 'No active workbook or no active Excel available';
  rsNoDatasetConnected = 'No dataset is connected';
  rsDatasetNotActive = 'Dataset is not active';

implementation

uses ComObj; {, ActiveX;}

type
  TOleEnum = type Integer; // Copied from ActiveX unit

//==============================================================================
// Create, destroy and initialize
//==============================================================================
constructor TscExcelExport.Create(Owner: TComponent);
begin
  inherited;
  FFontHeader := TxlFont.Create;
  FFontTitles := TxlFont.Create;
  FFontData := TxlFont.Create;
  FFontSummary := TxlFont.Create;
  FFontGroup := TxlFont.Create;
  FFontFooter := TxlFont.Create;

  FBorderHeader := TCellBorder.Create;
  FBorderTitles := TCellBorder.Create;
  FBorderData := TCellBorder.Create;
  FBorderSummary := TCellBorder.Create;
  FBorderGroup := TCellBorder.Create;
  FBorderFooter := TCellBorder.Create;

  FExcelApplication := TExcelApplication.Create(Self);
  FExcelWorkbook := TExcelWorkbook.Create(Self);
  FExcelWorksheet := TExcelWorksheet.Create(Self);

  FSLHeaderText := TStringList.Create;
  FSLFooterText := TStringList.Create;
  FSLSummaryFields:=TStringList.Create;
  FSLGroupFields:=TStringList.Create;

  FGroupOptions:=TGroupOptions.Create;

  FSLFieldNames:=TStringList.Create;

  FDataPipe := dpDataSet;

  FBlnConnected := False;

  LoadDefaultProperties;
  InitFormatNumbers;
end;

//------------------------------------------------------------------------------
destructor TscExcelExport.Destroy;
begin
  FSLHeaderText.Free;
  FSLFooterText.Free;

  FFontHeader.Free;
  FFontTitles.Free;
  FFontData.Free;
  FFontSummary.Free;
  FFontGroup.Free;
  FFontFooter.Free;

  FBorderHeader.Free;
  FBorderTitles.Free;
  FBorderData.Free;
  FBorderSummary.Free;
  FBorderGroup.Free;
  FBorderFooter.Free;

  FGroupOptions.Free;

  FExcelWorksheet.Free;
  FExcelWorkbook.Free;
  FExcelApplication.Free;

  FSLFieldNames.Free;
  FSLSummaryFields.Free;
  FSLGroupFields.Free;

  inherited;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.LoadDefaultProperties;
begin
  FBorderTitles.FBackColor := clWhite;
  FBorderTitles.FBorderColor := clBlack;
  FBorderTitles.FBorderWeight := bwMedium;
  FBorderTitles.FBorderLineStyle := blNone;

  FBorderHeader.FBackColor := clWhite;
  FBorderHeader.FBorderColor := clBlack;
  FBorderHeader.FBorderWeight := bwMedium;
  FBorderHeader.FBorderLineStyle := blNone;

  FBorderData.FBackColor := clWhite;
  FBorderData.FBorderColor := clBlack;
  FBorderData.FBorderWeight := bwMedium;
  FBorderData.FBorderLineStyle := blNone;

  FBorderSummary.FBackColor := clWhite;
  FBorderSummary.FBorderColor := clBlack;
  FBorderSummary.FBorderWeight := bwMedium;
  FBorderSummary.FBorderLineStyle := blNone;

  FBorderGroup.FBackColor := clWhite;
  FBorderGroup.FBorderColor := clBlack;
  FBorderGroup.FBorderWeight := bwMedium;
  FBorderGroup.FBorderLineStyle := blNone;

  FBorderFooter.FBackColor := clWhite;
  FBorderFooter.FBorderColor := clBlack;
  FBorderFooter.FBorderWeight := bwMedium;
  FBorderFooter.FBorderLineStyle := blNone;

  FFontHeader.FAlignment := haGeneral;
  FFontHeader.Name := 'MS Sans Serif';
  FFontHeader.Size := 8;
  FFontHeader.Color := clWindowText;
  FFontHeader.Orientation := 0;
  FFontHeader.Style := [];
  FFontHeader.WrapText := False;

  FFontData.FAlignment := haGeneral;
  FFontData.Name := 'MS Sans Serif';
  FFontData.Size := 8;
  FFontData.Color := clWindowText;
  FFontData.Orientation := 0;
  FFontData.Style := [];
  FFontData.WrapText := False;

  FFontSummary.FAlignment := haGeneral;
  FFontSummary.Name := 'MS Sans Serif';
  FFontSummary.Size := 8;
  FFontSummary.Color := clWindowText;
  FFontSummary.Orientation := 0;
  FFontSummary.Style := [];
  FFontSummary.WrapText := False;

  FFontTitles.FAlignment := haGeneral;
  FFontTitles.Name := 'MS Sans Serif';
  FFontTitles.Size := 8;
  FFontTitles.Color := clWindowText;
  FFontTitles.Orientation := 0;
  FFontTitles.Style := [];
  FFontTitles.WrapText := False;

  FFontGroup.FAlignment := haGeneral;
  FFontGroup.Name := 'MS Sans Serif';
  FFontGroup.Size := 8;
  FFontGroup.Color := clWindowText;
  FFontGroup.Orientation := 0;
  FFontGroup.Style := [];
  FFontGroup.WrapText := False;

  FFontFooter.FAlignment := haGeneral;
  FFontFooter.Name := 'MS Sans Serif';
  FFontFooter.Size := 8;
  FFontFooter.Color := clWindowText;
  FFontFooter.Orientation := 0;
  FFontFooter.Style := [];
  FFontFooter.WrapText := False;

  FGroupOptions.FBlnClearContents := True;
  FGroupOptions.FBorderRange := bsRow;
  FGroupOptions.FIntIntervalFontSize := 2;

  FBlnExcelVisible := True;
  FConnectTo := ctNewExcel;
  FStrFilename := '';  
  FStrWorksheetName := '';
  FStyleColumnWidth := cwDefault;
  FVisibleFieldsOnly := True;
  FBlnShowTitles := True;
  FIntColumnWidth := 0;
  FIntBlockOfRecords := 20;
  FIntBeginRowHeader := 1;
  FIntBeginRowTitles := 1;
  FIntBeginRowData := 2;
  FIntBeginColumnHeader := 1;
  FIntBeginColumnData := 1;
  FSummaryCalculation := scSUM;
  FSummarySelection := ssNone;

  FSLHeaderText.Text := '';
  FSLFooterText.Text := '';
  FSLSummaryFields.Text := '';
  FSLGroupFields.Text := '';
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.Notification(AComponent: TComponent;
  Operation: TOperation);
begin
  inherited;
  if (Operation = opRemove) and (Assigned(FDataset)) and (AComponent = FDataset) then
  begin
    FDataset := nil;
  end;
end;

//==============================================================================
// Set of properties
//==============================================================================
procedure TscExcelExport.SetHeaderText(const Value: TStrings);
begin
  FSLHeaderText.Assign(Value);

  if FSLHeaderText.Count = 0 then
    FIntBeginRowHeader := 1;

  if FIntBeginRowTitles < FIntBeginRowHeader + FSLHeaderText.Count then
    SetBeginRowTitles(FIntBeginRowHeader + FSLHeaderText.Count);
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetFooterText(const Value: TStrings);
begin
  FSLFooterText.Assign(Value);
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetFontHeader(const Value: TxlFont);
begin
  FFontHeader.Assign(Value);
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetFontTitles(Value : TxlFont);
begin
  FFontTitles.Assign(Value);
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetFontData(Value : TxlFont);
begin
  FFontData.Assign(Value);
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetFontSummary(Value : TxlFont);
begin
  FFontSummary.Assign(Value);
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetFontFooter(const Value: TxlFont);
begin
  FFontFooter.Assign(Value);
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetSummaryFields(Value : TStrings);
begin
  FSLSummaryFields.Assign(Value);
  FSLSummaryFields.Text := UpperCase(FSLSummaryFields.Text);
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetFontGroup(const Value: TxlFont);
begin
  FFontGroup.Assign(Value);
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetGroupFields(const Value: TStrings);
begin
  FSLGroupFields.Assign(Value);
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetVisibleFieldsOnly(const Value: Boolean);
begin
  FVisibleFieldsOnly := Value;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetBeginRowHeader(const Value: Integer);
begin
  if FSLHeaderText.Count > 0 then
  begin
    if Value > 0 then
      FIntBeginRowHeader := Value
    else
      FIntBeginRowHeader := 1;

    if FIntBeginRowTitles < FIntBeginRowHeader + FSLHeaderText.Count - 1 then
      SetBeginRowTitles(FIntBeginRowHeader + FSLHeaderText.Count);
  end
  else
    FIntBeginRowHeader := 1;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetBeginRowTitles(const Value: Integer);
begin
  if Value < FIntBeginRowHeader + FSLHeaderText.Count then
    FIntBeginRowTitles := FIntBeginRowHeader + FSLHeaderText.Count
  else
    FIntBeginRowTitles := Value;

  if FIntBeginRowTitles >= FIntBeginRowData then
     SetBeginRowData(FIntBeginRowTitles + 1);
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetBeginRowData(const Value: Integer);
begin
  if Value < FIntBeginRowTitles then
    FIntBeginRowData := FIntBeginRowTitles;
  if (Value = FIntBeginRowTitles) and FBlnShowTitles then
    Inc(FIntBeginRowData)
  else
    FIntBeginRowData := Value;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetBeginColumnData(const Value: Integer);
begin
  if Value < 1 then
    FIntBeginColumnData := 1
  else
    FIntBeginColumnData := Value;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetBeginColumnHeader(const Value: Integer);
begin
  if Value < 1 then
    FIntBeginColumnHeader := 1
  else
    FIntBeginColumnHeader := Value;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetShowTitles(const Value: Boolean);
begin
  FBlnShowTitles := Value;
  if (FIntBeginRowData = FIntBeginRowTitles) and Value then
    Inc (FIntBeginRowData);
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetFontAndBorderRange(DelphiFont : TxlFont; Border : TCellBorder; StrBeginCell, StrEndCell : String);
const
  vAlignment : array[THAlignment] of XlHAlign =
    (xlHAlignGeneral, xlHAlignLeft, xlHAlignRight, xlHAlignCenter);

  //Value to Excel constants of Border weight...
  vBorderWeight  : array [TBorderWeight] of XlBorderWeight =
    (xlHairline,xlMedium,xlThick,xlThin);
  {
  xlHairline = $00000001;
  xlMedium = $FFFFEFD6;
  xlThick = $00000004;
  xlThin = $00000002;
  }

  //Value to Excel constants of Border line style...
  vBorderLineStyle: array [TBorderLineStyle] of XlLineStyle =
    (xlContinuous,xlDash,xlDashDot,xlDashDotDot,
     xlDot,xlDouble,xlSlantDashDot,xlContinuous,xlLineStyleNone);
  {
  xlContinuous = $00000001;
  xlDash = $FFFFEFED;
  xlDashDot = $00000004;
  xlDashDotDot = $00000005;
  xlDot = $FFFFEFEA;
  xlDouble = $FFFFEFE9;
  xlSlantDashDot = $0000000D;
  xlLineStyleNone = $FFFFEFD2;
  }

begin
  // Convert Delphi font to the Excel font
  with FExcelWorksheet.Range[StrBeginCell, StrEndCell].Font do
  begin
    Name := DelphiFont.Name;
    Size := DelphiFont.Size;
    Color := DelphiFont.Color;
    Bold :=  fsBold in DelphiFont.Style;
    Italic := fsItalic in DelphiFont.Style;
    Underline := fsUnderline in DelphiFont.Style;
  end;

  if Border.FBackColor <> clWhite then
    FExcelWorksheet.Range[StrBeginCell, StrEndCell].Interior.Color := Border.FBackColor;

  if Border.LineStyle <> blNone then
  begin
    with FExcelWorksheet.Range[StrBeginCell, StrEndCell] do
    begin
      try
        {
        xlInsideHorizontal = $0000000C;
        xlInsideVertical = $0000000B;
        xlDiagonalDown = $00000005;
        xlDiagonalUp = $00000006;
        xlEdgeBottom = $00000009;
        xlEdgeLeft = $00000007;
        xlEdgeRight = $0000000A;
        xlEdgeTop = $00000008;
        }

        // All border have to set separately
        // Top border, bottom border, left border...
        Borders[xlEdgeTop].LineStyle := vBorderLineStyle[Border.LineStyle];
        Borders[xlEdgeTop].Weight := vBorderWeight[Border.Weight];
        {$IFNDEF DELPHI5}
        Borders[xlEdgeTop].Color := Border.BorderColor;
        {$ENDIF}

        Borders[xlEdgeRight].LineStyle := vBorderLineStyle[Border.LineStyle];
        Borders[xlEdgeRight].Weight := vBorderWeight[Border.Weight];
        {$IFNDEF DELPHI5}
        Borders[xlEdgeRight].Color := Border.BorderColor;
        {$ENDIF}

        Borders[xlEdgeLeft].LineStyle := vBorderLineStyle[Border.LineStyle];
        Borders[xlEdgeLeft].Weight := vBorderWeight[Border.Weight];
        {$IFNDEF DELPHI5}
        Borders[xlEdgeLeft].Color := Border.BorderColor;
        {$ENDIF}

        Borders[xlEdgeBottom].LineStyle := vBorderLineStyle[Border.LineStyle];
        Borders[xlEdgeBottom].Weight := vBorderWeight[Border.Weight];
        {$IFNDEF DELPHI5}
        Borders[xlEdgeBottom].Color := Border.BorderColor;
        {$ENDIF}
      except
      end;
    end;
  end;

  FExcelWorksheet.Range[StrBeginCell, StrEndCell].Orientation:=DelphiFont.Orientation;
  FExcelWorksheet.Range[StrBeginCell, StrEndCell].WrapText := DelphiFont.WrapText;
  FExcelWorksheet.Range[StrBeginCell, StrEndCell].HorizontalAlignment := TOleEnum(vAlignment[DelphiFont.Alignment]);
end;

//==============================================================================
// Internal functions and procedures
//==============================================================================
procedure TscExcelExport.SetColumnWidth;
begin
  if FStyleColumnWidth = cwOwnerWidth then
    FExcelWorksheet.Range['A1',GetColumnCharacters(FSLFieldNames.Count)+'1'].ColumnWidth:=FIntColumnWidth
  else
    if FStyleColumnWidth = cwAutoFit then
      FExcelWorksheet.Range['A1',GetColumnCharacters(FSLFieldNames.Count)+'1'].EntireColumn.Autofit;
    // else cwFieldDisplayWidth, cwFieldDataSize and cwEnhAutoFit are set in ExportTitles
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.InitFormatNumbers;
var
  DefaultLCID: Integer;
begin
{$WARNINGS OFF}
  DefaultLCID := GetThreadLocale;
  FDecimalSeparator   := GetLocaleChar(DefaultLCID, LOCALE_SDECIMAL, DecimalSeparator);
  FThousandSeparator  := GetLocaleChar(DefaultLCID, LOCALE_STHOUSAND, ThousandSeparator);
{$WARNINGS ON}
end;

//------------------------------------------------------------------------------
function TscExcelExport.SetNumberSeparator(const StrFormat: string): string;
var
  i : integer;
begin
  // Replace international separator used into delphi with local separator
  Result := StrFormat;

  // Don't use StrReplace because the separator may be the same!
  for i := 1 to Length(StrFormat) do
  begin
    if Result[i] = '.' then
      Result[i] := FDecimalSeparator
    else
      if Result[i] = ',' then
        Result[i] := FThousandSeparator;
  end;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SetFormat(const IntBeginRow, IntEndRow : Integer);
var
  IntColumn : Integer;
  StrBeginCell, StrEndCell : String;

  function GetCurrencyFormat(StrFormat : String) : String;
  begin
    // Depending regional settings, place currencystring (which is
    // also a regional setting). The format already
    // contains the number of decimals of the regional currency setting.
    case CurrencyFormat of
      0 : Result := CurrencyString+StrFormat;
      1 : Result := StrFormat+CurrencyString;
      2 : Result := CurrencyString+' '+StrFormat;
      3 : Result := StrFormat+' '+CurrencyString;
    end;
  end;

  function GetDateTimeFormat(StrFormat : String) : String;
  begin
    // Depending regional settings of Excel, change the displayformat
    // of Delphi to the one of Excel
    StrFormat := StringReplace(StrFormat,'h',FExcelApplication.Application.International[xlHourCode,LCID],[rfReplaceAll, rfIgnoreCase]);
    StrFormat := StringReplace(StrFormat,'n',FExcelApplication.Application.International[xlMinuteCode,LCID],[rfReplaceAll, rfIgnoreCase]);
    StrFormat := StringReplace(StrFormat,'s',FExcelApplication.Application.International[xlSecondCode,LCID],[rfReplaceAll, rfIgnoreCase]);
    StrFormat := StringReplace(StrFormat,DateSeparator,FExcelApplication.Application.International[xlDateSeparator,LCID],[rfReplaceAll, rfIgnoreCase]);
    StrFormat := StringReplace(StrFormat,TimeSeparator,FExcelApplication.Application.International[xlTimeSeparator,LCID],[rfReplaceAll, rfIgnoreCase]);
    StrFormat := StringReplace(StrFormat,'y',FExcelApplication.Application.International[xlYearCode,LCID],[rfReplaceAll, rfIgnoreCase]);
    StrFormat := StringReplace(StrFormat,'m',FExcelApplication.Application.International[xlMonthCode,LCID],[rfReplaceAll, rfIgnoreCase]);
    StrFormat := StringReplace(StrFormat,'d',FExcelApplication.Application.International[xlDayCode,LCID],[rfReplaceAll, rfIgnoreCase]);
    Result := StrFormat;
  end;

begin
  for IntColumn := 1 to FSLFieldNames.Count do
  begin
    StrBeginCell := GetColumnCharacters(IntColumn+BeginColumnData-1)+IntToStr(IntBeginRow); //FIntBeginRowData);
    // Formatting of cells is done before exporting, because number of records is not
    // known yet and it can differ when using grouping, summaries, ... we use a
    // fixed number 9999
    StrEndCell := GetColumnCharacters(IntColumn+BeginColumnData-1)+IntToStr(IntEndRow); //9999);

    if DataPipe = dpDataSet then
    begin
      with DataSet do
      begin
        // String fields
        if FieldByName(FSLFieldNames[IntColumn-1]) is TStringField then
        begin
          //other cases automatic 'general'
          FExcelWorksheet.Range[StrBeginCell,StrEndCell].NumberFormat := '@';
        end
        else
        begin
          // Numeric fields : integer, float, currency, ...
          if FieldByName(FSLFieldNames[IntColumn-1]) is TNumericField then
          begin
            if TNumericField(FieldByName(FSLFieldNames[IntColumn-1])).DisplayFormat <> '' then
            begin
              try
                FExcelWorksheet.Range[StrBeginCell,StrEndCell].NumberFormat :=
                  SetNumberSeparator(TNumericField(FieldByName(FSLFieldNames[IntColumn-1])).DisplayFormat);
              except
                // Special for regional setting of some countries
                if GetFieldDataType(FieldByName(FSLFieldNames[IntColumn-1]).Index) in [ftFloat, ftCurrency, ftBCD
                  {$IFNDEF DELPHI5}, ftFMTBcd {$ENDIF}] then
                  FExcelWorksheet.Range[StrBeginCell,StrEndCell].NumberFormat := '0'+FDecimalSeparator+'00'
                else
                  FExcelWorksheet.Range[StrBeginCell,StrEndCell].NumberFormat := '0';
              end;
            end
            else
            begin
              // When it is a currencyfield without displayformat,
              // create a kind of currency format depending regional settings
              if FieldByName(FSLFieldNames[IntColumn-1]) is TCurrencyField then
              begin
                FExcelWorksheet.Range[StrBeginCell,StrEndCell].NumberFormat :=
                  GetCurrencyFormat(SetNumberSeparator('#,##0.'+StringOfChar('0',CurrencyDecimals)));
              end;
            end;
          end
          else
          begin
            if FieldByName(FSLFieldNames[IntColumn-1]) is TDateTimeField then
            begin
              if TDateTimeField(FieldByName(FSLFieldNames[IntColumn-1])).DisplayFormat <> '' then
              begin
                FExcelWorksheet.Range[StrBeginCell,StrEndCell].NumberFormat :=
                  GetDateTimeFormat(TDateTimeField(FieldByName(FSLFieldNames[IntColumn-1])).DisplayFormat);
              end;
            end;
          end;
        end;
      end;
    end
    else
      if GetFieldDataType(IntColumn-1) = ftString then
        FExcelWorksheet.Range[StrBeginCell,StrEndCell].NumberFormat := '@'; //other cases automatic 'general'
  end;
end;

//------------------------------------------------------------------------------
function TscExcelExport.CanConvertFieldToCell(const IntFieldIndex: Integer) : Boolean;
begin
  Result := FieldDataType[IntFieldIndex] in
    [ftString, ftSmallint, ftInteger, ftWord, ftAutoInc,
    ftBoolean, ftFloat, ftCurrency, ftBCD, {$IFNDEF DELPHI5} ftFMTBcd, {$ENDIF} ftDate, ftTime, ftDateTime,
    {$IFNDEF DELPHI5} ftTimeStamp, {$ENDIF}
    ftLargeInt, ftWideString, ftVariant, ftMemo, ftOraClob, ftFmtMemo];
end;

//------------------------------------------------------------------------------
function TscExcelExport.IsMemoField(const IntFieldIndex: Integer) : Boolean;
begin
  Result := FieldDataType[IntFieldIndex] in
    [ftMemo, ftOraClob, ftFmtMemo];
end;

//------------------------------------------------------------------------------
function TscExcelExport.IsValueField(const IntFieldIndex: Integer) : Boolean;
begin
  Result := FieldDataType[IntFieldIndex] in
    [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD {$IFNDEF DELPHI5}, ftFMTBcd {$ENDIF}];
end;

//------------------------------------------------------------------------------
function TscExcelExport.GetFieldDataType(IntIndex : Integer): TFieldType;
begin
  Result := ftUnknown;
  if DataPipe = dpDataSet then
    Result := DataSet.Fields[IntIndex].DataType
  else
    if Assigned(FOnGetFieldDataType) then
      FOnGetFieldDataType(Self, IntIndex, Result);
end;

//------------------------------------------------------------------------------
function TscExcelExport.IsEOF : Boolean;
begin
  Result := True;
  if FDataPipe = dpDataSet then
    Result := DataSet.Eof
  else
    if Assigned(FOnGetEOF) then
      FOnGetEOF(Self, Result);
end;

//------------------------------------------------------------------------------
function TscExcelExport.GetWidthFromDatasize(const IntFieldIndex: Integer) : Integer;
var
  IntFieldSize : Integer;
begin
  IntFieldSize := 10;
  if FDataPipe = dpDataSet then
    IntFieldSize := DataSet.Fields[IntFieldIndex].DataSize
  else
    // Trigger event to get datasize
    if Assigned(FOnGetFieldDataSize) then
      FOnGetFieldDataSize(Self, IntFieldIndex, IntFieldSize);

  // Datasize for datetime is to small when also time is saved
  if FieldDataType[IntFieldIndex] = ftDateTime then
    Result := 16
  else
   // For all other fieldtypes, just use the datasize
   // Datasize = amount of memory to store value
   Result := IntFieldSize;
end;

//------------------------------------------------------------------------------
// Get Column-character for giving index
//------------------------------------------------------------------------------
function TscExcelExport.GetColumnCharacters(IntNumber : Integer) : String;
begin
  if IntNumber < 1 then
    Result:='A'
  else
  begin
    if IntNumber > 256 then
      Result:='IV'
    else
    begin
      if IntNumber > 26 then
      begin
        if (IntNumber mod 26)=0 then
         Result:=Chr(64 + (IntNumber div 26)-1)
        else
          Result:=Chr(64 + (IntNumber div 26));
        if (IntNumber mod 26)=0 then
          Result:=Result + Chr(64+26)
        else
          Result:=Result + Chr(64 + (IntNumber mod 26));
      end
      else
        Result:=Chr(64 + IntNumber);
    end;
  end;
end;

//------------------------------------------------------------------------------
function TscExcelExport.GetNameOfWorksheet : String;
begin
  Result := '';

  // If property worksheetname is not filled in
  // Worksheet will have name of dataset
  if FStrWorksheetName <> '' then
    Result := FStrWorksheetName
  else
    if FDataPipe = dpDataSet then
      Result := FDataset.Name;
end;

//------------------------------------------------------------------------------
function TscExcelExport.GetIndexOfWorksheet(const StrWorksheetName : String) : Integer;
var
  i : Integer;
begin
  Result := -1;
  i := 1;
  while (i <= FExcelWorkbook.Worksheets.Count) and (Result = -1) do
  begin
    if (FExcelWorkbook.Worksheets[i] as _Worksheet).Name = StrWorksheetName then
      Result := i;
    Inc(i);
  end;
end;

//==============================================================================
// Public methods and internal exporting routines
//==============================================================================
procedure TscExcelExport.Connect;
var
  IntIndex : Integer;
  StrWorksheetName : String;
begin
  if FBlnConnected then
    Exit;

  LCID := LOCALE_USER_DEFAULT; //GetUserDefaultLCID;

  // Try to connect to Excel
  try
    IntIndex := -1;
    // Worksheet name is given name or name of dataset
    StrWorksheetName := GetNameOfWorksheet;

    // ctNewExcel = start new excel and open given filename or open new workbook
    if FConnectTo = ctNewExcel then
    begin
      FExcelApplication.ConnectKind := ckNewInstance;
      FExcelApplication.Connect;
      if Trim(FStrFilename) <> '' then
      begin
        if not FileExists(FStrFilename) then
        begin
          raise EFileNotExists.Create(Format(rsFileDoesNotExist,[FStrFilename]));
          Exit;
        end;

        // Filename is given, so open workbook
        FExcelWorkbook.ConnectTo(FExcelApplication.Workbooks.Open(FStrFilename, EmptyParam, EmptyParam,
          EmptyParam, EmptyParam, EmptyParam,
          EmptyParam, EmptyParam, EmptyParam,
          EmptyParam, EmptyParam, EmptyParam,
          EmptyParam, LCID));

        // Check if worksheetname already exists in workbook
        IntIndex := GetIndexOfWorksheet(StrWorksheetName);

        // Create new worksheet if worksheetname does not exist
        // If it exists, activate this worksheet
        if IntIndex = -1 then
          FExcelWorksheet.ConnectTo(FExcelWorkbook.Worksheets.Add(EmptyParam, EmptyParam, 1, TOleEnum(xlWBATWorksheet), LCID) as _Worksheet)
        else
          FExcelWorksheet.ConnectTo(FExcelWorkbook.Worksheets[IntIndex] as _Worksheet);
      end
      else
      begin
        FExcelWorkbook.ConnectTo(FExcelApplication.Workbooks.Add(TOleEnum(xlWBATWorksheet), LCID));
        FExcelWorksheet.ConnectTo(FExcelWorkbook.Worksheets[1] as _Worksheet);
      end;
    end
    else
    begin
      // ctNewWorkbook = add new workbook to active excel
      if FConnectTo = ctNewWorkbook then
      begin
        FExcelApplication.ConnectKind := ckRunningOrNew;
        FExcelApplication.Connect;
        FExcelWorkbook.ConnectTo(FExcelApplication.Workbooks.Add(TOleEnum(xlWBATWorksheet), LCID));
        FExcelWorksheet.ConnectTo(FExcelWorkbook.Worksheets[1] as _Worksheet);
      end
      else
      begin
        // ctNewWorksheet = active workbook, add new worksheet or use existing one
        FExcelApplication.ConnectKind := ckRunningOrNew;
        FExcelApplication.Connect;
        if FExcelApplication.Workbooks.Count = 0 then
        begin
          raise ENoActiveWorkbook.Create(rsNoActiveWorkbookOrExcel);
          Exit;
        end;

        FExcelWorkbook.ConnectTo(FExcelApplication.ActiveWorkbook);

        // Check if worksheetname already exists in workbook
        IntIndex := GetIndexOfWorksheet(StrWorksheetName);

        // Create new worksheet if worksheetname does not exist
        // If it exists, activate this worksheet
        if IntIndex = -1 then
          FExcelWorksheet.ConnectTo(FExcelWorkbook.Worksheets.Add(EmptyParam, EmptyParam, 1, TOleEnum(xlWBATWorksheet), LCID) as _Worksheet)
        else
          FExcelWorksheet.ConnectTo(FExcelWorkbook.Worksheets[IntIndex] as _Worksheet);
      end;
    end;
  except
    raise;
    Exit;
  end;

  FExcelApplication.ScreenUpdating[LCID] := False;

  FIntExcelVersion := GetRegistryExcelVersion;

  if (IntIndex = -1) and (StrWorksheetName <> '') then
    FExcelWorksheet.Name := StrWorksheetName;

  FBlnConnected := True;
end;

//------------------------------------------------------------------------------
function TscExcelExport.GetRegistryExcelVersion : integer;
var
  Regist : TRegistry;
begin
  Result := 0;
  Regist := TRegistry.Create;
  try
    Regist.RootKey := Windows.HKEY_CURRENT_USER;
    if Regist.OpenKey('\Software\Microsoft\Office\11.0\Excel',false) then
      Result := 11 //2003
    else if Regist.OpenKey('\Software\Microsoft\Office\10.0\Excel',false) then
      Result := 10 //XP
    else if Regist.OpenKey('\Software\Microsoft\Office\9.0\Excel',false) then
      Result := 9 //2000
    else if Regist.OpenKey('\Software\Microsoft\Office\8.0\Excel',false) then
      Result := 8; //97
    Regist.CloseKey;
  finally
    Regist.Free;
  end;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.Disconnect;
begin
  if not FBlnExcelVisible then
  begin
    FExcelApplication.DisplayAlerts[LCID] := False;
    FExcelApplication.Quit;
  end;
  FExcelWorksheet.Disconnect;
  FExcelWorkbook.Disconnect;
  FExcelApplication.Disconnect;

  FBlnConnected := False;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.CloseAllExcelApps;
var
  Hwnd : THandle;
  HwndPrev : THandle;
begin
  HwndPrev := 0;
  Hwnd := FindWindow('XLMAIN',nil);
  while (Hwnd <> 0) and (HwndPrev <> Hwnd) do
  begin
    SendMessage(Hwnd,WM_CLOSE,0,0);
    HwndPrev := Hwnd;
    Hwnd := FindWindow('XLMAIN',nil);
  end;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.ExportDataset;
var
  CurPrev : TCursor;
begin
  CurPrev := Screen.Cursor;
  Screen.Cursor := crHourGlass;
  try
    if FDataPipe = dpDataSet then
    begin
      if not Assigned(FDataset) then
      begin
        raise ENoDatasetConnected.Create(rsNoDatasetConnected);
        Exit;
      end;

      if not FDataset.Active then
      begin
        raise EDatasetNotActive.Create(rsDatasetNotActive);
        Exit;
      end;
    end;

    if not FBlnConnected then
      Connect;

    // Export header
    ExportHeader;

    // Export titels
    ExportTitles;

    // Set format (for string fields)
    //SetFormat;

    // Export data
    ExportFieldData;

    // Calculate summary
    if FSummarySelection <> ssNone then
      ExportSummary;

    // Set width of columns
    SetColumnWidth;

    // Create groups
    ExportGroup;

    // Export footer  
    ExportFooter;

    // Show Excel
    FExcelApplication.ScreenUpdating[LCID] := FBlnExcelVisible;
    if FBlnExcelVisible then
    begin
      FExcelApplication.Visible[LCID]:=True;
      //if FExcelApplication.WindowState[LCID] = XlWindowState(xlMinimized) then
      //  FExcelApplication.WindowState[LCID] := XlWindowState(xlNormal);
    end;
  finally
    Screen.Cursor := CurPrev;
  end;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.ExportHeader;
var
  i : Integer;
  Matrix : Variant;
  IntHeaderRows : Integer;
  StrBeginColumnChar : String;
begin
  IntHeaderRows := FSLHeaderText.Count;

  if IntHeaderRows = 0 then
    Exit;

  Matrix := VarArrayCreate([1, IntHeaderRows, 1, 1], varOleStr);
  try
    for i := 1 to IntHeaderRows do
      Matrix[i, 1] := FSLHeaderText[i - 1];

    // Get character corresponding with column index (A ... ZZZZ)
    StrBeginColumnChar := GetColumnCharacters(FIntBeginColumnHeader);

    FExcelWorksheet.Range[
      StrBeginColumnChar + IntToStr(FIntBeginRowHeader),
      StrBeginColumnChar + IntToStr(FIntBeginRowHeader+IntHeaderRows-1)].Value := Matrix;
    SetFontAndBorderRange(FFontHeader, FBorderHeader,
      StrBeginColumnChar + IntToStr(FIntBeginRowHeader),
      StrBeginColumnChar + IntToStr(FIntBeginRowHeader+IntHeaderRows-1));
  finally
    VarClear(Matrix);
  end;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.ExportFooter;
var
  i : Integer;
  Matrix : Variant;
  IntFooterRows : Integer;
  StrBeginColumnChar : String;
begin
  IntFooterRows := FSLFooterText.Count;

  if IntFooterRows = 0 then
    Exit;

  Matrix := VarArrayCreate([1, IntFooterRows, 1, 1], varOleStr);
  try
    for i := 1 to IntFooterRows do
      Matrix[i, 1] := FSLFooterText[i - 1];

    // Get character corresponding with column index (A ... ZZZZ)
    StrBeginColumnChar := GetColumnCharacters(FIntBeginColumnHeader);

    FExcelWorksheet.Range[
      StrBeginColumnChar + IntToStr(FIntBeginFooter),
      StrBeginColumnChar + IntToStr(FIntBeginFooter+IntFooterRows-1)].Value := Matrix;
    SetFontAndBorderRange(FFontFooter, FBorderFooter,
      StrBeginColumnChar + IntToStr(FIntBeginFooter),
      StrBeginColumnChar + IntToStr(FIntBeginFooter+IntFooterRows-1));
  finally
    VarClear(Matrix);
  end;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.ExportTitles;
var
  IntColumn : Integer;
  IntFieldIndex : Integer;
  StrCell : String;
  StrColumn : String;
  StrTitle : String;
  FltFontSizeFactor : Real;
  FltTitleFontSizeFactor : Real;
  IntFieldCount : Integer;
  StrThisFieldName : String;
  StrThisFieldDisplayName : String;
  IntThisFieldDisplayWidth : Integer;
  IntThisFieldDataSize : Integer;
  BlnThisFieldVisible : Boolean;
begin
  FStrBeginColumnDataChar := GetColumnCharacters(FIntBeginColumnData);

  FSLFieldNames.Clear;

  if FDataPipe = dpDataSet then
    IntFieldCount := FDataset.Fields.Count
  else
    if Assigned(FOnGetFieldCount) then
      FOnGetFieldCount(Self, IntFieldCount)
    else
      Exit;

  if FBlnShowTitles then
  begin
    for IntColumn := FIntBeginColumnData to (IntFieldCount + FIntBeginColumnData -1) do
    begin
      IntFieldIndex := IntColumn - FIntBeginColumnData;

      // Only export fields which are writable in an Excel cell
      // Don't export non visible fields if VisibleFieldsOnly is True
      // Add these fields to a list, so this list can be used when exporting data
      BlnThisFieldVisible := True;
      if FDataPipe = dpDataSet then
        BlnThisFieldVisible := DataSet.Fields[IntFieldIndex].Visible
      else
        if Assigned(FOnGetFieldVisible) then
          FOnGetFieldVisible(Self, IntFieldIndex, BlnThisFieldVisible);

      if CanConvertFieldToCell(IntFieldIndex) and
         ((not VisibleFieldsOnly) or (VisibleFieldsOnly and
         BlnThisFieldVisible)) then
      begin
        StrColumn := GetColumnCharacters(FSLFieldNames.Count + FIntBeginColumnData);
        StrCell:=StrColumn+IntToStr(FIntBeginRowTitles);

        StrThisFieldName := '';
        if FDataPipe = dpDataSet then
          StrThisFieldName := DataSet.Fields[IntFieldIndex].FieldName
        else
          if Assigned(FOnGetFieldName) then
            FOnGetFieldName(Self, IntFieldIndex, StrThisFieldName);
        FSLFieldNames.AddObject(StrThisFieldName, TObject(IntFieldIndex));

        // Use DisplayName of column if this is filled in, otherwise use FieldName
        StrThisFieldDisplayName := '';
        if FDataPipe = dpDataSet then
          StrThisFieldDisplayName := DataSet.Fields[IntFieldIndex].DisplayName
        else
          if Assigned(FOnGetFieldDisplayName) then
            FOnGetFieldDisplayName(Self, IntFieldIndex, StrThisFieldDisplayName);

        if StrThisFieldDisplayName <> '' then
          StrTitle := StrThisFieldDisplayName
        else
          StrTitle := StrThisFieldName;

        FExcelWorksheet.Range[StrCell,StrCell].Value := StrTitle;

        IntThisFieldDisplayWidth := 0;
        if FDataPipe = dpDataSet then
          IntThisFieldDisplayWidth := DataSet.Fields[IntFieldIndex].DisplayWidth
        else
          if Assigned(FOnGetFieldDisplayWidth) then
            FOnGetFieldDisplayWidth(Self, IntFieldIndex, IntThisFieldDisplayWidth);

        // Use DisplayField of each field to set the column width
        if FStyleColumnWidth = cwFieldDisplayWidth then
        begin
          // Value of datasize fits when font size = 10, so calculate factor when font size is larger
          FltFontSizeFactor := FFontData.Size / 10;

          FExcelWorksheet.Range[StrCell,StrCell].ColumnWidth :=
            Integer(Round(IntThisFieldDisplayWidth * FltFontSizeFactor));
        end
        else
        begin
          // Use Datasize of each field to set the column width
          if FStyleColumnWidth = cwFieldDataSize then
          begin
            // Value of datasize fits when font size = 10, so calculate factor when font size is larger
            FltFontSizeFactor := FFontData.Size / 10;

            IntThisFieldDataSize := 0;
            if FDataPipe = dpDataSet then
              IntThisFieldDataSize := DataSet.Fields[IntFieldIndex].DataSize
            else
              if Assigned(FOnGetFieldDataSize) then
                FOnGetFieldDataSize(Self, IntFieldIndex, IntThisFieldDataSize);

            FExcelWorksheet.Range[StrCell,StrCell].ColumnWidth :=
              Integer(Round(GetWidthFromDatasize(IntFieldIndex) * FltFontSizeFactor));
          end
          else
          begin
            // Style = adaptive -> use DisplayWidth of TField except when title of column is larger
            if FStyleColumnWidth = cwEnhAutoFit then
            begin
              // Value of datasize fits when font size = 10, so calculate factor when font size is larger
              FltFontSizeFactor := FFontData.Size / 10;
              FltTitleFontSizeFactor := FFontTitles.Size / 10;

              if ((Length(StrTitle) + 1) * FltTitleFontSizeFactor) >
                (IntThisFieldDisplayWidth * FltFontSizeFactor) then
                FExcelWorksheet.Range[StrCell,StrCell].ColumnWidth:=Integer(Round((Length(StrTitle) + 1) * FltTitleFontSizeFactor) + 1)
              else
                FExcelWorksheet.Range[StrCell,StrCell].ColumnWidth :=
                  Integer(Round(IntThisFieldDisplayWidth * FltFontSizeFactor));
            end
            // else cwDefault, cwOwnerWidth, cwAutoFit
            // These columns widths are set after exporting all data in the procedure SetColumnWidth
          end;
        end;
      end;
    end;
    SetFontAndBorderRange(FFontTitles, FBorderTitles, FStrBeginColumnDataChar+IntToStr(FIntBeginRowTitles),
      GetColumnCharacters(FSLFieldNames.Count + FIntBeginColumnData -1)+IntToStr(FIntBeginRowTitles));
  end
  else
  begin
    // Titles will not be visible, but run through fields
    for IntColumn := FIntBeginColumnData to (IntFieldCount + FIntBeginColumnData -1) do
    begin
      IntFieldIndex := IntColumn - FIntBeginColumnData;

      BlnThisFieldVisible := True;
      if FDataPipe = dpDataSet then
        BlnThisFieldVisible := DataSet.Fields[IntFieldIndex].Visible
      else
        if Assigned(FOnGetFieldVisible) then
          FOnGetFieldVisible(Self, IntFieldIndex, BlnThisFieldVisible);

      StrThisFieldName := '';
      if FDataPipe = dpDataSet then
        StrThisFieldName := DataSet.Fields[IntFieldIndex].FieldName
      else
        if Assigned(FOnGetFieldName) then
          FOnGetFieldName(Self, IntFieldIndex, StrThisFieldName);

      // Only export fields which are writable in an Excel cell
      // Don't export non visible fields if VisibleFieldsOnly is True
      // Add these fields to a list, so this list can be used when exporting data
      if CanConvertFieldToCell(IntFieldIndex) and
         ((not VisibleFieldsOnly) or (VisibleFieldsOnly and BlnThisFieldVisible))
      then
      begin
        StrColumn := GetColumnCharacters(FSLFieldNames.Count + FIntBeginColumnData);
        FSLFieldNames.AddObject(StrThisFieldName, TObject(IntFieldIndex));
      end;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.ExportFieldData;
const
  CONST_BACKGROUNDCOLOR = 1;
  CONST_FONTCOLOR       = 2;
  CONST_FONTNAME        = 3;
  CONST_FONTSIZE        = 4;
  CONST_FONTBOLD        = 5;
var
  IntColumn : Integer;
  IntBeginRow, IntEndRow : Integer;
  IntMatrixRow : Integer;
  PtBookmark : TBookmark;
  Matrix : Variant;
  VarCurrentValue : Variant;

  MatrixStyles : Variant;
  ColorBackground : TColor;
  FontCell : TxlFont;

  function ExcelRangeStr(IntRow, IntColumn: integer) : string;
  begin
    Result := Chr(IntColumn + 64) + IntToStr(IntRow);
  end;

  function IsColorEventAssigned : Boolean;
  begin
    Result := Assigned(FOnGetCellBackgroundColorEvent) or
      Assigned(FOnGetCellStyleEvent) or
      Assigned(FOnGetFieldCellStyleEvent);
  end;

  procedure ChangeColorCells(IntEndRecord : Integer);
  var
    i,j : integer;
    StrCell : String;
  begin
    for i:=1 to IntEndRecord do
    begin
      for j:=1 to FSLFieldNames.Count do
      begin
        StrCell := ExcelRangeStr(IntBeginRow+i-1,FIntBeginColumnData+j-1);
        // Only change the cells which have another color or font style
        // The given backcolor and font style will be set for a larger range of cells
        // This is a lot faster then accessing all cells individually

        if (MatrixStyles[i,j,1] <> FBorderData.FBackColor) then
          FExcelWorksheet.Range[StrCell,StrCell].Interior.Color:=MatrixStyles[i,j,CONST_BACKGROUNDCOLOR];

        if (MatrixStyles[i,j,CONST_FONTCOLOR] <> FFontData.Color) then
          FExcelWorksheet.Range[StrCell,StrCell].Font.Color:=MatrixStyles[i,j,CONST_FONTCOLOR];
        if (MatrixStyles[i,j,CONST_FONTNAME] <> FFontData.Name) then
          FExcelWorksheet.Range[StrCell,StrCell].Font.Name:=MatrixStyles[i,j,CONST_FONTNAME];
        if (MatrixStyles[i,j,CONST_FONTSIZE] <> FFontData.Size) then
          FExcelWorksheet.Range[StrCell,StrCell].Font.Size:=MatrixStyles[i,j,CONST_FONTSIZE];
        if (MatrixStyles[i,j,CONST_FONTBOLD] = True) and (FFontData.Style = []) then
          FExcelWorksheet.Range[StrCell,StrCell].Font.Bold := True;
      end;
    end;
  end;


begin
  FIntRecordNo := 0;

  if DataPipe = dpDataSet then
  begin
    FDataset.DisableControls;
    PtBookmark := FDataset.GetBookmark;
  end
  else
    PtBookmark := nil;

  FontCell := TxlFont.Create;
  try
    // Create a matrix of variants
    // -  Columns = number of fields
    // -  Rows    = block of records (FIntBlockOfRecords)
    Matrix := VarArrayCreate([1,FIntBlockOfRecords,1,FSLFieldNames.Count],varVariant);

    // When event is used, create matrix for the cell background and font colors
    // 3 dimensional array [rows, columns, type] (type see constants)
    if IsColorEventAssigned then
      MatrixStyles := VarArrayCreate([1,FIntBlockOfRecords,1,FSLFieldNames.Count,1,5],varVariant);

    IntBeginRow := FIntBeginRowData;
    IntEndRow := FIntBeginRowData + FIntBlockOfRecords-1 ;

    IntMatrixRow := 0;

    if DataPipe = dpDataSet then
      FDataset.First
    else
      if Assigned(FOnGotoFirstRecord) then
        FOnGotoFirstRecord(Self);

    while not IsEOF do
    begin
      Inc(FIntRecordNo);
      Inc(IntMatrixRow);

      for IntColumn := 1 to FSLFieldNames.Count do
      begin
        VarCurrentValue := Null;
        if FDataPipe = dpDataSet then
        begin
          if (IsMemoField(Integer(FSLFieldNames.Objects[IntColumn - 1])))
            and (not Assigned(DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])].OnGetText)) then
          begin
            VarCurrentValue := DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])].AsVariant;
          end
          else
          begin
            if (IsValueField(Integer(FSLFieldNames.Objects[IntColumn - 1]))) then
            begin
              if (IsValueField(Integer(FSLFieldNames.Objects[IntColumn - 1]))) and
               (TNumericField(DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])]).DisplayFormat <> '') then
                VarCurrentValue := DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])].AsVariant
              else
                VarCurrentValue := DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])].AsVariant;
            end
            else
            begin
              if DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])] is TDateTimeField then
              begin
                // When date is 0, export value is an empty string
                if (DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])].AsDateTime = 0) then
                begin
                  VarCurrentValue := '';
                end
                else
                begin
                  // Excel 2003 does always work with the american date and time format so export the date time
                  // fields in this format undependant the system format
                  if FIntExcelVersion = 11 then
                  begin
                    begin
                      if DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])] is TDateField then
                        VarCurrentValue := FormatDateTime('mm'+DateSeparator+'dd'+DateSeparator+'yyyy',DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])].AsDateTime)
                      else if DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])] is TTimeField then
                        VarCurrentValue := FormatDateTime('hh'+TimeSeparator+'nn'+TimeSeparator+'ss',DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])].AsDateTime)
                      else
                        VarCurrentValue := FormatDateTime('mm'+DateSeparator+'dd'+DateSeparator+'yyyy hh'+TimeSeparator+'nn'+TimeSeparator+'ss',DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])].AsDateTime);
                    end;
                  end
                  else
                    VarCurrentValue := DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])].Text
                end;
              end
              else
                VarCurrentValue := DataSet.Fields[Integer(FSLFieldNames.Objects[IntColumn - 1])].Text;
            end;
          end;
        end
        else
          if Assigned(FOnGetFieldValue) then
            FOnGetFieldValue(Self, Integer(FSLFieldNames.Objects[IntColumn - 1]), VarCurrentValue);

        Matrix[IntMatrixRow,IntColumn] := VarCurrentValue;

        if FDataPipe = dpDataSet then
        begin
          // Trigger event GetCellColor or old GetCellBackgroundColor and fill matrix with
          // cell background and font colors
          if Assigned(FOnGetCellBackgroundColorEvent)
            or Assigned(FOnGetCellStyleEvent) then
          begin
            ColorBackground := FBorderData.FBackColor;
            FontCell.Assign(FFontData);

            if Assigned(FOnGetCellBackgroundColorEvent) then
              FOnGetCellBackgroundColorEvent(Self,FDataset.FieldByName(FSLFieldNames[IntColumn - 1]),ColorBackground);
            if Assigned(FOnGetCellStyleEvent) then
              FOnGetCellStyleEvent(Self,FDataset.FieldByName(FSLFieldNames[IntColumn - 1]),ColorBackground,FontCell);

            MatrixStyles[IntMatrixRow,IntColumn,CONST_BACKGROUNDCOLOR]:=ColorBackground;
            MatrixStyles[IntMatrixRow,IntColumn,CONST_FONTCOLOR]:=FontCell.Color;
            MatrixStyles[IntMatrixRow,IntColumn,CONST_FONTNAME]:=FontCell.Name;
            MatrixStyles[IntMatrixRow,IntColumn,CONST_FONTSIZE]:=FontCell.Size;
            MatrixStyles[IntMatrixRow,IntColumn,CONST_FONTBOLD]:=(FontCell.Style = [fsBold]);
          end;
        end
        else if FDataPipe = dpCustom then
        begin
          // Trigger event GetFieldCellColor and fill matrix with cell background and font colors
          if Assigned(FOnGetFieldCellStyleEvent) then
          begin
            ColorBackground := FBorderData.FBackColor;
            FontCell.Assign(FFontData);

            FOnGetFieldCellStyleEvent(Self,Integer(FSLFieldNames.Objects[IntColumn - 1]),ColorBackground,FontCell);

            MatrixStyles[IntMatrixRow,IntColumn,CONST_BACKGROUNDCOLOR]:=ColorBackground;
            MatrixStyles[IntMatrixRow,IntColumn,CONST_FONTCOLOR]:=FontCell.Color;
            MatrixStyles[IntMatrixRow,IntColumn,CONST_FONTNAME]:=FontCell.Name;
            MatrixStyles[IntMatrixRow,IntColumn,CONST_FONTSIZE]:=FontCell.Size;
            MatrixStyles[IntMatrixRow,IntColumn,CONST_FONTBOLD]:=(FontCell.Style = [fsBold]);
          end;
        end;
      end;

      // Create a new block of records to export to Excel
      // Don't export all data to one variant matrix because memory has it limitations
      // Property FIntBlockOfRecords is default 20 records

      // Check if matrix is full, and if so, write the block to excel
      if (FIntRecordNo mod FIntBlockOfRecords = 0) then
      begin
        SetFormat(IntBeginRow,IntEndRow);
        FExcelWorksheet.Range[FStrBeginColumnDataChar+IntToStr(IntBeginRow),
          GetColumnCharacters(FSLFieldNames.Count + FIntBeginColumnData - 1)+IntToStr(IntEndRow)].Value := Matrix;

        if IsColorEventAssigned then
        begin
          // Set font and border for all rows of the current block
          SetFontAndBorderRange(FFontData, FBorderData,FStrBeginColumnDataChar+IntToStr(IntBeginRow),
            GetColumnCharacters(FSLFieldNames.Count + IntBeginRow -1)+IntToStr(IntEndRow));
          // Overwrite the cells which to have another color
          // This ways is a lot faster then setting all cells individually
          ChangeColorCells(FIntBlockOfRecords);
        end;

        IntBeginRow := IntBeginRow + FIntBlockOfRecords;      // next insert starts here
        IntEndRow := IntBeginRow   + FIntBlockOfRecords -1;   // next block ends here
        IntMatrixRow := 0;                                    // reset index into matrix
      end;

      if FDataPipe = dpDataSet then
        FDataSet.Next
      else
        if Assigned(FOnGotoNextRecord) then
          FOnGotoNextRecord(Self);

      if Assigned(FOnExportRecords) then
        FOnExportRecords(Self,FIntRecordNo);

      Application.ProcessMessages;
    end;

    // recalculate the block's end
    IntEndRow := IntBeginRow + IntMatrixRow-1;

    // Now that EOF is true, so check if the matrix has remaining data to write
    if (IntMatrixRow > 0) then
    begin
      SetFormat(IntBeginRow,IntEndRow);

      // Write remaining block
      FExcelWorksheet.Range[FStrBeginColumnDataChar+IntToStr(IntBeginRow),GetColumnCharacters(FSLFieldNames.Count + FIntBeginColumnData - 1)+IntToStr(IntEndRow)].Value := Matrix;

      if IsColorEventAssigned then
      begin
        SetFontAndBorderRange(FFontData, FBorderData,FStrBeginColumnDataChar+IntToStr(IntBeginRow),
          GetColumnCharacters(FSLFieldNames.Count + IntBeginRow -1)+IntToStr(IntEndRow));
        ChangeColorCells(IntEndRow-IntBeginRow+1);
      end;
    end;

    if DataPipe = dpDataSet then
      FDataset.GotoBookmark(PtBookmark);

  finally
    VarClear(Matrix);

    if DataPipe = dpDataSet then
    begin
      FDataset.FreeBookmark(PtBookmark);
      FDataset.EnableControls;
    end;

    FontCell.Free;
  end;

  FIntEndRowData := IntEndRow;
  FIntBeginFooter := FIntEndRowData + 1;

  // If no color events are used, we can set the font and border color for the whole matrix of data
  // This is the most fasted way but it can not be used if individual cells have been changed
  if not IsColorEventAssigned then
    SetFontAndBorderRange(FFontData, FBorderData,FStrBeginColumnDataChar+IntToStr(FIntBeginRowData),
      GetColumnCharacters(FSLFieldNames.Count + FIntBeginColumnData -1)+IntToStr(FIntEndRowData));
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.ExportSummary;
const
  SUM_ARR : array[TSummaryCalculation] of String = ('SUM', 'MIN', 'MAX', 'AVERAGE');
var
  IntColumn : Integer;
  StrCell : String;
  StrCalc : String;
  StrBeginCell, StrEndCell : String;

  function Summarized(aColumn: Integer): Boolean;
  begin
    case FSummarySelection of
    ssValues:
      Result := IsValueField(Integer(FSLFieldNames.Objects[aColumn - 1]));
    ssGiven:
      Result := FSLSummaryFields.IndexOf(
        UpperCase(FSLFieldNames[aColumn - 1])) > -1;
    else
      Result := False;
    end;
  end;

begin
  for IntColumn := 1 to FSLFieldNames.Count do
  begin
    if Summarized(IntColumn) then
    begin
      StrCell:=GetColumnCharacters(IntColumn)+IntToStr(FIntRecordNo + FIntBeginRowData);
      StrCalc := SUM_ARR[FSummaryCalculation];

      StrBeginCell := GetColumnCharacters(IntColumn)+IntToStr(FIntBeginRowData);
      StrEndCell := GetColumnCharacters(IntColumn)+IntToStr(FIntRecordNo + FIntBeginRowData - 1);
      FExcelWorksheet.Range[StrCell,StrCell].Value := Format('=%s(%s:%s)', [StrCalc, StrBeginCell, StrEndCell]);
    end;
  end;

  SetFontAndBorderRange(FFontSummary, FBorderSummary, 'A'+IntToStr(FIntRecordNo + FIntBeginRowData),
    GetColumnCharacters(FSLFieldNames.Count)+IntToStr(FIntRecordNo + FIntBeginRowData));

  FIntBeginFooter := FIntRecordNo + FIntBeginRowData + 1;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.ExportGroup;
type
  TRange = record
    IntFirst, IntLast: integer;
  end;
var
  SLColumns : TStrings;
  i, j, IntIndex : Integer;
  StrHeaderCell, StrHeaderEndCell, StrBeginCell, StrEndCell, StrColumn : String;
  VarValue : Variant;
  PtBookmark : TBookmark;
  BlnDone : boolean;
  IntFieldCount : Integer;

  function GetFieldValue(const IntIndex : Integer) : String;
  begin
    if FDataPipe = dpDataSet then
      Result := FDataSet.FieldByName(FSLGroupFields[IntIndex]).AsString
    else
      if Assigned(FOnGetFieldValue) then
      begin
        FOnGetFieldValue(Self,IntIndex,VarValue);
        Result := VarToStr(VarValue);
      end;
  end;

  procedure AppendRow(IntColumn, IntRow : integer);
  var
    PtrRange : ^TRange;
  begin
    New(PtrRange);
    PtrRange^.IntFirst := IntRow;
    PtrRange^.IntLast := -1; //default value
    (SLColumns.Objects[IntColumn] as TList).Add(PtrRange);
    if FDataPipe = dpDataSet then
      StrBeginCell := GetColumnCharacters(FDataSet.FieldByName(FSLGroupFields[IntColumn]).Index+FIntBeginColumnData)
    else
      StrBeginCell := GetColumnCharacters(IntColumn+FIntBeginColumnData);
    StrBeginCell := StrBeginCell+IntToStr(IntRow);
    FExcelWorkSheet.Range[StrBeginCell,StrBeginCell].EntireRow.Insert(xlShiftDown);
    FExcelWorkSheet.Range[StrBeginCell,StrBeginCell].Value := GetFieldValue(IntColumn);
  end;

begin
  if FSLGroupFields.Count = 0 then
    Exit;

  // Data in Dataset (or when using events) has to be sorted
  // by using the group fields

  // TODO Add summaries for every group
  if FDataPipe = dpDataSet then
  begin
    FDataset.DisableControls;
    PtBookmark := FDataset.GetBookmark;
  end
  else
    PtBookmark := nil;

  if FDataPipe = dpDataSet then
    IntFieldCount := FDataset.Fields.Count
  else
    if Assigned(FOnGetFieldCount) then
      FOnGetFieldCount(Self, IntFieldCount)
    else
      Exit;

  SLColumns := TStringList.Create;
  try
    if FDataPipe = dpDataSet then
      FDataSet.First
    else
      if Assigned(FOnGotoFirstRecord) then
        FOnGotoFirstRecord(Self);

    FExcelWorksheet.Outline.SummaryRow := xlAbove;
    FExcelWorksheet.Outline.SummaryColumn := xlRight;

    IntIndex := FIntBeginRowData;

    // Insert rows for IntFirst group fields
    for i := 0 to FSLGroupFields.Count-1 do
    begin
      SLColumns.AddObject(GetFieldValue(i),TList.Create);
      AppendRow(i, IntIndex);
      Inc(IntIndex);
    end;

    // Run through dataset and insert new rows for other groups
    while not IsEOF do
    begin
      i := 0;
      BlnDone := false;
      while (i <= FSLGroupFields.Count-1) and (not BlnDone) do
      begin
        if SLColumns[i] <> GetFieldValue(i) then
        begin
          // This columns' value is different from the previous.
          // So we start a new group here. We also have to start new groups
          // for the grouping columns following this one
          for j := i to FSLGroupFields.Count-1 do
          begin
            SLColumns[j] := GetFieldValue(j);

            // The current row starts a new group so the 'IntLast' of the
            // current group should be the previous row}
            TRange((SLColumns.Objects[j] as TList).Last^).IntLast := IntIndex - 1;
            // Start a new group
            AppendRow(j, IntIndex + (j - i)) ;
          end;
          // We inserted FSLGroupFields.Count - i - 1 new 'group rows' into the
          // Excel worksheet. We need to advance one more row to get to the row
          // we were at before we started inserting the group rows}
          IntIndex := IntIndex + (FSLGroupFields.Count - i);
          // Get out of the loop
          BlnDone := true;
        end;
        inc(i);
      end;

      Inc(IntIndex);

      if FDataPipe = dpDataSet then
        FDataSet.Next
      else
        if Assigned(FOnGotoNextRecord) then
          FOnGotoNextRecord(Self);
    end;

    FIntBeginFooter := IntIndex + 1;

    // Now set the ranges 'IntLast' value
    for i := 0 to FSLGroupFields.Count-1 do
      TRange((SLColumns.Objects[i] as TList).Last^).IntLast := IntIndex - 1;

    // Create groups for each group of rows
    for i := 0 to FSLGroupFields.Count-1 do
    begin
      if Trim(FSLGroupFields[i]) <> '' then
      begin
        if FDataPipe = dpDataSet then
          StrColumn := GetColumnCharacters(FDataSet.FieldByName(FSLGroupFields[i]).Index+FIntBeginColumnData)
        else
          StrColumn := GetColumnCharacters(i+FIntBeginColumnData);

        j := 0;
        while j <= (SLColumns.Objects[i] as TList).Count-1 do
        begin
          StrHeaderCell :=StrColumn+IntToStr(TRange((SLColumns.Objects[i] as TList).Items[j]^).IntFirst);
          StrBeginCell := StrColumn+IntToStr(TRange((SLColumns.Objects[i] as TList).Items[j]^).IntFirst + 1);
          strEndCell := StrColumn+IntToStr(TRange((SLColumns.Objects[i] as TList).Items[j]^).IntLast);
          Inc(j);

          // Clear contents of group cells, only header of group is visible
          if FGroupOptions.FBlnClearContents then
            FExcelWorkSheet.Range[StrBeginCell,StrEndCell].ClearContents;

          // Let Excel group the range of cells
          FExcelWorkSheet.Range[StrBeginCell,StrEndCell].Rows.Group(null,null,null,null);
          try
            if FGroupOptions.FBorderRange = bsCell then
            begin
              // Set Font and Border for cell
              SetFontAndBorderRange(FFontGroup,FBorderGroup,StrHeaderCell,StrHeaderCell);
            end
            else
            begin
              // Set Font and Border for the whole row of the grouped cell
              StrHeaderEndCell :=GetColumnCharacters(IntFieldCount)+IntToStr(TRange((SLColumns.Objects[i] as TList).Items[j-1]^).IntFirst);
              SetFontAndBorderRange(FFontGroup,FBorderGroup,StrHeaderCell,StrHeaderEndCell);
            end;
          except
          end;
        end;

        // Decrease font size for the subgroups
        FFontGroup.Size := FFontGroup.Size - FGroupOptions.FIntIntervalFontSize;
      end;
    end;

    for i := 0 to FSLGroupFields.Count-1 do
    begin
      for j := 0 to (SLColumns.Objects[i] as TList).Count - 1 do
        Dispose((SLColumns.Objects[i] as TList).items[j]);
      (SLColumns.Objects[i] as TList).Free;
    end;

    if FDataPipe = dpDataSet then
      FDataset.GotoBookmark(PtBookmark);
  finally
    SLColumns.Free;
    if FDataPipe = dpDataSet then
    begin
      FDataset.FreeBookmark(PtBookmark);
      FDataset.EnableControls;
    end;
  end;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.SaveAs(const StrFileName : String; const FileFormat : TFileFormat);
begin
  if FExcelApplication.Workbooks.Count = 0 then
  begin
    raise ENoActiveWorkbook.Create(rsNoActiveWorkbookOrExcel);
    Exit;
  end;

  FExcelApplication.DisplayAlerts[LCID] := False;
  // Export data to a file
  case FileFormat of
    // Excel 2000/XP format
    ffXLS : FExcelWorksheet.SaveAs(StrFileName);
    // Excel 95 and 97 compatible format
    ffXL97: FExcelWorksheet.SaveAs(StrFileName,XlFileFormat(xlExcel9795));
    ffCSV : FExcelWorksheet.SaveAs(StrFileName,XlFileFormat(xlCSV));
    // HTML
    // Only works with Excel 2000/XP
    {$IFNDEF DELPHI5}
    ffHTM : FExcelWorksheet.SaveAs(StrFileName,XlFileFormat(xlHtml));
    {$ENDIF}
  end;
end;

//------------------------------------------------------------------------------
procedure TscExcelExport.PrintPreview(const BlnPrintGridLines : Boolean);
begin
  if FExcelApplication.Workbooks.Count = 0 then
  begin
    raise ENoActiveWorkbook.Create(rsNoActiveWorkbookOrExcel);
    Exit;
  end;
  
  // Show PrintPreview of Excel
  //TODO
  {$IFDEF DELPHI7}
  FExcelWorksheet.PageSetup.PrintGridlines:=BlnPrintGridLines;
  FExcelWorksheet.PageSetup.CenterHeader:=FExcelWorksheet.Name;
  {$ENDIF}
  FExcelApplication.ScreenUpdating[LCID]:=True;
  FExcelApplication.Visible[LCID]:=True;
  FBlnExcelVisible:=True;
  FExcelWorksheet.PrintPreview;
end;

//------------------------------------------------------------------------------
function TscExcelExport.GetExcelVersion: Integer;
begin
  FIntExcelVersion := GetRegistryExcelVersion;
  Result := FIntExcelVersion
end;

end.

