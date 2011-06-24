# encoding:UTF-8
class HomeController < ApplicationController
SPEAKERS =   [
  {:email => 'alvaro@cuboxsa.com', :name => 'Alvaro Gil', :company => 'cubox.com.uy', :bio => %(Alvaro is a Developer and UI Designer passionate about programming and agile methodologies. His past work include technologies such as C++ and .NET in the fields of CG and GIS. He's now happy to have settled on Ruby, working at Cubox, developing web apps and pushing forward web technologies everyday.), :talk => 'Developer and client interactions: Deliver quality work while avoiding frustrations', :desc => %(Alvaro will talk about his experiences working with different kinds of clients and projects. How to deal with day by day programming work, manage frustrations and deal with the client's expectations from a remote developer's point of view.)},




  {:email => 'andrec@checkplant.com.br', :name => 'André Cantarelli & Frederico Fonseca', :company => 'checkplant.com.br', :bio => %(<b>André Cantarelli</b> Diretor da CheckPlant, Mestre em Ciência da Computação pela UFSC em 2005, e graduado pela UCPel em 2001, sempre tentou colocar em prática estudos e teorias, por isso, empreender foi sua escolha. Bastante envolvido com a área técnica, tem orgulho de sua equipe e acredita demais na CheckPlant.<br><br><b>Frederico Fonseca</b> Trabalha na CheckPlant Sistemas de Rastreabilidade, em Pelotas. Graduado em Tecnologia em Análise e Desenvolvimento de Sistemas pela UCPel em 2008, atua como desenvolvedor web utilizando PHP, MySQL, Ruby, Rails, BDD com Rspec, Apache, OpenVPN, Shell Script, Git, SVN, entre outros. Adepto e praticante das metodologias ágeis de desenvolvimento de software, como o XP. Usuário de Mac e de Ubuntu. Entusiasta e usuário de software livre.), :talk => 'Aguardando', :desc => 'Aguardando'},





  {:email => 'danicuki@gmail.com', :name => 'Daniel Cukier', :company => 'usp.br', :bio => %(Daniel Cukier trabalha com desenvolvimento de software desde 1995, principalmente com Java e Ruby (Rails). É doutorando em Ciência da Computação pela Universidade de São Paulo, onde fez mestrado com a dissertação Padrões para Introduzir <a href="link do video da BIO » http://vimeo.com/6094673" target="_blank">Novas Ideias na Indústria de Software</a>. Ativo na comunidade ágil desde 2005, quando ingressou na Agilcoop, produzindo podcasts, artigos e ministrando cursos sobre agilidade. Introduziu o uso de Métodos Ágeis na Locaweb, maior empresa de hosting da America Latina, onde participou de vários projetos de software na área de SaaS e IaS. Organiza o evento DevOpsDays Brasil, um encontro de desenvolvedores com sysadmins. É autor do blog AgileAndArt, onde costuma escrever sobre as semelhanças entre desenvolvimento de software e as artes. Além da presença na área de software, trabalha com teatro, música (toca violão) e poesia.), :image => "/images/cukier.jpg", :talk => 'Construindo Robôs Web em Ruby', :desc => %(É muito fácil fazer robôs em Ruby para "vasculhar" a Web em busca de dados, além da incrível possibilidade de automatizar tarefas repetitivas e burocráticas. Vamos mostrar como fazer isso de forma simples, rápida e eficaz, utilizando gems como Nokogiri, RestClient e JSON. O que é possível automatizar? Quais são os desafios que ainda não foram vencidos? Como evitar que Robôs invadam o seu site?)},





  {:email => 'daniel@egenial.com.br', :name => 'Daniel Lopes', :company => 'objetiva.co', :bio => %(É sócio fundador da Objetiva Software e está envolvido com TI há quase uma década. Trabalha como desenvolvedor web com grande interesse em Ruby/TDD/Javascript e Frontend. Também é instrutor de treinamentos presenciais e online em parceria com a Egenial com mais de 500 alunos treinados em assuntos como Ruby e Rails. Também ministra a disciplina de Desenvolvimento Web em Pós Graduação na UNA e frequentemente participa da organização de eventos como Ruby Masters, Café Com TOM e Kata TOM. Formalmente é técnico e bacharel em Sistemas de Informação.), :talk => 'Aguardando', :desc => %(Aguardando)},








  {:email => 'everton.carpes@gmail.com', :name => 'Éverton Carpes', :company => 'globo.com', :bio => %(Everton J. Carpes, desenvolvedor, 6 anos de experiencia com Ruby, 2 anos de globo.com.), :talk => 'Aguardando', :desc => %(Aguardando)},






  {:email => 'fabioakita@gmail.com', :name => 'Fábio Akita', :company => 'gonow.com.br', :bio => %(Fabio Akita é um conhecido blogueiro e evangelista da comunidade Ruby on Rails e Agile. Atualmente é Gerente de Projetos pela Gonow Tecnologia. Foi Gerente de Projetos na Locaweb, onde também fez parceria na concepção da conferência anual Rails Summit (rebatizada de "RubyConf Brasil"). Já trabalhou como Brazil Rails Practice Manager para a consultoria americana Surgeworks LLC. Por mais de 5 anos foi consultor de integração e desenvolvimento no mundo SAP. Tem mais de 15 anos de experiência nas áreas de desenvolvimento de software e gestão de projetos, dá palestras em faculdades e conferências de tecnologia e gestão), :talk => 'Discutindo Rails e Arquiteturas', :desc => %(A primeira fase de um programador é simplesmente juntar um monte de código junto e fazer executar alguma coisa. Em breve ele aprende a 'organizar' esse código e descobrirá que muitos já passaram por isso e discutem software em termos de 'design' e 'arquiteturas'. Finalmente entenderá que muitos problemas de software foram organizados na forma de 'patterns'. Eis onde muitos confundem 'tentativas' com 'leis' e discussões insensatas surgem nas comunidades e no mercado de desenvolvimento em geral. Ruby on Rails é, em si, um desses 'patterns' e o ecossistema de soluções desenvolvidas sobre Ruby e Rails formam mais 'patterns'. Vamos discutir e investigar um pouco as tarefas de um arquiteto de software e como bons designs emergem dos problemas de software.)},




  {:email => 'felipe.lima@gmail.com', :name => 'Felipe Lima', :company => 'thoughtworks.com', :bio => %(Felipe Lima trabalha com TI desde 2002 e é formado em Ciência da Computação pela PUCRS. Já passou pela HP, foi um dos fundadores da Quavio e atualmente é consultor de desenvolvimento na ThoughtWorks. Viciado em empreender. Depois de trabalhar durante muitos anos com .NET, se converteu ao open source e ao Ruby. Nas horas vagas, cuida do backend do Noite Hoje, desenvolvendo com Ruby e Sinatra.), :talk => 'Ruby no Noite Hoje', :desc => %(Nesta palestra mostraremos como podemos utilizar o micro-framework Sinatra para aplicações web mais complexas, detalhando os pontos positivos e negativos de desta escolha, quando comparado com o Rails. Além disso, apresentaremos também a arquitetura do sistema e quais técnicas utilizamos para modelar a aplicação. Vamos também analisar os detalhes técnicos que envolvem diversas tecnologias utilizadas neste projeto, como por exemplo, MongoDB, Heroku e CoffeeScript.)},




  {:email => 'nicolas@quavio.com.br', :name => 'Nícolas Iensen', :company => 'quavio.com.br', :bio => %(Formado pela PUC-RS em Ciência da Computação. Participou de grupos de pesquisa pela CAPES. Experiência profissional na HP trabalhando com testes automatizados por 2 anos. Fundador da Quavio Software na Web. Agilista desde 2008 atuando frente a captação e análise de requisitos em diversos projetos de software. Rubista desde 2008 com experiência com vários frameworks web baseados na linguagem. Palestrante em eventos do GURU-RS e GURU-SC), :talk => 'Captando requisitos de forma ágil', :desc => %("Existem diferentes técnicas para captação e análise de requisitos, como profissionais do ramo de software é importante termos conhecimento sobre algumas dessas técnicas, e saber quando utiliza-las.
  Neste tutorial abordaremos a técnica de workshop de requisitos, este promove a comunicação entre as partes interessadas do projeto, afim de definir, refinar, priorizar e acordar os requisitos de usuários.)},




  {:email => 'rafael.lima@bielsystems.com.br', :name => 'Rafael Lima', :company => 'bielsystems.com.br', :bio => %(Bootstrapper, focado em inovações em tecnologia. Fundador da BielSystems, BUNDLES Brasil e Startup DEV. Desenvolvedor web há 15 anos.), :talk => 'Aguardando', :desc => 'Aguardando'},




  {:email => 'rafael.ssouza@gmail.com', :name => 'Rafael Souza', :company => 'softa.com.br', :bio => %(Mais novo desenvolvedor na Softa. Apaixonado pelo que faz e amante de código bonito. Desenvolve para a web há 10 anos, já usou PHP, Java, .NET e agora programa em Ruby full-time.), :talk => 'Testando APIs', :desc => %(Hoje boa parte das aplicações possuem integração com APIs de terceiros e/ou acesso a qualquer recurso externo. Nessa palestra vou mostrar como utilizar ferramentas para testar essa integração desacoplando sua suite de testes desses recursos.)},



  {:email => '', :name => 'Rodrigo Flores', :company => 'plataformatec.com.br', :bio => %(Rodrigo Flores (@rlmflores) é graduado em Ciências da Computação pelo IME/USP e desenvolve em Ruby e Rails desde 2009. Ingressou na PlataformaTec em 2010 e desde então conta com diversas boas práticas de desenvolvimento de software para refatorar e sanear códigos legados em projetos críticos (Projects Rescues). Ele estará no RS on Rails para compartilhar suas experiências e dar algumas dicas sobre como manter (ou melhorar) a manutenabilidade de suas aplicações Rails. ), :image => "http://www.gravatar.com/avatar/e983bf17ef27a284e0bdb174cb080b19.png?s=420", :talk => 'Código Saudável = Programador Feliz!', :desc => %(O framework Rails nos permite construir aplicações web de forma descomplicada e muito produtiva. Porém, é muito fácil perdermos o controle sobre nosso código.  Quando nos damos conta já é tarde demais: a aplicação está com falhas, lógicas duplicadas e difícil de manter. Esta palestra será um tour que passará por boas práticas até ferramentas e web apps que são fáceis de aplicar no dia-a-dia de um desenvolvedor Rails. Certamente vale a pena conferir!)},




  {:email => 'gabriel.sobrinho@gmail.com', :name => 'Gabriel Sobrinho', :company => 'nohup.com.br', :bio => %(Sócio desenvolvedor da nohup. Se alguém encontrar uma insulina, favor entrar em contato...), :talk => 'Pesquisa fonética', :desc => %(Aplicando o algoritmo BuscaBR)},


  {:email => 'narwen@gmail.com', :name => 'Thais Camilo', :company => 'hashrocket.com', :bio => %(The path that led Thais to her passion for Ruby on Rails began with her learning Perl to organize her extensive book and music collections. This quickly led her to pursue a Bachelor’s Degree in Computer Science (rather than taking over the family business) and to work with software development in C, Perl, Python and PHP. She then journeyed to explore some Java until finally finding (and falling in love with) Ruby on Rails. Born Brazilian, she moved to Chile to become a Rocketeer and feel the snow for the first time in the Andes. She loves helping people, never refraining from teaching whatever is necessary to whoever needs it. In her free time she likes to ride her bike, run, and practice Krav Magá. Despite being a Krav Magá practitioner, she swears she is a gentle person. Oh, and don’t be afraid if she hugs you when you first meet her.), :talk => 'Cuking it Right', :desc => %(Muitas desenvolvedores ainda não gostam ou não entendem como Cucumber pode ser uma ferramenta poderosa no desenvolvimento de software. Alguns meses atrás eu tinha a mesma opinião. Meu objetivo com essa palestra é explicar detalhes, truques e outras ferramentas que uma vez integradas mudaram minha opinião sobre Cucumber e eu espero conseguir mudar a sua.)}]

  def index
    @speakers = SPEAKERS
  end

end
