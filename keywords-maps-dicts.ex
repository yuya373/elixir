list = [{:a, 1}, {:b, 2}]
list == [a: 1, b: 2]  # => true
list[:a]  # => 1
list ++ [c: 3]  # => [a: 1, b: 2, c: 3]
[a: 0] ++ list  # => [a: 0, a: 1, b: 2]

list = [a: 0, a: 1, b: 2]
list[:a]  # => 0

if(false, [do: :this, else: :that])  # => :that
if(false, do: :this, else: :that)  # => :that

[a: a] = [a: 1]  # => [a: 1]
a  # => 1

[a: a] = [a: 1, b: 2]  # => %MatchError{term: [a: 1, b: 2]}
[b: b, a: a] = [a: 1, b: 2]  # => %MatchError{term: [a: 1, b: 2]}

map = %{:a => 1, 2 => :b}
map[:a]  # => 1
map[2]  # => :b

%{1 => 1, 1 => 2}  # => %{1 => 2}

%{} = %{:a => 1, 2 => :b}  # => %{2 => :b, :a => 1}
%{:a => a} = %{:a => 1, 2 => :b}  # => %{2 => :b, :a => 1}
a  # => 1

%{:c => c} = %{:a => 1, 2 => :b}  # => %MatchError{term: %{2 => :b, :a => 1}}

map = %{:a => 1, 2 => :b}  # => %{2 => :b, :a => 1}
map.a  # => 1
%{map | :a => 2}  # => %{2 => :b, :a => 2}
%{map | :c => 3}  # => %KeyError{key: :c, term: %{2 => :b, :a => 1}}

hdic = HashDict.new
hdic = HashDict.put(hdic, :k, :v)  # => #HashDict<[k: :v]>
HashDict.get(hdic, :k)  # => :v

keyword = []
map = %{}
keyword = Dict.put(keyword, :a, 1)  # => [a: 1]
map = Dict.put(map, :a, 1)  # => %{a: 1}
Dict.equal?(keyword, map)  # => true
map = Dict.put(map, :b, 2)
Dict.equal?(keyword, map)  # => false
