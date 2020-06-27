unit file_functions;

interface
    uses types;
function getVoidFileName(FullName:string):string;

function getFileExtended(FullName:string):string;

procedure make_file_write(var currFile:TFileB;B:byte);        overload;inline;
procedure make_file_write(var currFile:TFileB;W:word);        overload;inline;
procedure make_file_write(var currFile:TFileB;LW:longWord);   overload;inline;
procedure make_file_write(var currFile:TFileB;str:string);    overload;inline;

procedure read_from_file(var currFile:TFileB;var W:Word);

procedure writeExt(var f:TFileB;FN:string);

function readExt(var F:TFileB):string;
implementation
function getVoidFileName(FullName:string):string;
    var i:int;
begin
    i:=length(Fullname)-1;
    while (i>0)and(FullName[i] <> '.') do
        dec(i);

    if i>0 then
        result := copy(FullName,1,i-1)
    else
        result := FullName;
end;
function getFileExtended(FullName:string):string;
var
    i     : int;
begin
    i := length(fullName);
    while (i>0)and(fullName[i]<>'.') do
        dec(i);

    if i = 0 then
        result := ''
    else
        result := copy(FullName,i+1,length(fullName)-i);
end;
procedure make_file_write(var currFile:TFileB;B:byte);
begin
    write(currFile,B);
end;
procedure make_file_write(var currFile:TFileB;W:word);
var
        temp    : byte;
        i       : byte;
begin
    for i := 0 to 1 do
    begin
        temp := W mod 256;
        write(currFile,temp);
        W := W shr 8;
    end;
end;
procedure make_file_write(var currFile:TFileB;LW:longWord);
    var
        temp    : byte;
        i       : byte;
begin
    for i:=0 to 3 do
    begin
        temp := Lw mod 256;
        write(currFile,temp);
        lw := lw shr 8;
    end;
end;
procedure make_file_write(var currFile:TFileB;str:string);
var
    i     : int;
    temp  : byte;
begin
    for i:=1 to length(str) do
    begin
        temp := ord(str[i]);
        write(currFile,temp);
    end;
end;
procedure read_from_file(var currFile:TFileB;var W:Word);
var
          t         : array[0..1] of byte;
begin
    read(currFile,t[0]);
    read(currFile,t[1]);
    w := t[1] shl 8 + t[0];
end;
procedure writeExt(var f:TFileB;FN:string); overload;
var
          i       : int;
          extL    : byte;
          symbol  : byte;
begin
    i:=length(Fn);
    extL := 0;
    while (i>0)and(fn[i] <> '.') do
    begin
        dec(i);
        inc(extL);
    end;
    if i=0 then
    begin
        make_file_write(f,0);
        exit;
    end;

    write(f,extL);
    inc(i);
    for i:=i to length(fn) do
    begin
        symbol := ord(fn[i]);
        write(f,symbol);
    end;
end;
function readExt(var F:TFileB):string;
var
          ELength : byte;
          i       : byte;
          symbol  : byte;
begin
    read(F,ELength);
    for i:=1 to ELength do
    begin
        read(F,symbol);
        result := result + chr(symbol);
    end;
end;


end.
