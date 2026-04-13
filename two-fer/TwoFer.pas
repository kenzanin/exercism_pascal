unit TwoFer;

{$mode ObjFPC}{$H+}

interface

function TwoFer(const name : string) : string;

implementation

uses SysUtils;

function TwoFer(const name : string) : string;
begin
  if name = '' then
    result := 'One for you, one for me.'
  else
    result := Format('One for %s, one for me.', [name]);
end;

end.
