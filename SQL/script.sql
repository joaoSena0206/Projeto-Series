DROP SCHEMA IF EXISTS serie2i_37398;
CREATE SCHEMA serie2i_37398;
USE serie2i_37398;

CREATE TABLE serie
(
	cd_serie INT AUTO_INCREMENT,
	nm_adotado_serie VARCHAR(200),
	nm_original_serie VARCHAR(200),
	aa_lancamento_serie YEAR,
	ds_sinopse_serie TEXT,
	CONSTRAINT pk_serie PRIMARY KEY (cd_serie)
);

CREATE TABLE genero
(
	cd_genero INT,
	nm_genero VARCHAR(50),
	CONSTRAINT pk_genero PRIMARY KEY (cd_genero)
);

CREATE TABLE serie_genero
(
	cd_serie INT,
	cd_genero INT,
	CONSTRAINT pk_serie_genero PRIMARY KEY (cd_serie, cd_genero),
	CONSTRAINT fk_serie_serie_genero FOREIGN KEY (cd_serie) REFERENCES serie (cd_serie),
	CONSTRAINT fk_genero_serie_genero FOREIGN KEY (cd_genero) REFERENCES genero (cd_genero)
);

CREATE TABLE episodio
(
	cd_serie INT,
	cd_temporada INT,
	cd_episodio INT,
	nm_adotado_episodio VARCHAR(200),
	nm_original_episodio VARCHAR(200),
	ds_sinopse_episodio TEXT,
	dt_exibicao_episodio DATE,
	ii_duracao_episodio INT,
	ds_obs_episodio TEXT,
	CONSTRAINT pk_episodio PRIMARY KEY (cd_episodio, cd_temporada, cd_serie),
	CONSTRAINT fk_serie_episodio FOREIGN KEY (cd_serie) REFERENCES serie (cd_serie)
);

/* SERIE */

INSERT INTO serie (nm_adotado_serie, nm_original_serie, aa_lancamento_serie, ds_sinopse_serie) VALUES
(
	'The Walking Dead',
	'The Walking Dead',
	2010,
	'Em The Walking Dead, depois de ser baleado e passar meses em coma, o xerife Rick Grimes (Andrew Lincolm) acorda sozinho em um hospital deserto. Para sua surpresa, o mundo como conhecia deixou de existir depois que um perigoso vírus provoca uma infestação de zumbis na cidade de Cynthiana, em Kentucky, nos Estados Unidos. Desesperado, Rick enfrenta a estranha ameaça na expectativa de reencontrar a mulher Lori (Sarah Wayne Callies) e o filho Cal (Chandler Riggs). Ele decide unir-se aos homens e mulheres sobreviventes para que tenham mais força para combater o fenômeno que os atinge. O grupo percorre diferentes lugares em busca de soluções para o problema. Aos poucos, eles percebem que a infestação de mortos é maior do que pensavam, se espalhando por todo o país, e possivelmente o resto do mundo. A sociedade que conheciam já não existe mais e tudo que resta é o desejo de sobreviver. Em meio ao caos da nova ordem mundial, Rick e seus companheiros percebem que os humanos sobreviventes podem ser uma ameaça maior que os próprios zumbis.'
);

INSERT INTO serie (nm_adotado_serie, nm_original_serie, aa_lancamento_serie, ds_sinopse_serie) VALUES
(
	'O Escritório',
	'The Office',
	2005,
	'No mesmo formato de pseudodocumentário da série britânica, The Office retrata o cotidiano de um escritório em Scranton, na Pensilvânia. Filial da empresa fictícia Dunder Mifflin, os funcionários tem como função vender o suprimento de papel fornecido pela companhia. Michael Scott (Steve Carell), gerente da franquia, é um chefe incoerente e imaturo mas que se preocupa com o bem estar de seus empregados. Assim, The Office traça um olhar cômico e honesto sobre seus personagens, destacando suas diferenças e particularidades e como isso afeta a convivência diária durante o trabalho. Embora, à princípio, não exista um laço emocional muito forte entre eles, aos poucos amizades são formadas e os funcionários da Dunder Mifflin se tornam uma espécie de segunda família. Entre as relações mais memoráveis de The Office está o casal Jim (John Krasinski), um vendedor, e Pam (Jenna Fischer), a recepcionista. Ao longo das temporadas, a adorável amizade entre os dois se transforma em um intenso amor romântico.'
);

INSERT INTO serie (nm_adotado_serie, nm_original_serie, aa_lancamento_serie, ds_sinopse_serie) VALUES
(
	'Os Simpsons',
	'The Simpsons',
	1989,
	'Uma animação sobre uma típica família de classe média americana. Homer é o pai nada saudável ou inteligente, que adora beber cerveja. Marge é a esposa e mãe dedicada. Bart é o filho de 10 anos, que não leva a escola a sério e tem orgulho disso. Lisa é a garota de oito anos, um gênio não apreciado. E Maggie é o bebê que não larga a chupeta.'
);

INSERT INTO serie (nm_adotado_serie, nm_original_serie, aa_lancamento_serie, ds_sinopse_serie) VALUES
(
	'Futurama',
	'Futurama',
	1999,
	'Philip J. Fry é um rapaz de Nova York que trabalha como entregador de pizza no final do século XX. Um dia ele acidentalmente foi congelado criogenicamente e assim ficou por centenas de anos, até que descongelou na Nova York do século XXXI, uma época cheia de maravilhas tecnológicas e com um grande abuso de substâncias químicas e seres estranhos. Fry consegue um emprego de entregador no Planet Express, empresa de seu único parente que está vivo, o professor Hubert J. Farnsworth. Lá, ele conhece Turanga, a capitã ciclope da Nave Planet Express, e o Bernder, um robô alcoólatra, fumante, cleptomaníaco e egocêntrico que se torna o melhor amigo de Fry.'
);


INSERT INTO serie (nm_adotado_serie, nm_original_serie, aa_lancamento_serie, ds_sinopse_serie) VALUES
(
	'A Anatomia de Grey',
	'Grey\'s Anatomy',
	2005,
	"Em Grey's Anatomy, os médicos do Grey Sloan Memorial Hospital/Seattle Grace Hospital lidam diariamente com casos de vida ou morte. É um no outro que eles encontram apoio, conforto, amizade e até mesmo amor. Juntos, eles se esforçam para conciliar os dramas profissionais com os pessoais, descobrindo que ambos podem – e vão – se misturar no meio do caminho. Entre os funcionários do local está Meredith Grey (Ellen Pompeo), filha de um cirurgião conceituado e recém-chegada ao programa de residência. Ela divide as preocupações do ofício com os internos Cristina Yang (Sandra Oh), Izzie Stevens (Katherine Heigl), Alex Karev (Justin Chambers) e George O'Malley (T. R. Knight). Todos passam pela supervisão de três renomados doutores: Miranda Bailey (Chandra Wilson), uma residente sênior que trabalha para ajudar Derek Shepherd (Patrick Dempsey), chefe de neurocirurgia e interesse amoroso de Grey; Preston Burke (Isaiah Washington), chefe do departamento de cardio e futuro noivo de Yang; e Richard Webber (James Pickens Jr.), chefe de cirurgia e cirurgião geral adjunto. Cada um deles luta para sobreviver em meio a longos expedientes e agitados treinamentos, dando o melhor de si nessa carreira tão importante quanto difícil."
);

INSERT INTO serie (nm_adotado_serie, nm_original_serie, aa_lancamento_serie, ds_sinopse_serie) VALUES
(
	'Uma Família da Pesada',
	'Family Guy',
	1999,
	'A casa da família Griffin abriga dois adolescentes, um cachorrro cínico que é mais esperto que todos os humanos, e um bebê maléfico que arquiteta inúmeras tentativas de erradicar sua mãe. Encabeçando essa família estranha está Peter Griffin, que dá o seu melhor para fazer o que é certo, mas no meio do caminho comete erros legendários.'
);

/* GENERO */

INSERT INTO genero VALUES
(
	1,
	'Apocalipse Zumbi'	
);

INSERT INTO genero VALUES
(
	2,
	'Drama'	
);

INSERT INTO genero VALUES
(
	3,
	'Terror'
);

INSERT INTO genero VALUES
(
	4,
	'Comédia'
);

INSERT INTO genero VALUES
(
	5,
	'Animação'
);

INSERT INTO genero VALUES
(
	6,
	'Ficção científica'
);

INSERT INTO genero VALUES
(
	7,
	'Drama médico'
);

INSERT INTO genero VALUES
(
	8,
	'Romance'
);

INSERT INTO genero VALUES
(
	9,
	'Sitcom'
);

/* SERIE_GENERO */

INSERT INTO serie_genero VALUES
(
	1,
	1
);

INSERT INTO serie_genero VALUES
(
	1,
	2
);

INSERT INTO serie_genero VALUES
(
	1,
	3
);

INSERT INTO serie_genero VALUES
(
	2,
	4
);

INSERT INTO serie_genero VALUES
(
	2,
	9
);

INSERT INTO serie_genero VALUES
(
	3,
	4
);

INSERT INTO serie_genero VALUES
(
	3,
	5
);

INSERT INTO serie_genero VALUES
(
	4,
	4
);

INSERT INTO serie_genero VALUES
(
	4,
	6
);

INSERT INTO serie_genero VALUES
(
	4,
	5
);

INSERT INTO serie_genero VALUES
(
	5,
	7
);

INSERT INTO serie_genero VALUES
(
	5,
	2
);

INSERT INTO serie_genero VALUES
(
	5,
	8
);

INSERT INTO serie_genero VALUES
(
	6,
	4
);

INSERT INTO serie_genero VALUES
(
	6,
	5
);

/* EPISODIO */

/* The Walking Dead T1 */

INSERT INTO episodio VALUES
(
	1,
	1,
	1,
	'Dias Passados',
	'Days Gone Bye',
	'O oficial Rick Grimes (Andrew Lincoln) está gravemente ferido devido a um tiroteio. Quando acorda, o policial repara que está em um hospital abandonado e que o planeta foi dominado por zumbis. Ainda por cima, ele volta para casa e descobre que sua esposa Lori (Sarah Wayne Callies) e o filho Carl (Chandler Riggs) desapareceram.',
	'2010-10-31',
	90,
	NULL
);

INSERT INTO episodio VALUES
(
	1,
	1,
	2,
	'Entranhas',
	'Guts',
	'Depois de conseguir escapar, Rick (Andrew Lincoln) fica preso com Glenn (Steven Yeun) e um grupo de sobreviventes dentro de uma loja de departamentos cercada por zumbis.',
	'2010-11-07',
	90,
	NULL
);

INSERT INTO episodio VALUES
(
	1,
	1,
	3,
	'Diga aos Sapos',
	'Tell It to the Frogs',
	'Rick (Andrew Lincoln) decide retornar à cidade de Atlanta para resgatar Merle (Michael Rooker). Enquanto isso, a tensão domina no relacionamento entre sua esposa Lori (Sarah Wayne Callies), o filho Carl (Chandler Riggs) e outros os sobreviventes no acampamento.',
	'2010-11-14',
	90,
	NULL
);

INSERT INTO episodio VALUES
(
	1,
	1,
	4,
	'Vatos',
	'Vatos',
	'Na missão para salvar Merle (Michael Rooker), nem tudo funciona como Rick (Andrew Lincoln) esperava. Ele e o grupo que o acompanha se deparam com outros sobreviventes hostis enquanto, no acampamento, Jim (Andrew Rothenberg) está perturbado com um sonho do qual não se lembra integralmente mas que parece ter um poder decisivo.',
	'2010-11-21',
	90,
	NULL
);

/* The Walking Dead T2 */

INSERT INTO episodio VALUES
(
	1,
	2,
	1,
	'O Que Vem a Seguir',
	'What Lies Ahead',
	'O grupo de humanos caminha para Fort Benning e encontra com um bando de zumbis e Sophia (Madison Lintz) é perseguida por alguns deles e acaba se perdendo. Rick (Andrew Lincoln) e os sobreviventes iniciam uma busca pela moça.',
	'2011-10-16',
	90,
	NULL
);

INSERT INTO episodio VALUES
(
	1,
	2,
	2,
	'Sangria',
	'Bloodletting',
	'Carl (Chandler Riggs) é baleado e Rick (Andrew Lincoln) e Shane (Jon Bernthal) encontram um médico, o Dr. Hershel Greene (Scott Wilson), e sua família em um local próximo. O doutor consegue ajudá-los, mas não possui todo o material médico necessário para curar Carl.',
	'2011-10-23',
	90,
	NULL
);

INSERT INTO episodio VALUES
(
	1,
	2,
	3,
	'Guarda a Última',
	'Save the Last One',
	'Shane (Jon Bernthal) e Otis (Pruitt Taylor Vince) se esforçam para escapar dos zumbis que os cercaram enquanto buscavam os utensílios médicos para salvar Carl (Chandler Riggs). Este está piorando e precisa do equipamento o mais rápido possível.',
	'2011-10-30',
	90,
	NULL
);

INSERT INTO episodio VALUES
(
	1,
	2,
	4,
	'Rosa Cherokee',
	'Cherokee Rose',
	'Alguns sobreviventes chegam na residência dos Hershel e pedem para acampar em seu entorno. Rick (Andrew Lincoln) tenta convencer o Dr. Hershel Greene (Scott Wilson) a deixá-los ficarem em sua fazenda por mais um tempo. O grupo concentra-se na procura por Sophia.',
	'2011-11-06',
	90,
	NULL
);


/* THE OFFICE T1 */

INSERT INTO episodio VALUES
(
	2,
	1,
	1,
	'Pilot',
	'Pilot',
	'Michael tenta poupar a equipe, mantendo em segredo a notícia de uma possível redução de pessoal. O que só os deixará mais ansiosos quando descobrirem.',
	'2005-03-24',
	23,
	NULL
);

INSERT INTO episodio VALUES
(
	2,
	1,
	2,
	'Diversity Day',
	'Diversity Day',
	'O comportamento ofensivo do Michael faz com que a empresa patrocine um seminário sobre tolerância e diversidade racial. Jim tem dificuldade de garantir sua maior comissão anual.',
	'2005-03-15',
	23,
	NULL
);

/* THE OFFICE T2 */

INSERT INTO episodio VALUES
(
	2,
	2,
	1,
	'The Dundies',
	'The Dundies',
	"Os funcionários da Dunder Mifflin sofrem com a cerimônia de premiação anual de escritório: 'Os Dundies', apresentado por Michael no bar de costume, o restaurante Chili.",
	'2005-09-19',
	23,
	NULL
);

INSERT INTO episodio VALUES
(
	2,
	2,
	2,
	'Sexual Harassment',
	'Sexual Harassment',
	'A Matriz exige que os funcionários passem por treinamento sobre assédio sexual, mas Michael teme que a nova política faça com que o escritório fique menos divertido para todos.',
	'2007-02-25',
	23,
	NULL
);


/* THE SIMPSONS T1 */

INSERT INTO episodio VALUES
(
	3,
	1,
	1,
	'O prêmio de Natal',
	'Simpsons Roasting on an Open Fire',
	'Durante as compras de Natal, Bart foge e faz uma tatuagem. Marge descobre e usa as poupanças de Natal da família para a remover. Entretanto, Sr. Burns decide cancelar o bônus natalino de todos os seus empregados da Usina Nuclear de Springfield e a família fica sem dinheiro para comprar os presentes de Natal. Homer decide manter a crise financeira em segredo e arruma um trabalho como Papai Noel numa loja de departamentos, mas logo descobre que o trabalho não paga o suficiente. Desesperados, Homer e Bart vão em uma corrida de cachorros na véspera de Natal, na esperança de conseguir algum dinheiro. Homer aposta tudo num cachorro chamado Ajudante de Papai Noel, que perde. Furioso, o dono do cachorro o solta e Homer deixa Bart ficar com ele. Mais tarde, Homer tenta explicar que o Natal está estragado, mas Bart lembra-os que têm um cão e todos felizes dão as boas-vindas ao mais novo membro da família.',
	'1989-12-17',
	23,
	NULL
);

INSERT INTO episodio VALUES
(
	3,
	1,
	2,
	'Bart, o Gênio',
	'Bart the Genius',
	"Em um teste de inteligência, Bart troca o seu teste com o de Martin Prince, o gênio da turma, e tira a melhor nota. Devido ao resultado do teste, o psicólogo da escola diz que Bart é um gênio e manda-o para a 'Enriched Learning Center for Gifted Children', uma escola para crianças sobre-dotadas. Homer começa a tratar Bart com respeito, mas Bart sente-se deslocado entre seus colegas de turma e afastado dos seus antigos colegas. Bart confessa que trocou os testes e é mandado de volta para a Escola Elementar de Springfield.",
	'1990-01-14',
	23,
	NULL
);

/* THE SIMPSONS T2 */

INSERT INTO episodio VALUES
(
	3,
	2,
	1,
	'A prova final',
	'Bart Gets an F',
	'Bart tira uma nota baixa em uma prova e o psicólogo da escola diz que ele tem mais uma chance; se repetir o resultado negativo volta para a terceira série. Bart tenta fazer com que gênio da turma, Martin Prince, o ajude, mas não dá certo e Bart reza pedindo por ajuda. Nessa noite, Springfield é atingida com um grande nevão e a escola é fechada, dando a Bart mais um dia para estudar. Apesar de ter estudado muito, Bart tira uma nota baixa de novo. Enquanto se lamenta, ele menciona um obscuro evento histórico e a Sra. Krabappel, reparando que ele aplicou conhecimentos práticos, o passa de ano.',
	'1990-10-11',
	23,
	NULL
);

INSERT INTO episodio VALUES
(
	3,
	2,
	2,
	'Simpson e Dalila',
	'Simpson and Delilah',
	'Homer descobre uma nova fórmula milagrosa de crescimento de cabelo chamada Dimoxinil, e falsifica alguns formulários de segurança para que possa comprar o produto. O cabelo de Homer cresce durante a noite e ele é promovido na Usina Nuclear de Springfield. Ganha um novo secretário chamado Karl, que o ajuda a ter sucesso. No entanto, o assistente do Sr. Burns, Waylon Smithers, fica com inveja de toda a atenção que Homer está recebendo do Sr. Burns e descobre que ele falsificou seus formulários de segurança. Smithers tenta demitir Homer, mas Karl diz que foi ele quem falsificou os formulários e é demitido no lugar de Homer. Bart entorna o restante da garrafa de Dimoxinil e Homer perde todo seu cabelo. Como resultado, é mandado de volta para sua antiga função.',
	'1990-10-18',
	23,
	NULL
);

/* FUTURAMA T1 */

INSERT INTO episodio VALUES
(
	4,
	1,
	1,
	'Fry no Ano 3000',
	'Space Pilot 3000',
	'Um entregador de pizza chamado Philip J. Fry é criogenicamente congelado sem prévio aviso em 31 de dezembro de 1999 e acorda mil anos no futuro, onde conhece uma conselheira criogênica ciclope chamada Leela, um robô entortador chamado Bender e o seu sobrinho de várias gerações, o Professor Farnsworth. ',
	'1999-03-28',
	23,
	NULL
);

INSERT INTO episodio VALUES
(
	4,
	1,
	2,
	'Uma Viagem à Lua',
	'The Series Has Landed',
	'Depois de ter entregue uma encomenda em um parque temático na Lua, Fry mostra a Leela a beleza do corpo celeste enquanto Bender e Amy tentam recuperar a chave da nave. ',
	'1999-04-04',
	23,
	NULL
);

/* FUTURAMA T2 */

INSERT INTO episodio VALUES
(
	4,
	2,
	1,
	'Os Mutantes',
	'I Second That Emotion',
	'O Professor Farnsworth instala um chip de empatia em Bender depois dele ter jogado impiedosamente Nibbler descarga abaixo. Com as suas novas emoções, o robô arrependido se aventura nos esgotos infestados de mutantes para resgatar o amado bichinho de Leela.',
	'1999-11-21',
	23,
	NULL
);

INSERT INTO episodio VALUES
(
	4,
	2,
	2,
	'O Crime de Zapp Brannigan',
	'Brannigan, Begin Again',
	'Tendo destruído o novo quartel general da D.O.O.P., Zapp Brannigan e Kif se vêem julgados em corte marcial e sofrem baixa desonrosa. Eles arranjam emprego na Planet Express, onde Kif aprende o que é ser respeitado e Zapp arma um motim contra Leela.',
	'1999-11-28',
	23,
	NULL
);

/* A ANATOMIA DE GREY T1 */

INSERT INTO episodio VALUES
(
	5,
	1,
	1,
	"A Hard Day's Night",
	"A Hard Day's Night",
	"Meredith Grey acorda depois de uma noite para começar seu primeiro turno como interna de cirurgia. O primeiro turno para os novos internos cirúrgicos Meredith Grey (Ellen Pompeo), Cristina Yang (Sandra Oh), Izzie Stevens (Katherine Heigl), George O'Malley (T.R. Knight) e Alex Karev (Justin Chambers) é memorável. Enquanto trabalha, Meredith percebe que o cara de sua noite anterior é o Dr. Derek Shepherd. Derek pede a um interno que resolva o caso de um adolescente que tenha convulsões. Meredith e Christina percebem que ela tem um aneurisma que foi causado por uma queda. À luz dessa percepção, Derek escolhe Meredith para auxiliar em sua cirurgia, mesmo que Meredith tenha dito a Christina que ela podia.",
	'2005-03-27',
	23,
	NULL
);

INSERT INTO episodio VALUES
(
	5,
	1,
	2,
	'The First Cut Is the Deepest',
	'The First Cut Is the Deepest',
	'Meredith procura por colegas de quarto para compartilhar a casa de sua mãe, mas inicialmente não quer ficar com Izzie e George. Derek e Meredith atendem a uma vítima de estupro. Ao olhar para bebês recém-nascidos no hospital, Meredith e George descobrem uma doença com um bebê recém-nascido, mas uma enfermeira tenta rejeitar suas preocupações. Izzie Stevens ajuda uma mulher chinesa cuja filha precisa de cuidados médicos. Derek e Burke discutem sobre o cargo de chefe de cirurgia. ',
	'2005-04-03',
	23,
	NULL
);

/* A ANATOMIA DE GREY T2 */

INSERT INTO episodio VALUES
(
	5,
	2,
	1,
	'Raindrops Keep Falling on My Head',
	'Raindrops Keep Falling on My Head',
	"Joe, o barman, entra em colapso no bar e se vê na necessidade de uma cirurgia de alto custo que não tem como ele pagar. Para o desconforto de Meredith, Addison a solicita como interna do dia. Ainda se recuperando da cirurgia, o Dr. Webber pede a George para ser seus 'olhos e ouvidos', mas George acha difícil transmitir qualquer informação. Cristina diz a Meredith que está grávida sem revelar o pai. Quando Burke interrompe seu relacionamento, ela decide não contar a ele também. O vínculo pessoal de Izzie e Alex se aproxima, mostrando um lado mais emocional de si mesmo.",
	'2005-09-25',
	23,
	NULL
);

INSERT INTO episodio VALUES
(
	5,
	2,
	2,
	'Enough Is Enough',
	'Enough Is Enough',
	'Adele corta suas férias para vir e cuidar do Dr. Webber, que ainda está se recuperando de uma cirurgia. Cristina e Meredith expressam uma grande dose de amargura em relação às suas últimas chamas doutorais. Depois de ter trabalhado com a enfermeira Olivia o dia todo, George admite que gosta de outra pessoa. Cristina, Alex e Izzie tratam as vítimas de um acidente de carro em que o pai precisa de um transplante de fígado, mas seu filho não quer doar por causa da maneira como seu pai maltrata sua mãe. Meredith e Bailey tratam de um homem que engoliu as cabeças de dez bonecas da Judy. George consulta Derek quando ele acredita que um doador de órgãos ainda está vivo.',
	'2005-10-02',
	23,
	NULL
);


/* UMA FAMILIA DA PESADA T1 */

INSERT INTO episodio VALUES
(
	6,
	1,
	1,
	'A Morte Como Uma Sombra',
	'Death Has a Shadow',
	'Peter aplica-se para o bem-estar para sustentar sua família, depois de perder o emprego. Ele recebe um cheque de $ 150,000, devido a um ponto decimal fora de lugar, e usa-lo para comprar presentes luxuosos para sua família. Lois está chateada quando ela descobre que depois de receber um novo cheque bem-estar no correio; Peter tenta fazê-la feliz, largando o dinheiro excedente de um dirigível acima do Super Bowl XXXIII com a ajuda de Brian. Ambos estão presos por guardas de segurança e processado por fraude de bem-estar. No tribunal, Lois pede a juiz para não prender Peter, Stewie, a contragosto começando a perceber sua dependência de seus pais, influencia o juiz reconsidere sua sentença. ',
	'1999-01-31',
	23,
	NULL
);

INSERT INTO episodio VALUES
(
	6,
	1,
	2,
	'O Morto Desconhecido',
	'I Never Met the Dead Man',
	'Peter tornou-se viciado em televisão. Ele se distrai com um show que ele queria assistir em uma televisão em uma casa nas proximidades, e se choca contra transmissor a cabo da cidade, o corte de recepção para toda a cidade de Quahog. Peter entra em pânico e rouba o transmissor e convence Meg levar culpa pela interrupção. Stewie rouba a antena parabólica em um plano para criar um dispositivo de controle do tempo. Sofrendo síndrome de abstinência por falta de televisão, Peter cintas um boneco de papelão para si mesmo, fazendo parecer como se o mundo é um programa de televisão. Meg confessa que seu pai realmente era o culpado pela queda de cabo, fazendo com que a cidade se voltar contra ele; ele é salvo quando Lois dá um discurso emocionado para a comunidade. Inspirado, Peter leva a família para várias atividades ao ar livre, de forma rápida esgotá-los; ele então sai com William Shatner. Enquanto isso, a máquina do tempo Stewie cria uma tempestade; enquanto Meg está praticando condução, a tempestade faz com que ela bateu acidentalmente Shatner e Peter, matando Shatner e hospitalização de Peter. Como seu pai se recupera em um molde de corpo inteiro, ele é forçado a assistir televisão, levando-o a tornar-se viciado, mais uma vez.',
	'1999-04-11',
	23,
	NULL
);

/* UMA FAMILIA DA PESADA T2 */

INSERT INTO episodio VALUES
(
	6,
	2,
	1,
	'Peter na Alta Sociedade',
	'Peter, Peter, Caviar Eater',
	"Um dos parentes de Lois morre, deixando a ela e ao restante da família sua elegante mansão. No entanto, Peter começa a pensar que é rico e dá o último lance em um leilão de caridade, dando $100 milhões por um vaso; já que não pode pagar, tenta convencer os outros de que sua casa possui um alto valor, tentando trocá-la pelo lance. Depois de várias tentativas frustradas de 'provar' que a Mansão Cherrywood tinha valor histórico suficiente para pagar a dívida, Peter se reconcilia com Lois e ao mesmo tempo, encontra várias fotografias escondidas, as quais mostram várias figuras americanas famosas (como Abraham Lincoln, Robert E. Lee e Ulysses S. Grant) na casa, que antigamente, era um bordel. A descoberta permite que Peter compre sua antiga casa de volta após vender as fotos para tabloides. Mais tarde, ele decide que não irá mais ligar para o que os parentes de Lois pensam sobre ele, chamando-os de 'um monte de cafetões e prostitutas'.",
	'1999-09-23',
	23,
	NULL
);

INSERT INTO episodio VALUES
(
	6,
	2,
	2,
	'Minha Nossa!',
	'Holy Crap',
	'O devoto religioso pai de Peter, Francis, que foi recentemente despedido, vem fazer uma visita, mas se mostra intolerante com as pessoas e torna a vida de todos miserável. Ainda assim, Peter tenta criar um vínculo com ele, já que a figura paterna sempre foi negligente com o filho. Quando todas as suas tentativas falham, ele decide sequestrar o Papa, ao se fingir de motorista dele, para que os conflitos pudessem ser resolvidos. Então, leva a santidade para sua casa para que agisse como mediador de seus problemas. Mais tarde, Peter faz as pazes com Francis, que é contratado como segurança durante a visita do Papa nos Estados Unidos, empurrando as pessoas que não possuíam permissão para ficar perto do religioso e até mesmo aquelas que tinham permissão, se estas estivessem no meio do caminho, como os administradores da Fox, deixando o Papa com receio. No fim do episódio, a mãe de Peter aparece na porta de sua casa, dizendo que quer viver com a família, fazendo com que todos fugissem de imediato.',
	'1999-09-30',
	23,
	NULL
);