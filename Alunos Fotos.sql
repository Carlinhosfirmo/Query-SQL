SELECT
		--A.nome ,
		E.nome AS SÉRIE, 
		T.nome AS TURMA,
		Ano.nome  AS TIPO,
		T.turno AS TURNO,
	SUM (CONVERT(INT,(A.fotografia))) AS FOTOS,
	COUNT(CASE WHEN A.fotografia = 0 then 'valor' end ) AS 'SEM FOTOS',
	COUNT(E.nome) AS 'TOTAL DE ALUNOS'
	
FROM dbo.alunos AS A
	 INNER JOIN dbo.turmas AS T ON A.idturma = T.id
	 INNER JOIN dbo.educacaoetapas AS E ON T.etapa = E.id
	 INNER  JOIN dbo.educacaotipos AS Ano ON T.tipo = Ano.id
--WHERE A.fotografia = 1

GROUP BY E.nome, T.nome, Ano.nome, t.turno

ORDER BY SÉRIE,		
		CASE 			 
			WHEN T.turno = 'M' THEN 1
			WHEN T.turno = 'V' THEN 2
			ELSE 3
			END, 
			 
		 TURMA