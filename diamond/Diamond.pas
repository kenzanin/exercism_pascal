unit Diamond;

{$mode ObjFPC}{$H+}

interface

function rows(const letter : char) : string;

implementation

uses SysUtils, Classes;

function rows(const letter : char) : string;
var
  idx, i: integer;
  ch: char;
  sl: TStringList;
  line: string;
  function repeatChar(c: char; count: integer): string;
  begin
    if count <= 0 then
      Result := ''
    else
      Result := StringOfChar(c, count);
  end;
begin
  // Normalize input to uppercase and compute index
  idx := Ord(UpCase(letter)) - Ord('A');
  if idx < 0 then idx := 0;

  sl := TStringList.Create;
  try
    // top half including middle
    for i := 0 to idx do
    begin
      ch := Chr(Ord('A') + i);
      if i = 0 then
        line := repeatChar(' ', idx - i) + ch + repeatChar(' ', idx - i)
      else
        line := repeatChar(' ', idx - i) + ch + repeatChar(' ', 2 * i - 1) + ch + repeatChar(' ', idx - i);
      sl.Add(line);
    end;

    // bottom half (mirror)
    for i := idx + 1 to idx * 2 do
      sl.Add(sl[idx * 2 - i]);

    // Join using LF (#10) as tests expect #10 separators and no trailing newline.
    Result := sl.Text;
    if (Length(Result) > 0) and (Result[Length(Result)] = #10) then
      Delete(Result, Length(Result), 1);
  finally
    sl.Free;
  end;
end;

end.
