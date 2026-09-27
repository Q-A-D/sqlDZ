DECLARE @t TIME = '14:30:00';
DECLARE @d DATE = '2023-10-05';
DECLARE @dt DATETIME = '2023-10-05 14:30:00';
DECLARE @dt2 DATETIME2 = '2023-10-05 14:30:00.1234567';
DECLARE @dto DATETIMEOFFSET = '2023-10-05 14:30:00 +03:00';

SELECT 
    @t AS TimeVar,
    @d AS DateVar,
    @dt AS DateTimeVar,
    @dt2 AS DateTime2Var,
    @dto AS DateTimeOffsetVar,
    CAST(@dt AS DATE) AS CastToDate,
    CAST(@dt AS TIME) AS CastToTime,
    CONVERT(VARCHAR, @dt, 104) AS GermanDate,
    CONVERT(VARCHAR, @dt, 101) AS USDate,
    CONVERT(VARCHAR, @dt, 120) AS ODBCDate;
GO
