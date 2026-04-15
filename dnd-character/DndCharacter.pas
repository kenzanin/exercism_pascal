unit DndCharacter;

{$mode ObjFPC}{$H+}

{$WARN 6058 OFF}
{$WARN 5071 OFF}

interface

type
  TCharacter = record
    strength     : integer;
    dexterity    : integer;
    constitution : integer;
    intelligence : integer;
    wisdom       : integer;
    charisma     : integer;
    hitpoints    : integer;
  end;

function modifier(const score : integer) : integer;
function ability : integer;
function character : TCharacter;

implementation

uses SysUtils, Math, Classes;

function modifier(const score : integer) : integer;
begin
  // D&D ability modifier: floor((score - 10) / 2)
  // Use Floor from Math and truncate to integer to handle negative correctly.
  Result := Trunc(Floor((score - 10) / 2));
end;

function ability : integer;
var
  rolls: array[1..4] of integer;
  i, sum, minv: integer;
begin
  // Roll 4d6, drop the lowest, and return the sum of the highest three.
  for i := 1 to 4 do
    rolls[i] := Random(6) + 1; // 1..6

  sum := 0;
  minv := MaxInt;
  for i := 1 to 4 do
  begin
    sum := sum + rolls[i];
    if rolls[i] < minv then
      minv := rolls[i];
  end;

  Result := sum - minv;
end;

function character : TCharacter;
begin
  // Build a character with six abilities and compute hitpoints from constitution.
  Result.strength := ability;
  Result.dexterity := ability;
  Result.constitution := ability;
  Result.intelligence := ability;
  Result.wisdom := ability;
  Result.charisma := ability;
  Result.hitpoints := 10 + modifier(Result.constitution);
end;

initialization
  Randomize;

end.
