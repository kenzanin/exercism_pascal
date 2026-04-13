unit Leap;

{$mode ObjFPC}{$H+}

interface

function LeapYear(const year : integer) : boolean;

implementation

uses SysUtils;

function LeapYear(const year : integer) : boolean;
begin
  // A year is a leap year if it is divisible by 4,
  // except for years that are divisible by 100,
  // unless they are also divisible by 400.
  if (year mod 4 <> 0) then
    result := false
  else if (year mod 100 <> 0) then
    result := true
  else if (year mod 400 = 0) then
    result := true
  else
    result := false;
end;

end.
