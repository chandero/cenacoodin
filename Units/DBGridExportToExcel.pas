unit DBGridExportToExcel;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, ComCtrls, DB, IniFiles, Buttons, dbgrids, ADODB;


type TScrollEvents = class
       BeforeScroll_Event: TDataSetNotifyEvent;
       AfterScroll_Event: TDataSetNotifyEvent;
       AutoCalcFields_Property: Boolean;
  end;

procedure DisableDependencies(DataSet: TDataSet; var ScrollEvents: TScrollEvents);
procedure EnableDependencies(DataSet: TDataSet; ScrollEvents: TScrollEvents);
procedure DBGridToExcelADO(DBGrid: TDBGrid; FileName: string; SheetName: string);


implementation

//Support procedures: I made that in order to increase speed in
//the process of scanning large amounts
//of records in a dataset

//we make a call to the "DisableControls" procedure and then disable the "BeforeScroll" and
//"AfterScroll" events and the "AutoCalcFields" property.
procedure DisableDependencies(DataSet: TDataSet; var ScrollEvents: TScrollEvents);
begin
     with DataSet do
          begin
               DisableControls;
               ScrollEvents := TScrollEvents.Create();
               with ScrollEvents do
                    begin
                         BeforeScroll_Event := BeforeScroll;
                         AfterScroll_Event := AfterScroll;
                         AutoCalcFields_Property := AutoCalcFields;
                         BeforeScroll := nil;
                         AfterScroll := nil;
                         AutoCalcFields := False;
                    end;
          end;
end;

//we make a call to the "EnableControls" procedure and then restore
// the "BeforeScroll" and "AfterScroll" events and the "AutoCalcFields" property.
procedure EnableDependencies(DataSet: TDataSet; ScrollEvents: TScrollEvents);
begin
     with DataSet do
          begin
               EnableControls;
               with ScrollEvents do
                    begin
                         BeforeScroll := BeforeScroll_Event;
                         AfterScroll := AfterScroll_Event;
                         AutoCalcFields := AutoCalcFields_Property;
                    end;
          end;
end;

//This is the procedure which make the work:

procedure DBGridToExcelADO(DBGrid: TDBGrid; FileName: string; SheetName: string);
var
  cat: _Catalog;
  tbl: _Table;
  col: _Column;
  i: integer;
  ADOConnection: TADOConnection;
  ADOQuery: TADOQuery;
  ScrollEvents: TScrollEvents;
  SavePlace: TBookmark;
begin
  //
  //WorkBook creation (database)
  cat := CoCatalog.Create;
  cat._Set_ActiveConnection('Provider=Microsoft.Jet.OLEDB.4.0; Data Source=' + FileName + ';Extended Properties=Excel 8.0');
  //WorkSheet creation (table)
  tbl := CoTable.Create;
  tbl.Set_Name(SheetName);
  //Columns creation (fields)
  DBGrid.DataSource.DataSet.First;
  with DBGrid.Columns do
    begin
      for i := 0 to Count - 1 do
        if Items[i].Visible then
        begin
          col := nil;
          col := CoColumn.Create;
          with col do
            begin
              Set_Name(Items[i].Title.Caption);
              Set_Type_(adVarWChar);
            end;
          //add column to table
          tbl.Columns.Append(col, adVarWChar, 20);
        end;
    end;
  //add table to database
  cat.Tables.Append(tbl);

  col := nil;
  tbl := nil;
  cat := nil;

  //exporting
  ADOConnection := TADOConnection.Create(nil);
  ADOConnection.LoginPrompt := False;
  ADOConnection.ConnectionString := 'Provider=Microsoft.Jet.OLEDB.4.0; Data Source=' + FileName + ';Extended Properties=Excel 8.0';
  ADOQuery := TADOQuery.Create(nil);
  ADOQuery.Connection := ADOConnection;
  ADOQuery.SQL.Text := 'Select * from [' + SheetName + '$]';
  ADOQuery.Open;


  DisableDependencies(DBGrid.DataSource.DataSet, ScrollEvents);
  SavePlace := DBGrid.DataSource.DataSet.GetBookmark;
  try
  with DBGrid.DataSource.DataSet do
    begin
      First;
      while not Eof do
        begin
          ADOQuery.Append;
          with DBGrid.Columns do
            begin
              ADOQuery.Edit;
              for i := 0 to Count - 1 do
                if Items[i].Visible then
                  begin
                    ADOQuery.FieldByName(Items[i].Title.Caption).AsString := FieldByName(Items[i].FieldName).AsString;
                  end;
              ADOQuery.Post;
            end;
          Next;
        end;
    end;

  finally
  DBGrid.DataSource.DataSet.GotoBookmark(SavePlace);
  DBGrid.DataSource.DataSet.FreeBookmark(SavePlace);
  EnableDependencies(DBGrid.DataSource.DataSet, ScrollEvents);

  ADOQuery.Close;
  ADOConnection.Close;

  ADOQuery.Free;
  ADOConnection.Free;

  end;

end;

end.
