unit Darts;

{$mode ObjFPC}{$H+}

interface

function score(const x : single; const y : single) : uint8;

implementation

uses SysUtils;

function score(const x : single; const y : single) : uint8;
var
  distance: single;
begin
  distance := Sqrt(x * x + y * y);
  if distance <= 1.0 then
    result := 10
  else if distance <= 5.0 then
    result := 5
  else if distance <= 10.0 then
    result := 1
  else
    result := 0;
end;

end.
