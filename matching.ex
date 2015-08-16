x = 1  # => 1
x  # => 1
1 = x  # => 1
2 = x  # => %MatchError{term: 1}

# 1 = unknown
# => %CompileError{description: "undefined function unknown/0", file: "nofile",
# =>  line: 1}

{a, b, c} = {:hello, "world", 42}  # => {:hello, "world", 42}
a  # => :hello
b  # => "world"

{a, b, c} = {:hello, "world"}  # => %MatchError{term: {:hello, "world"}}

{a, b, c} = [:hello, "world", "!"]  # => %MatchError{term: [:hello, "world", "!"]}

{:error, msg} = File.read("there/is/no/file")
msg  # => :enoent

[a, b, c] = [1, 2, 3]
a  # => 1

[head|tail] = [1, 2, 3]
head  # => 1
tail  # => [2, 3]

[h|t] = []  # => %MatchError{term: []}

list = [1, 2, 3]
[0|list]  # => [0, 1, 2, 3]

x = 1
x = 2  # => 2

x = 1
^x = 2  # => %MatchError{term: 2}

x = 1
{x, ^x} = {2, 1}  # => {2, 1}
x  # => 2

{x, x} = {1, 1}  # => {1, 1}
{x, x} = {1, 2}  # => %MatchError{term: {1, 2}}

[h|_] = [1, 2, 3]
h  # => 1
# _  # => %CompileError{description: "unbound variable _", file: "nofile", line: 3}

length([1, [2], 3])  # => 3
length([1, [2], 3]) = 3  # => %CompileError{description: "illegal pattern", file: "nofile", line: 1}

case {1, 2, 3} do
  {4, 5, 6} ->
    "This clause won't match"
  {1, x, 3} ->
    "This clause will match and x is #{x}"
  _ ->
    "This clause would match any value"
end  # => "This clause will match and x is 2"

x = 1
case 10 do
  ^x -> "Won't match"
  _ -> "Will match"
end  # => "Will match"

case {1, 2, 3} do
  {1, x, 3} when x > 0 ->
    "Will match"
  _ ->
    "Won't match"
end  # => "Will match"

# hd(1)  # => %ArgumentError{message: "argument error"}

case 1 do
  x when hd(x) -> "Won't match"
  x -> "Got: #{x}"
end  # => "Got: 1"

case :ok do
  :error -> "Won't match"
end  # => %CaseClauseError{term: :ok}

f = fn x, y when x > 0 -> x + y
       x, y -> x * y
    end  # => #Function<12.54118792/2 in :erl_eval.expr/5>
f.(1, 3)  # => 4
f.(-1, 3)  # => -3

cond do
  2 + 2 == 5 ->
    "This will not be true"
  2 * 2 == 3 ->
    "Nor this"
  1 + 1 == 2 ->
    "But this will"
end  # => "But this will"

cond do
  2 + 2 == 5 ->
    "This is never true"
  true ->
    "This is always true (equivalent to else)"
end  # => "This is always true (equivalent to else)"

# 最後にcondではnilとfalse以外はどんな値でもtrueとして扱うことに気をつけてください:
cond do
  hd([1, 2, 3]) ->
    "1 is considered as true"
end  # => "1 is considered as true"

if true do
  "This works!"
end  # => "This works!"

unless true do
  "This will never be seen"
end  # => nil

if nil do
  "This won't be seen"
else
  "This will"
end  # => "This will"

if true, do: (
  a = 1 + 2
  1 + 10
)  # => 11

if false, do: :this, else: :that  # => :that

is_number if true do
  1 + 2
end
# => %CompileError{description: "undefined function is_number/2", file: "nofile",
# =>  line: 1}

is_number(if true do
            1 + 2
          end)  # => true
