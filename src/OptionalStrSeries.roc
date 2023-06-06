interface OptionalStrSeries
    exposes [OptionalStrSeries, fromListAndName, getName, toList, len, get]
    imports []

OptionalStrSeries := { name : Str, data : List [Some Str, None] }

fromListAndName : List [Some Str, None], Str -> OptionalStrSeries
fromListAndName = \data, name ->
    @OptionalStrSeries { name: name, data: data }

# expect
#     out = fromListAndName [] "test"
#     out == @OptionalStrSeries { name: "test", data : [] }

getName : OptionalStrSeries -> Str
getName = \@OptionalStrSeries { name } ->
    name

toList : OptionalStrSeries -> List [Some Str, None]
toList = \@OptionalStrSeries { data } ->
    data

len : OptionalStrSeries -> Nat
len = \series ->
    series |> toList |> List.len

get : OptionalStrSeries, Nat -> Result [Some Str, None] [OutOfBounds]
get = \series, index ->
    series |> toList |> List.get index
