unit BottleSong;

{$mode ObjFPC}{$H+}

interface

function recite(const StartBottle : integer; const TakeDown : integer) : string;

implementation

uses SysUtils, Classes;

function BottleNumStr(const n : integer; const Capitalize : boolean) : string;
const
  Words: array[0..10] of string = ('no','one','two','three','four','five','six','seven','eight','nine','ten');
var
  w: string;
begin
  if (n >= 0) and (n <= 10) then
    w := Words[n]
  else
    w := IntToStr(n);

  if Capitalize and (Length(w) > 0) then
    w[1] := UpCase(w[1]);

  if n = 1 then
    Result := w + ' green bottle'
  else
    Result := w + ' green bottles';
end;

{$HINTS OFF}
function BottleNumStr2(const n : integer) : string;
begin
  // The falling phrase always references 'one green bottle' in lowercase per tests
  // (parameter 'n' is kept for potential future variants)
  Result := 'one green bottle should accidentally fall';
end;
{$HINTS ON}

function MakeVerse(const n : integer) : string;
begin
  // Use LF (#10) explicitly to match test expectations which use #10
  Result := BottleNumStr(n, True) + ' hanging on the wall,' + #10 +
            BottleNumStr(n, True) + ' hanging on the wall,' + #10 +
            'And if ' + BottleNumStr2(n) + ',' + #10 +
            'There''ll be ' + BottleNumStr(n-1, False) + ' hanging on the wall.';
end;

function recite(const StartBottle : integer; const TakeDown : integer) : string;
var
  i, n: integer;
  sl: TStringList;
  s: string;
begin
  sl := TStringList.Create;
  try
    n := StartBottle;
    for i := 1 to TakeDown do
    begin
      if sl.Count > 0 then
        sl.Add('');
      sl.Add(MakeVerse(n));
      Dec(n);
    end;
    s := sl.Text; // TStringList.Text appends a trailing line ending
    // Remove a single trailing LF if present so the output does not end with a newline
    if (Length(s) > 0) and (s[Length(s)] = #10) then
      Delete(s, Length(s), 1);
    Result := s;
  finally
    sl.Free;
  end;
end;

end.
