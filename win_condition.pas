unit win_condition;

interface
    uses types;

    type{vector}
    TVector<T> = class
      private
        type
        TmyArray = array of T;

      public
        type
        comparator = function(const a,b:T):bool;
        at_res_t = ^T;
      private
        var
        myArray:TmyArray;
        size:longWord;
        capacity:longword;
        //procedure swap(var a,b:T);inline;
      public
        constructor create();                        overload;
        constructor create(const other:TVector<T>);  overload;
        procedure push_back(const value:T);
        procedure pop_back();
        function get_size():longWord;
        function at(index:longWord):at_res_t;
        destructor destroy();
    end;{vector}

    type
    TCode = pair<byte,TVector <bool> >;
    TData = pair<longWord,byte>;
    TCodeTable  = TVector<TCode>;

    type{haf_tree}
    THafm_Tree = class
      public
        type
        hafCode   = TVector<bool>;
      private
        type
        TData = pair_LW_b;
        TNodePTR = ^TNode;
        TNode = record
            left  : TNodePTR;
            right : TnodePTR;
            parent: TNodePTR;
            next  : TNodePTR;
            prev  : TNodePTR;
            data  : TData;
        end;

        var
        length    : LongWord;
        Tree_root : TNodePTR;
        nodes_counter: longWord;

        procedure   delNode(node:TNodePTR);
        function    findMin():TNodePTR;
      public
        constructor create();
        function    get_root():TNodePTR;
        procedure   push_back(info:TData);
        procedure   createHafTree();
        procedure   getCodes(var ct:TcodeTable);
        destructor  destroy();
    end;{haf_tree end}

    type
    TMainNode = THafm_Tree.TNode;
    TMainNodePTR = THafm_Tree.TNodePTR;

implementation
{ TVecotr<T> }
function TVector<T>.at(index: longWord): at_res_t;
begin
    result := addr(myArray[index]);
end;
constructor TVector<T>.create();
begin
    size:=0;
    capacity:=50;
    setlength(myArray,capacity);
end;
constructor TVector<T>.create(const other: TVector<T>);
begin
    size := other.size;
    capacity := other.capacity;
    myArray := copy(other.myArray,0,other.capacity-1);
end;
destructor TVector<T>.destroy;
begin
    myArray := nil;
end;
function TVector<T>.get_size: longWord;
begin
    result := size;
end;
procedure TVector<T>.pop_back;
begin
    dec(size)
end;
procedure TVector<T>.push_back(const value:T);
begin
    if (size = capacity) then
    begin
        capacity := round(capacity * 2.5);
        setLength(myArray,capacity);
        myArray[size]:= value;
        inc(size);
    end
    else
    begin
        myArray[size]:=value;
        inc(size);
    end;
end;
//procedure TVector<T>.swap(var a,b:T);
//var   temp:T;
//begin
//    temp:=a;a:=b;b:=temp;
//end;
{ TVecotr<T> end}

{lazha}
constructor THafm_Tree.create();
begin
    Tree_root := nil;
    length := 0;
    nodes_counter := 0;
end;
procedure THafm_Tree.createHafTree;
var
    q1,q2,q3:TNodePTR;
begin
    if length = 1 then
    begin
        getMem(q3,sizeof(TNode));
        q3.left := nil;
        q3.right := tree_root;
        q3.parent := nil;
        q3.next := nil;
        q3.prev := nil;
        q3.data.first := tree_root.data.first;
        q3.data.second := tree_root.data.second;
        tree_root.parent := q3;
        tree_root := q3;
        exit;
    end;

    while (length > 1) do
    begin
        q1 := self.findMin();
        if (q1 = tree_root) then
        begin
            tree_root := q1.next;
            q1.prev := nil;
        end
        else
        begin
            q1.prev.next := q1.next;
            if q1.next <> nil then
                q1.next.prev := q1.prev;
        end;
        q1.next := nil;
        q1.prev := nil;

        q2 := self.findMin();
        getMem(q3,sizeof(TNode));
        q3^ := q2^;
        q3.next := nil;
        q3.prev := nil;

        q1.parent := q2;
        q3.parent := q2;
        q2.data.first   := q3.data.first + q1.data.first;
        q2.data.second  := 0;
        q2.left   := q1;
        q2.right  := q3;

        dec(length);
        inc(nodes_counter);
    end;
end;
procedure THafm_Tree.delNode(node: TNodePTR);
begin
    if (node <> nil) then
    begin
        delNode(node.left);
        delNode(node.right);
        FreeMem(Node);
    end;
end;
destructor THafm_Tree.destroy;
begin
    delNode(tree_root);
end;
function THafm_Tree.findMin: TNodePTR;
var q1:TnodePTR;
begin
    result := tree_root;
    q1 := tree_root.next;
    while (q1 <> nil) do
    begin
        if q1.data.first < result.data.first then
            result := q1;
        q1 := q1.next;
    end;
end;
procedure THafm_Tree.getCodes(var ct:TCodeTable);
var
    oneCode:TCode;
    procedure ttt(code: Tcode; node: TNodePTR);
    var
    codeL,codeR:TCode;
    begin
        if (node = nil) then exit;
        if ((node.left = nil)and(node.right = nil)) then
        begin
            code.first := node.data.second;
            ct.push_back(code);
            exit;
        end;
        codel.first := 0;
        codel.second:=TVector<bool>.create(code.second);
        codeR.first := 0;
        codeR.second:=TVector<bool>.create(code.second);

        codeL.second.push_back(false);
        ttt(codeL,node.left);
        codeR.second.push_back(true);
        ttt(codeR,node.right);

        //codel.second.destroy;
        //coder.second.destroy;
    end;
begin
    onecode.first := 0;
    onecode.second := TVector<bool>.create();
    ttt(oneCode,tree_root);
end;
function THafm_Tree.get_root: TNodePTR;
begin
    result := tree_root;
end;

procedure THafm_Tree.push_back(info: TData);
var q:TnodePTR;
begin

    if (length = 0) then
    begin
        getMem(q,sizeof(TNode));
        tree_root:= q;
        tree_root.data := info;
        tree_root.left := nil;
        tree_root.right := nil;
        tree_root.next := nil;
        tree_root.prev := nil;
        tree_root.parent := nil;
        inc(length);

        exit;
    end;

    q := tree_root;
    while (q.next <> nil) do
        q := q.next;
    GetMem(q.next,sizeof(TNode));
    q.next.prev := q;
    q.next.left := nil;
    q.next.right := nil;
    q.next.parent := nil;
    q.next.next := nil;
    q.next.data := info;
    inc(length);
end;

end.
