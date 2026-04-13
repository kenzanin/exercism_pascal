unit Pangram;

{$mode ObjFPC}{$H+}

interface

function IsPangram(const sentence : string) : boolean;

implementation

uses SysUtils;

function IsPangram(const sentence : string) : boolean;
var
  letters: set of char;
  c: char;
  i: integer;
  count: integer;
begin
  letters := [];
  for i := 1 to Length(sentence) do
  begin
    c := LowerCase(sentence[i]);
    if (c >= 'a') and (c <= 'z') then
      Include(letters, c);
  end;
  // Count unique letters in the set
  count := 0;
  for c := 'a' to 'z' do
    if c in letters then
      Inc(count);
  result := count = 26;
end;

end.
