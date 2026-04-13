unit Grains;

{$mode ObjFPC}{$H+}

interface

function square(const ASquare : integer) : UInt64;
function total : UInt64;

implementation

uses SysUtils;

function square(const ASquare : integer) : UInt64;
begin
  if (ASquare < 1) or (ASquare > 64) then
    raise Exception.Create('square must be between 1 and 64');
  result := UInt64(1) shl (ASquare - 1);
end;

function total : UInt64;
begin
  result := High(UInt64);
end;

end.
