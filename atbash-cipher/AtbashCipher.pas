unit AtbashCipher;

{$mode ObjFPC}{$H+}

interface

function encode(const phrase : string) : string;
function decode(const phrase : string) : string;

implementation

uses SysUtils;

function encode(const phrase : string) : string;
var
  i: Integer;
  c: Char;
  count: Integer;
begin
  Result := '';
  count := 0;
  for i := 1 to Length(phrase) do
  begin
    c := phrase[i];
    if c in ['a'..'z', 'A'..'Z'] then
    begin
      if c in ['A'..'Z'] then
        c := Chr(Ord('a') + (Ord('Z') - Ord(c)))
      else
        c := Chr(Ord('z') - (Ord(c) - Ord('a')));
      Result := Result + c;
      Inc(count);
      if (count = 5) then
      begin
        Result := Result + ' ';
        count := 0;
      end;
    end
    else if c in ['0'..'9'] then
    begin
      Result := Result + c;
      Inc(count);
      if (count = 5) then
      begin
        Result := Result + ' ';
        count := 0;
      end;
    end;
  end;
  if (Length(Result) > 0) and (Result[Length(Result)] = ' ') then
    SetLength(Result, Length(Result) - 1);
end;

function decode(const phrase : string) : string;
var
  i: Integer;
  c: Char;
begin
  Result := '';
  for i := 1 to Length(phrase) do
  begin
    c := phrase[i];
    if c = ' ' then
      Continue
    else if c in ['a'..'z', 'A'..'Z'] then
    begin
      if c in ['A'..'Z'] then
        c := Chr(Ord('a') + (Ord('Z') - Ord(c)))
      else
        c := Chr(Ord('z') - (Ord(c) - Ord('a')));
      Result := Result + c;
    end
    else
      Result := Result + c;
  end;
end;

end.
