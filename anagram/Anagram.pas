unit Anagram;

{$mode ObjFPC}{$H+}

interface

type
  TStrArray = Array Of String;

function FindAnagrams(
  const subject    : string;
  const candidates : TStrArray
) : TStrArray;

implementation

uses SysUtils;

function FindAnagrams(
  const subject    : string;
  const candidates : TStrArray
) : TStrArray;
var
  normalizedSubject: string = '';
  sortedSubject: string = '';
  i: Integer;
  candidate: string = '';
  normalizedCandidate: string = '';
  sortedCandidate: string = '';
  matches: TStrArray = nil;

  function Normalize(const s: string): string;
  begin
    Normalize := LowerCase(s);
  end;

  function SortString(const s: string): string;
  var
    arr: array of Char = nil;
    j, k: Integer;
    temp: Char;
    sorted: string = '';
  begin
    SetLength(arr, Length(s));
    for j := 1 to Length(s) do arr[j-1] := s[j];
    // Simple bubble sort
    for j := 0 to High(arr)-1 do
      for k := 0 to High(arr)-j-1 do
        if arr[k] > arr[k+1] then begin temp := arr[k]; arr[k] := arr[k+1]; arr[k+1] := temp; end;
    SetLength(sorted, Length(s));
    for j := 0 to High(arr) do sorted[j+1] := arr[j];
    Result := sorted;
  end;

begin
  normalizedSubject := Normalize(subject);
  sortedSubject := SortString(normalizedSubject);
  SetLength(matches, 0);

  for i := 0 to High(candidates) do
  begin
    candidate := candidates[i];
    normalizedCandidate := Normalize(candidate);
    if normalizedCandidate = normalizedSubject then continue; // identical word
    sortedCandidate := SortString(normalizedCandidate);
    if sortedCandidate = sortedSubject then
    begin
      SetLength(matches, Length(matches) + 1);
      matches[High(matches)] := candidate;
    end;
  end;
  Result := matches;
end;

end.
