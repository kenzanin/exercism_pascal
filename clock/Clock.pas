unit Clock;

{$mode ObjFPC}{$H+}

interface

function create(const hour, minute : integer) : string;
function add(const hour, minute, value : integer) : string;
function subtract(const hour, minute, value : integer) : string;
function equal(const hour1, minute1, hour2, minute2 : integer) : boolean;

implementation

uses SysUtils, DateUtils;

function create(const hour, minute : integer) : string;
var
  total, h, m: integer;
  function two(n: integer): string;
  begin
    if n < 10 then Result := '0' + IntToStr(n) else Result := IntToStr(n);
  end;
begin
  total := ((hour * 60) + minute) mod 1440;
  if total < 0 then total := total + 1440;
  h := total div 60;
  m := total mod 60;
  Result := two(h) + ':' + two(m);
end;

function add(const hour, minute, value : integer) : string;
begin
  Result := create(hour, minute + value);
end;

function subtract(const hour, minute, value : integer) : string;
begin
  Result := create(hour, minute - value);
end;

function equal(const hour1, minute1, hour2, minute2 : integer) : boolean;
begin
  result := create(hour1, minute1) = create(hour2, minute2);
end;

end.
