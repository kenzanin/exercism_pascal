unit ResistorColor;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function ColorCode(const color : string) : int8;
function colors : TStrArray;

implementation

uses SysUtils;

function ColorCode(const color : string) : int8;
const
  colorList: array[0..9] of string = (
    'black', 'brown', 'red', 'orange', 'yellow',
    'green', 'blue', 'violet', 'grey', 'white'
  );
var
  i: integer;
begin
  for i := 0 to High(colorList) do
    if color = colorList[i] then
    begin
      result := i;
      exit;
    end;
  raise Exception.Create('Invalid color');
end;

function colors : TStrArray;
begin
  result := nil;
  SetLength(result, 10);
  result[0] := 'black';
  result[1] := 'brown';
  result[2] := 'red';
  result[3] := 'orange';
  result[4] := 'yellow';
  result[5] := 'green';
  result[6] := 'blue';
  result[7] := 'violet';
  result[8] := 'grey';
  result[9] := 'white';
end;

end.
