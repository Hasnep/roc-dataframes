interface DataFrame
    exposes [
        DataFrame,
        fromSeries,
        nRows,
        nColumns,
        getBoolColumnByName,
        getU64ColumnByName,
        getU32ColumnByName,
        getI64ColumnByName,
        getI32ColumnByName,
        getF64ColumnByName,
        getF32ColumnByName,
        getStrColumnByName,
        getOptionalBoolColumnByName,
        getOptionalU64ColumnByName,
        getOptionalU32ColumnByName,
        getOptionalI64ColumnByName,
        getOptionalI32ColumnByName,
        getOptionalF64ColumnByName,
        getOptionalF32ColumnByName,
        getOptionalStrColumnByName,
    ]
    imports [
        Series,
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

DataFrame := List Series.Series

fromSeries : List Series.Series -> DataFrame
fromSeries = \listOfSeries ->
    @DataFrame listOfSeries

nRows : DataFrame -> Nat
nRows = \@DataFrame columns ->
    when List.get columns 0 is
        Ok column -> Series.len column
        Err _ -> 0

nColumns : DataFrame -> Nat
nColumns = \@DataFrame columns ->
    List.len columns

getBoolColumnByName : DataFrame, Str -> Result BoolSeries.BoolSeries [ColumnNameNotFound]
getBoolColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            Bool series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (BoolSeries.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getU64ColumnByName : DataFrame, Str -> Result U64Series.U64Series [ColumnNameNotFound]
getU64ColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            U64 series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (U64Series.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getU32ColumnByName : DataFrame, Str -> Result U32Series.U32Series [ColumnNameNotFound]
getU32ColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            U32 series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (U32Series.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getI64ColumnByName : DataFrame, Str -> Result I64Series.I64Series [ColumnNameNotFound]
getI64ColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            I64 series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (I64Series.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getI32ColumnByName : DataFrame, Str -> Result I32Series.I32Series [ColumnNameNotFound]
getI32ColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            I32 series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (I32Series.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getF64ColumnByName : DataFrame, Str -> Result F64Series.F64Series [ColumnNameNotFound]
getF64ColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            F64 series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (F64Series.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getF32ColumnByName : DataFrame, Str -> Result F32Series.F32Series [ColumnNameNotFound]
getF32ColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            F32 series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (F32Series.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getStrColumnByName : DataFrame, Str -> Result StrSeries.StrSeries [ColumnNameNotFound]
getStrColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            Str series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (StrSeries.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getOptionalBoolColumnByName : DataFrame, Str -> Result OptionalBoolSeries.OptionalBoolSeries [ColumnNameNotFound]
getOptionalBoolColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            OptionalBool series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (OptionalBoolSeries.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getOptionalU64ColumnByName : DataFrame, Str -> Result OptionalU64Series.OptionalU64Series [ColumnNameNotFound]
getOptionalU64ColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            OptionalU64 series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (OptionalU64Series.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getOptionalU32ColumnByName : DataFrame, Str -> Result OptionalU32Series.OptionalU32Series [ColumnNameNotFound]
getOptionalU32ColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            OptionalU32 series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (OptionalU32Series.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getOptionalI64ColumnByName : DataFrame, Str -> Result OptionalI64Series.OptionalI64Series [ColumnNameNotFound]
getOptionalI64ColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            OptionalI64 series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (OptionalI64Series.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getOptionalI32ColumnByName : DataFrame, Str -> Result OptionalI32Series.OptionalI32Series [ColumnNameNotFound]
getOptionalI32ColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            OptionalI32 series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (OptionalI32Series.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getOptionalF64ColumnByName : DataFrame, Str -> Result OptionalF64Series.OptionalF64Series [ColumnNameNotFound]
getOptionalF64ColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            OptionalF64 series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (OptionalF64Series.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getOptionalF32ColumnByName : DataFrame, Str -> Result OptionalF32Series.OptionalF32Series [ColumnNameNotFound]
getOptionalF32ColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            OptionalF32 series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (OptionalF32Series.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

getOptionalStrColumnByName : DataFrame, Str -> Result OptionalStrSeries.OptionalStrSeries [ColumnNameNotFound]
getOptionalStrColumnByName = \@DataFrame columns, columnName ->
    getColumnIfRightType = \column ->
        when column is
            OptionalStr series -> Ok series
            _ -> Err WrongType
    getColumnIfRightName = \series ->
        if (OptionalStrSeries.getName series) == columnName then
            Ok series
        else
            Err WrongName
    walkOutput = List.walkUntil
        columns
        ColumnNameNotFound
        (
            \_hasBeenFound, column ->
                when (column |> getColumnIfRightType |> Result.try getColumnIfRightName) is
                    Ok series -> Break (ColumnNameFound series)
                    Err _ -> Continue ColumnNameNotFound
        )
    when walkOutput is
        ColumnNameFound series -> Ok series
        ColumnNameNotFound -> Err ColumnNameNotFound

