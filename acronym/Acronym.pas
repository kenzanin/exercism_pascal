unit Acronym;

{$mode ObjFPC}{$H+}

interface

function abbreviate(const phrase: string) : string;

implementation

uses SysUtils;

function abbreviate(const phrase: string) : string;
var
  i: integer;
  len: integer;
  resultStr: string;
  inWord: boolean;
  ch: char;
begin
  resultStr := '';
  inWord := false;
  len := Length(phrase);
  
  for i := 1 to len do
  begin
    ch := phrase[i];
    
    // Check if character is a letter or apostrophe (part of a word)
    if (((ch >= 'A') and (ch <= 'Z')) or ((ch >= 'a') and (ch <= 'z')) or (ch = '''')) then
    begin
      // If we're not already in a word, this is the start of a new word
      if not inWord then
      begin
        // Only add the first letter of each word (not apostrophes)
        if ((ch >= 'A') and (ch <= 'Z')) or ((ch >= 'a') and (ch <= 'z')) then
          resultStr := resultStr + UpCase(ch);
        inWord := true;
      end;
    end
    else
    begin
      // Any non-letter, non-apostrophe character ends the current word
      inWord := false;
    end;
  end;
  
  result := resultStr;
end;

end.
