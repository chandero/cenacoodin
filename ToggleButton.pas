unit ToggleButton;

interface

uses
  Windows, Messages, SysUtils, Classes, Controls, StdCtrls, ActnList;

type
  TToggleButton = class(TButton)
  private
    FChecked: Boolean;
    FGroupIndex: Integer;
    procedure Toggle;
    procedure CNCommand(var Message: TWMCommand); message CN_COMMAND;
    procedure SetGroupIndex(const Value: Integer);
    procedure TurnSiblingsOff;
  protected
    procedure SetButtonStyle(ADefault: Boolean); override;
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;

    function GetChecked: Boolean; override;
    procedure SetChecked(Value: Boolean); override;
  published
    property Checked;
    property GroupIndex: Integer read FGroupIndex write SetGroupIndex;
  end;

procedure Register;

implementation

{ TToggleButton}

procedure TToggleButton.SetButtonStyle(ADefault: Boolean);
begin
  { do nothing - avoid setting style to BS_PUSHBUTTON }
end;

procedure TToggleButton.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  Params.Style := Params.Style or BS_PUSHLIKE  or BS_CHECKBOX;
  Params.WindowClass.style := Params.WindowClass.style and not (CS_HREDRAW or CS_VREDRAW);
end;

procedure TToggleButton.CreateWnd;
begin
  inherited CreateWnd;
  SendMessage(Handle, BM_SETCHECK, Integer(FChecked), 0);
end;

procedure TToggleButton.CNCommand(var Message: TWMCommand);
begin
  if Message.NotifyCode = BN_CLICKED then
    Toggle
  else
    inherited;
end;

procedure TToggleButton.Toggle;
begin
  Checked := not FChecked;
end;

function TToggleButton.GetChecked: Boolean;
begin
  Result := FChecked;
end;

procedure TToggleButton.SetChecked(Value: Boolean);
begin
  if FChecked <> Value then
  begin
    FChecked := Value;
    if HandleAllocated then
      SendMessage(Handle, BM_SETCHECK, Integer(Checked), 0);
    if Value then
      TurnSiblingsOff;
    if not ClicksDisabled then Click;
  end;
end;

procedure TToggleButton.SetGroupIndex(const Value: Integer);
begin
  FGroupIndex := Value;
  if Checked then
    TurnSiblingsOff;
end;

procedure TToggleButton.TurnSiblingsOff;
var
  I: Integer;
  Sibling: TControl;
begin
  if (Parent <> nil) and (GroupIndex <> 0) then
    with Parent do
      for I := 0 to ControlCount - 1 do
      begin
        Sibling := Controls[I];
        if (Sibling <> Self) and (Sibling is TToggleButton) then
          with TToggleButton(Sibling) do
            if GroupIndex = Self.GroupIndex then
            begin
              if Assigned(Action) and
                 (Action is TCustomAction) and
                 TCustomAction(Action).AutoCheck then
                TCustomAction(Action).Checked := False;
              SetChecked(False);
            end;
      end;
end;

procedure Register;
begin
  RegisterComponents('Additional', [TToggleButton]);
end;

end.
