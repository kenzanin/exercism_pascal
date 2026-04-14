unit Allergies;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function list(const score : integer) : TStrArray;
function AllergicTo(const item : string; const score : integer) : boolean;

implementation

uses SysUtils;

function list(const score : integer) : TStrArray;
var
  resultArr: TStrArray;
begin
  resultArr := [];
  
  // Check each allergen in order
  if score and 1 <> 0 then begin
    SetLength(resultArr, Length(resultArr) + 1);
    resultArr[High(resultArr)] := 'eggs';
  end;
  
  if score and 2 <> 0 then begin
    SetLength(resultArr, Length(resultArr) + 1);
    resultArr[High(resultArr)] := 'peanuts';
  end;
  
  if score and 4 <> 0 then begin
    SetLength(resultArr, Length(resultArr) + 1);
    resultArr[High(resultArr)] := 'shellfish';
  end;
  
  if score and 8 <> 0 then begin
    SetLength(resultArr, Length(resultArr) + 1);
    resultArr[High(resultArr)] := 'strawberries';
  end;
  
  if score and 16 <> 0 then begin
    SetLength(resultArr, Length(resultArr) + 1);
    resultArr[High(resultArr)] := 'tomatoes';
  end;
  
  if score and 32 <> 0 then begin
    SetLength(resultArr, Length(resultArr) + 1);
    resultArr[High(resultArr)] := 'chocolate';
  end;
  
  if score and 64 <> 0 then begin
    SetLength(resultArr, Length(resultArr) + 1);
    resultArr[High(resultArr)] := 'pollen';
  end;
  
  if score and 128 <> 0 then begin
    SetLength(resultArr, Length(resultArr) + 1);
    resultArr[High(resultArr)] := 'cats';
  end;
  
  result := resultArr;
end;

function AllergicTo(const item : string; const score : integer) : boolean;
begin
  if item = 'eggs' then
    result := (score and 1) <> 0
  else if item = 'peanuts' then
    result := (score and 2) <> 0
  else if item = 'shellfish' then
    result := (score and 4) <> 0
  else if item = 'strawberries' then
    result := (score and 8) <> 0
  else if item = 'tomatoes' then
    result := (score and 16) <> 0
  else if item = 'chocolate' then
    result := (score and 32) <> 0
  else if item = 'pollen' then
    result := (score and 64) <> 0
  else if item = 'cats' then
    result := (score and 128) <> 0
  else
    result := false;
end;


end.
