IO.puts "Hello World"
# => Hello World
# => :ok
40 + 2
# => 42

"hello" <> " world"  # => "hello world"

10 / 2  # => 5.0

div(10, 2)  # => 5

rem 10, 3  # => 1

0b1010  # => 10
0b1  # => 1
0b10  # => 2

round 3.58  # => 4
trunc 3.58  # => 3

true == false  # => false

is_boolean false  # => true
is_boolean 1.0  # => false

:hello == :world  # => false

:true == true  # => true

is_atom true  # => true

"hello #{:world}"  # => "hello world"

"hello \nworld"  # => "hello \nworld"

IO.puts "hello \nworld"
# => hello
# => world
# => :ok

is_binary("hello")  # => true
byte_size("hellお") # => 7
String.length("hellお")  # => 5
byte_size("ハロー")  # => 9
String.length("ハロー")  # => 3

add = fn a, b -> a + b end  # => #Function<12.54118792/2 in :erl_eval.expr/5>
is_function(add)  # => true
is_function(add, 2)  # => true
is_function(add, 1)  # => false
add.(1, 2)  # => 3

add_two = fn a -> add.(a, 2) end  # => #Function<6.54118792/1 in :erl_eval.expr/5>
add_two.(2)  # => 4

x = 42
(fn -> x = 0 end).()
x  # => 42

length [1, 2, true, 3]  # => 4

list = [1, 2, 3]
hd(list)  # => 1
tl(list)  # => [2, 3]

hd []  # => %ArgumentError{message: "argument error"}

tuple = {:ok, "hello"}  # => {:ok, "hello"}
elem(tuple, 1)  # => "hello"
elem(tuple, 0)  # => :ok
put_elem(tuple, 1, "world")  # => {:ok, "world"}
tuple  # => {:ok, "hello"}

list = [1|[2|[3|[]]]]  # => [1, 2, 3]
[0] ++ list  # => [0, 1, 2, 3]
list ++ [4]  # => [1, 2, 3, 4]

File.read("/etc/hosts")
# => {:ok,
# =>  "##\n# Host Database\n#\n# localhost is used to configure the loopback interface\n# when the system is booting.  Do not change this entry.\n##\n127.0.0.1\tlocalhost\n255.255.255.255\tbroadcasthost\n::1             localhost \n"}
File.read("~/.vimrc")  # => {:error, :enoent}

# データ構造が持っている要素数を数える場合，Elixirは単純な規則: 操作が一定時間
# になる(つまり値があらかじめ計算されている)ものを関数名sizeと呼び，明示的に計
# 算が必要なものは関数名lengthと呼ぶという規則に従います．

[1, 2, 3] ++ [4, 5, 6]  # => [1, 2, 3, 4, 5, 6]
[1, 2, 3] -- [2]  # => [1, 3]

"foo" <> "bar"  # => "foobar"

true and true  # => true

false or is_atom(:example)  # => true

1 and true  # => %ArgumentError{message: "argument error: 1"}

false and raise("This error will never be raised")  # => false
1 || true  # => 1
false || 11  # => 11
nil && 13  # => nil
true && 17  # => 17
!true  # => false
!1  # => false
!nil  # => true

1 == 1  # => true
1 != 2  # => true
1 < 2  # => true

1 == 1.0  # => true
1 === 1.0  # => false

1 < :atom  # => true
# number < atom < reference < functions < port < pid < tuple < maps < list < bitstring
