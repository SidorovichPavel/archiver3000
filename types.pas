unit types;

interface

    type
    TFileB = file of byte;
    TFileW = file of word;
    int = integer;
    bool = boolean;

    pair<T,U> = record
        first:T;
        second:U;
    end;

    pair_lw_b = record
        first:LongWord;
        second:byte;
    end;

implementation

end.
