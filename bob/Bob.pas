unit Bob;

{$mode ObjFPC}{$H+}

interface

function response(const HeyBob: string) : string;

implementation

uses SysUtils;

function IsQuestion(const S: string): Boolean;
var
  i: Integer;
begin
  Result := False;
  // Skip trailing whitespace, check for '?'
  i := Length(S);
  while (i > 0) and (S[i] in [' ', #9, #13, #10]) do Dec(i);
  if (i > 0) and (S[i] = '?') then Result := True;
end;

function IsShouting(const S: string): Boolean;
var
  HasLetters, AllCaps: Boolean;
  c: char;
  i: Integer;
begin
  HasLetters := False;
  AllCaps := True;
  for i := 1 to Length(S) do
  begin
    c := S[i];
    if (c in ['A'..'Z', 'a'..'z']) then
    begin
      HasLetters := True;
      if not (c in ['A'..'Z']) then
        AllCaps := False;
    end;
  end;
  Result := HasLetters and AllCaps;
end;

function IsSilence(const S: string): Boolean;
var
  c: char;
  i: Integer;
begin
  Result := True;
  for i := 1 to Length(S) do
  begin
    c := S[i];
    if not (c in [' ', #9, #10, #13]) then
    begin
      Result := False;
      Break;
    end;
  end;
end;

function response(const HeyBob: string): string;
begin
  if IsSilence(HeyBob) then
    Result := 'Fine. Be that way!'
  else if IsShouting(HeyBob) and IsQuestion(HeyBob) then
    Result := 'Calm down, I know what I''m doing!'
  else if IsShouting(HeyBob) then
    Result := 'Whoa, chill out!'
  else if IsQuestion(HeyBob) then
    Result := 'Sure.'
  else
    Result := 'Whatever.';
end;

end.
