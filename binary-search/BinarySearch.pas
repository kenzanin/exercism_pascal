unit BinarySearch;

{$mode ObjFPC}{$H+}

interface

type
  TExtendedArray = Array Of Extended;

function find(const AArray: TExtendedArray; const AValue : Extended) : Integer;

implementation

uses SysUtils;

function find(const AArray: TExtendedArray; const AValue : Extended) : Integer;
var
  left, right, mid: Integer;
begin
  left := 0;
  right := High(AArray);
  while left <= right do
  begin
    mid := (left + right) div 2;
    if AArray[mid] = AValue then
    begin
      Result := mid;
      Exit;
    end
    else if AArray[mid] < AValue then
      left := mid + 1
    else
      right := mid - 1;
  end;
  raise Exception.Create('value not in array');
end;

end.
