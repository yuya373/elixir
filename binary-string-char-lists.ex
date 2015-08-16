string = "hello"
is_binary string  # => true

string = "hełło"
byte_size string  # => 7
String.length string  # => 5

?a  # => 97
?ł  # => 322

String.codepoints("hełło")  # => ["h", "e", "ł", "ł", "o"]

bin = <<0, 1, 2, 3>>
byte_size bin  # => 4

String.valid?(<<97, 322>>)  # => true

# ヌルバイト`<<0>>を結合させて文字列のバイナリ表現を見ることはElixirにおいて一般的な技法です:
"hełło" <> <<0>>  # => <<104, 101, 197, 130, 197, 130, 111, 0>>

<<255>>  # => <<255>>
<<256>>  # => <<0>>
<<256 :: size(16)>>  # => <<1, 0>>
<<256 :: utf8>>  # => "Ā"
<<256 :: utf8, 0>>  # => <<196, 128, 0>>
<<97 :: utf8>>  # => "a"

<<1 :: size(1)>>  # => <<1::size(1)>>
<<0 :: size(1)>>  # => <<0::size(1)>>
<<2 :: size(1)>>  # => <<0::size(1)>>
is_binary(<<1 :: size(1)>>)  # => false
is_bitstring(<<1 :: size(1)>>)  # => true
bit_size(<<1 :: size(1)>>)  # => 1

<<0, 1, x>> = <<0, 1, 2>>
x  # => 2
<<0, 1, x>> = <<0, 1, 2, 3>>  # => %MatchError{term: <<0, 1, 2, 3>>}

# バイナリの全てのエントリーはちょうど8bitずつを期待していることに注意してください．
# しかしバイナリ修飾子を使うことで「残り」へマッチさせることができます:
<<0, 1, x :: binary>> = <<0, 1, 2, 3>>
x  # => <<2, 3>>

"he" <> rest = "hello"
rest  # => "llo"

# ご覧のとおり，単一引用符で囲まれた文字列はバイト列のかわりにコードポイントのリストを含んでいます
# (iexで はASCIIの範囲より外にある文字を含んでいると，コードポイントの数字しか表示しないことに注意してください)．
# 二重引用符で囲まれたものは文字列(つまりバイナリ)で，単一引用符で囲まれたものは文字のリスト(つまりリスト)です．
'hełło'  # => [104, 101, 322, 322, 111]
is_list 'hełło'  # => true
'hello'  # => 'hello'

to_string 'hello'  # => "hello"
to_char_list "hello"  # => 'hello'
to_char_list "hełło"  # => [104, 101, 322, 322, 111]
to_string :hello  # => "hello"
to_string 1  # => "1"










