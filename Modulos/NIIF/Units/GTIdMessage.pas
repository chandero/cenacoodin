unit GTIdMessage;
{
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
* Extension of the Standard TIdMessage Indy Control.
* Programmed by George Trifidis.E-mail:Unixxas@yahoo.com.
* For any Comments - Upgrades please sent email.
*
* /*/July 12 2005/*/
*
* Extended Features :                                                                                                                                         *
* Properties :
*   1.BodyText :TStrings;
*     //BodyText Field-Property holds the plain text of the Message.
*   2.BodyHtml :TStrings;
*     //BodyHtml Field-Property holds the html text of the Message.
*   3.AttachMentList:TStrings;
*     //AttachMentList Property holds a list of all attached files filenames if any
*       attached.
*   4.OutPutFolder :String;
*     //OutPutFolder holds the path of the directory that the attachment will be saved.
*     //Default Value is Exe File directory.
*   5.MessageNum :Integer;
*     //MessageNum holds the actual number of the message in the mail server and with it
*     //we can get the right Unique MsgId for each message.
* Procedures-Functions :
*   1.ResolveParts : Procedure;
*     //Procedure that will resolve all the Message Parts and set all the data to the
*       associated properties.
*   2.SaveAttachMents :Procedure;
*     //Procedure that will save all attachments to the OutPutFolder.
* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

*****DISCLAIMER********
The IdMessage component is bound to any restrictrions by its onwer.
The Extend version of it ( meaning only the source code in unit) is FREEWARE.
I would like thow if anyone uses these features send an email or something.
********************************************************************************
=============================================
Instalation : Easy...
1.Open Delhi.
2.Goto the Component->Install Component.
3.Browse for the Pas file.
4.Press the install button
5.The component is on the Samples tab.
=============================================
}
interface

uses
  SysUtils, Classes, IdBaseComponent,IdMessage,Forms,Windows;

type
  TGTIdMessage = class(TIdMessage)
  private
    { Private declarations }
    FBodyText,FBodyHtml,
    FAttachMentList:TStrings;
    FOutPutFolder:String;
    FMessageNum:Integer;
  protected
    { Protected declarations }
    constructor Create(AOwner:TComponent);override;
    destructor  Destroy;override;
    function    IsPlainText(S:String):Boolean;
    procedure   SetFolder(Value:String);
  public
    { Public declarations }
    procedure ResolveParts;
    procedure SaveAttachMents;
  published
    { Published declarations }
    property BodyText:TStrings read FBodyText write FBodyText;
    property BodyHtml:TStrings read FBodyHtml write FBodyHtml;
    property AttachMentList:TStrings read FAttachMentList write FAttachMentList;
    property OutPutFolder:String read FOutPutFolder write SetFolder;
    property MessageNum:Integer read FMessageNum write FMessageNum;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Samples', [TGTIdMessage]);
end;

{ TGTIdMessage }

constructor TGTIdMessage.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FOutPutFolder:=ExtractFileDir(Application.ExeName);
  if not (csDesigning in TComponent(Self).ComponentState)  then
    begin
      FBodyText:=TStringList.Create;
      FBodyHtml:=TStringList.Create;
      FAttachMentList:=TStringList.Create;
    end;
end;

destructor TGTIdMessage.Destroy;
begin
  FBodyText.Free;
  FBodyHtml.Free;
  FAttachMentList.Free;
  inherited;
end;

function TGTIdMessage.IsPlainText(S: String): Boolean;
begin
  Result:=False;
  if pos('<',S)=0 then Result:=True;
end;

procedure TGTIdMessage.ResolveParts;
var i:integer;
begin
  for i:=1 to MessageParts.Count-1 do
    begin
      if MessageParts.Items[i] is TIdText then
        begin
          if IsPlainText(TIdText(MessageParts.Items[i]).Body.Text) then
             FBodyText.Text:=TIdText(MessageParts.Items[i]).Body.Text
          else
             FBodyHtml.Text:=TIdText(MessageParts.Items[i]).Body.Text;
        end;
      if MessageParts.Items[i] is TIdAttachMent then
        begin
          if FAttachMentList.IndexOf(ExtractFileName(TIdAttachMent(MessageParts.Items[i]).FileName))=-1 then
            FAttachMentList.Add(ExtractFileName(TIdAttachMent(MessageParts.Items[i]).FileName));
        end;
    end;
end;

procedure TGTIdMessage.SetFolder(Value:String);
begin
  FOutPutFolder:=Value;
end;


procedure TGTIdMessage.SaveAttachMents;
var i:integer;
begin
  for i:=1 to MessageParts.Count -1  do
    begin
      if MessageParts.Items[i] is TIdAttachMent then
      if DirectoryExists(FOutPutFolder) then
        CopyFile(PChar(TIdAttachMent(MessageParts.Items[i]).StoredPathName),
        PChar(FOutPutFolder+TIdAttachMent(MessageParts.Items[i]).FileName),True)
      else
        begin
        FOutPutFolder:=ExtractFileDir(Application.ExeName);
        CopyFile(PChar(TIdAttachMent(MessageParts.Items[i]).StoredPathName),
        PChar(FOutPutFolder+TIdAttachMent(MessageParts.Items[i]).FileName),True);
        end;
    end;
end;

end.
