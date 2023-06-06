interface Series
    exposes [Series, len]
    imports [
        BoolSeries,
        U64Series,
        U32Series,
        I64Series,
        I32Series,
        F64Series,
        F32Series,
        StrSeries,
        OptionalBoolSeries,
        OptionalU64Series,
        OptionalU32Series,
        OptionalI64Series,
        OptionalI32Series,
        OptionalF64Series,
        OptionalF32Series,
        OptionalStrSeries,
    ]

Series : [
    Bool BoolSeries.BoolSeries,
    U64 U64Series.U64Series,
    U32 U32Series.U32Series,
    I64 I64Series.I64Series,
    I32 I32Series.I32Series,
    F64 F64Series.F64Series,
    F32 F32Series.F32Series,
    Str StrSeries.StrSeries,
    OptionalBool OptionalBoolSeries.OptionalBoolSeries,
    OptionalU64 OptionalU64Series.OptionalU64Series,
    OptionalU32 OptionalU32Series.OptionalU32Series,
    OptionalI64 OptionalI64Series.OptionalI64Series,
    OptionalI32 OptionalI32Series.OptionalI32Series,
    OptionalF64 OptionalF64Series.OptionalF64Series,
    OptionalF32 OptionalF32Series.OptionalF32Series,
    OptionalStr OptionalStrSeries.OptionalStrSeries,
]

len : Series -> Nat
len = \series ->
    when series is
        Bool s -> BoolSeries.len s
        U64 s -> U64Series.len s
        U32 s -> U32Series.len s
        I64 s -> I64Series.len s
        I32 s -> I32Series.len s
        F64 s -> F64Series.len s
        F32 s -> F32Series.len s
        Str s -> StrSeries.len s
        OptionalBool s -> OptionalBoolSeries.len s
        OptionalU64 s -> OptionalU64Series.len s
        OptionalU32 s -> OptionalU32Series.len s
        OptionalI64 s -> OptionalI64Series.len s
        OptionalI32 s -> OptionalI32Series.len s
        OptionalF64 s -> OptionalF64Series.len s
        OptionalF32 s -> OptionalF32Series.len s
        OptionalStr s -> OptionalStrSeries.len s
