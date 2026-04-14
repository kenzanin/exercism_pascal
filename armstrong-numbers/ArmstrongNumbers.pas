unit ArmstrongNumbers;

{$mode ObjFPC}{$H+}

interface

function IsArmstrongNumber(const number: qword) : boolean;

implementation

uses SysUtils;

function DigitCount(N: qword): Integer;
begin
  Result := 0;
  while N > 0 do
  begin
    Inc(Result);
    N := N div 10;
  end;
  if Result = 0 then Result := 1;
end;

function Power(Base, Exp: Integer): qword;
var
  i: Integer;
begin
  Result := 1;
  for i := 1 to Exp do
    Result := Result * Base;
end;

function IsArmstrongNumber(const number: qword) : boolean;
var
  temp, sum, digits, digit: qword;
begin
  temp := number;
  digits := DigitCount(number);
  sum := 0;
  temp := number;
  while temp > 0 do
  begin
    digit := temp mod 10;
    sum := sum + Power(Integer(digit), digits);
    temp := temp div 10;
  end;
  Result := sum = number;
end;

end.
