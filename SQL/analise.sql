USE serie2i_37398;

/* index.html 

	O usuário irá ver as séries e escolherá qual série quer ver.
*/

/* Mostra as informações sobre a série (nome, ano de lançamento e genero)

	OBS: por meio de um loop que incrementa o valor de cd_serie, será possível mostrar todas as séries no site.
 */
SELECT 
	nm_adotado_serie, nm_original_serie, aa_lancamento_serie
FROM 
	serie
WHERE 
	cd_serie = 1;

/* Seleciona o código do gênero para achá-lo na tabela dos gêneros*/
SELECT cd_genero FROM serie_genero WHERE cd_serie = 1;

/* Mostra o gênero */
SELECT nm_genero FROM genero WHERE cd_genero IN (1, 2);

/* serie.html

	O usuário irá ver informações sobre a série, como a sinopse, as temporadas e os episódios.
	Podendo selecionar uma temporada e ver as informações sobre os episódios.
*/

/* Mostra as informações sobre a série escolhida (nome, ano de lançamento, sinopse e genero) */
SELECT 
	nm_adotado_serie, nm_original_serie, aa_lancamento_serie, ds_sinopse_serie
FROM 
	serie
WHERE 
	cd_serie = 1;

/* Seleciona o código do gênero para achá-lo na tabela dos gêneros*/
SELECT cd_genero FROM serie_genero WHERE cd_serie = 1;

/* Mostra o gênero */
SELECT nm_genero FROM genero WHERE cd_genero IN (1, 2);

/* Mostra a quantidade de temporadas e episódios existentes */
SELECT COUNT(cd_temporada), COUNT(cd_episodio) FROM episodio WHERE cd_serie = 1;

/* Mostra todas as temporadas para que o usuário escolha */
SELECT cd_temporada FROM episodio WHERE cd_serie = 1;

/* Mostra as informações sobre os episódios de acordo com a temporada que o usuário escolheu 
(número do episódio, nome, data de exibição, duração, sinopse e observação) 

OBS: por meio de um loop que incrementa o valor de cd_episodio será possível mostrar todos os episódios da temporada */
SELECT
	cd_episodio,
	nm_original_episodio,
	nm_adotado_episodio,
	DATE_FORMAT(dt_exibicao_episodio, "%d/%m/%Y"),
	ii_duracao_episodio,
	ds_sinopse_episodio,
	ds_obs_episodio
FROM
	episodio
WHERE
	cd_temporada = 1 AND
	cd_serie = 1;