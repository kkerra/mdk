SELECT *, TRIM(descr_part.value)
FROM Game
	CROSS APPLY STRING_SPLIT(description, '.') AS descr_part
	CROSS APPLY STRING_SPLIT(description, '.') AS name_part

SELECT 1,2,3
FROM (SELECT CategoryId, GameId
	  FROM Game) AS t
PIVOT( Count(GameId), MAX(Price)
		FOR CategoryId IN ([1],[2],[3])) AS pvt