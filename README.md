# Seja bem vindo
Parabéns, você está fazendo parte de um teste para concorrer a uma vaga de SRE jr e se tornar um Printer.

# Regras
- Você terá até 24 horas para entregar o teste
- Terá que criar um repositório público no github e nos enviar apenas o link com o teste concluído para o email devops@printi.com.br
- Resolva os desafios criando os scripts mencionados
- Boa sorte

# Questões teóricas
1. Informe os comandos relacionados a procesos no linux que já utilizou na prática e o porque de cada um deles

   Resposta:
      top -> Para monitorar o consumo em tempo real do servidor e analisar processos que podem estar consumindo recurso mais do que o normal.
      ps -> Para fazer a listagem dos processos que estão em execução
      kill -> Para finalizar o processo que está causando o alto consumo ou está travado.
      htop -> Uma versão melhorada do top mencionado a cima.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------      
2. Explique o significado completo da seguinte saída do comando ls -l (-rwxr-x--- 1 devops users 1024 Mar 25 12:00 script.sh)
   Resposta: Este comando irá mostrar os detalhes do arquivo script.sh, não tera permissão para executar porém apenas lista, vale ressaltar que o comando deve contar as aspas ("") para ser executado corretamente.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------     
3. Quais comandos você utiliza para avaliar possíveis problemas em cpu,memória,disco,rede em sistemas operacionais linux

   Resposta:
      CPU -> top ou htop.
      Memoria -> free, top e htop.
      Disco -> df, df -h e du.
      Rede -> netstat, ping, telnet e nslookup.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------      
4. Explique a diferença entre topologia física e topologia lógica de uma rede. Dê um exemplo de cada uma.

   Resposta:
      A topologia física depende de ferramentas físicas, como um datacenter local ao contrario da topologia lógica que não necessita de algo físico.
      Topologia física -> Um datacenter com servidores ligados nele.
      Topologia lógica -> Uma VPN que usa criptografia.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
5. Quais são as principais características das topologias de rede estrela, anel e malha? Cite vantagens e desvantagens de cada uma.

   Resposta:
      Rede Estrela -> Todos dispositivos conectado por um switch ou hub, uma vantadem é a facilidade de adicionar ou remover dispositivos e a desvantagem é o custo se caso a rede for de grande escala
      Anel -> Dispositivos são conectados em círculo, a vantagem se manter estável com tráfego alto já a desvatagem é ser mais trabalhoso adicionar ou remover dispositivos.
      Malha -> Conecta todos os dispositivos em si formando uma malha a vantagem é ser ótima para redes robustas por ser rápida e confiavel a desvantagem é ser mais cara que outras topologias.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
6. Por que a topologia em malha é frequentemente utilizada em ambientes críticos, como data centers e infraestrutura de nuvem? Como ela contribui para a resiliência da rede?

   Resposta:
      A topologia em malha é utiliza em ambientes criticos pelo fato de ser tolerânte a falhas ter confiabilidade, ele contribui para resiliência tento redundância, alta escalabilidade e ter uma comunicação eficiente.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
7. Explique a diferença entre EC2, S3 e RDS na AWS. Para que tipo de aplicação cada um é mais adequado?

   Resposta:
      EC2 é um serviço de instâncias para comportar diversos sistemas o S3 é a ferramenta de armazenamento da AWS fornecendo vários tipos de bucket com diferentes custos utilizado para backup, site estático e armazenamento, o RDS é um serviço de banco de dados relacionais ótimo para aplicações que necessitam de um banco de dados (MySQL, PostreSQL, etc.). 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
8. O que é um Auto Scaling Group (ASG) e como ele funciona em conjunto com um Load Balancer (ELB) para melhorar a disponibilidade de uma aplicação?

   Resposta:
      O ASG é um grupo de instâncias podendo ser iguais que nos permite fazer um alAuto Scaling garantindo que a aplicação tenha sempre o recurso necessário disponíveis em conjunto com o ELB temos uma melhora significativa de disponibilidade e performace da aplicação, com o ELB ocorre uma distribuição no tráfego de entrada entre as instâncias geradas pelo ASG e quando não necessário mais as instâncias geradas pelo ASG são automaticamente removidas do ELB.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
9. O que são IAM Roles e IAM Policies na AWS? Qual a diferença entre uma policy gerenciada pela AWS e uma policy personalizada (custom policy)?

   Resposta:
      IAM roles são utilizadas para gerenciamento de permissões para que o usuário ter uma permissão especifica em algum recurso ou uma permissão temporária, IAM Policy é uma politica de acesso que pode permitor ou negar o acesso aos recursos, podendo ser anexeada em usuários em grupo ou até mesmo em roles fazendo um gerenciamento de permissões mais direto.
      Policy gerenciada pela AWS já são criadas pela AWS e não conseguimos altera-las, fornecem permissões mais comuns já a policy personalizada é criada pelo usuário sendo assim conseguimos definir permissões mais específicas, podem ser modificadas.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
10. O que é o shebang (#!) em um script shell? Dê um exemplo de como ele deve ser usado em um script Bash.

   Resposta:
      O shebang serve para especificar qual o interpretador deve usar quando for executar o script, #!/bin/bash desta forma estamos especificando ao sistema utilizar o interpretador bash localizado no caminho informado.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
11. Explique a diferença entre os comandos if, case e while em um script shell. Dê um exemplo prático de uso para cada um.

   Resposta:
      if é usando para tomada decisões baseada em condições já o case é utilizado para comparaçãode valores e o While é utilizado quando é preciso fazer um loop.
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
12. Qual a diferença entre $1, $@ e $# em um Shell Script? Dê um exemplo de um script que utilize essas variáveis para manipular argumentos passados na linha de comando.

   Resposta: 
      $1 -> Referece ao primeiro argumento passado
      $@ -> Se refere a todos os argumentos
      $# -> Contém um número total dos argumentos 
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
13. Explique como você faria um dump de um banco de dados Mysql e quais informações precisaria para isso.

   Resposta:
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
14. Explique como faria o controle de acesso em um banco de dados Mysql e quais informações precisaria para essa demanda.

   Resposta:

# Questões práticas

---

## Desafio 1: Gerenciamento de Processos e Logs

### Tarefa  
- Crie um **script Bash** chamado `monitor_processes.sh` que:  
  - Liste os 5 processos que mais consomem **CPU** e os 5 que mais consomem **memória**.  
  - Registre essa informação em um arquivo de log chamado `process_monitor.log`.  
  - Faça o script rodar automaticamente a cada **5 minutos** usando o `cron`.  

### Entrega  
- Suba o script `monitor_processes.sh` no GitHub.  
- Adicione um arquivo `README.md` explicando como configurar o `cron` para rodar o script.  

---

## Desafio 2: Permissões e Segurança

### Tarefa  
- Crie um **script Bash** chamado `user_setup.sh` que:  
  - Crie um usuário chamado **devops_user**.  
  - Configure um diretório `/home/devops_user/restricted_data/` acessível **apenas pelo dono** do diretório.  
  - Adicione o usuário ao grupo `sudo` e restrinja seu acesso SSH apenas via **chave pública**.  

### Entrega  
- Suba o script `user_setup.sh` no GitHub.  
- Adicione um arquivo `README.md` explicando o que o script faz e como usá-lo.  

---

## Desafio 3: Monitoramento de Uso de Disco

### Tarefa  
- Crie um **script Bash** chamado `disk_usage_alert.sh` que:  
  - Verifique o uso do disco em **`/`**.  
  - Caso o uso esteja acima de **80%**, registre um alerta em um arquivo `disk_alert.log`.  
  - Caso o uso esteja abaixo de **80%**, registre uma mensagem informando que o disco está com espaço suficiente.  

---

## Desafio 4: Pipeline Declarativa no Jenkins para CI/CD

### Tarefa  
Crie um **Jenkinsfile** que implemente um **CI/CD** contendo os seguintes estágios:  

1. **Checkout**
2. **Build**
3. **Test**
4. **Code Quality**
5. **Package(empacotamento do artefato)**
6. **Deploy(um deploy simples em docker)**
   - Se for ambiente **não produção**, faça o deploy;
   - Se for **produção**, solicite uma autorização.

## Requisitos
- A app simples deve ser em Node.js
- Utilize pipelines declarativas
- Explique no próprio jenkinsfile caso você entenda que o time de SRE terá alguma dificuldade de entender pontos específicos
- Utilize variáveis de ambiente

---

## Desafio 5: Dockerfile e Docker Compose  

### Tarefa  
Crie um **Dockerfile** e um **docker-compose.yml** para uma aplicação simples em Node.js.

## Requisitos
1. **Dockerfile:**
   - Criar uma imagem baseada em **Alpine Linux**.
   - Instalar as dependências
   - Expor a porta necessária para rodar

2. **docker-compose.yml:**
   - Criar um serviço para a aplicação.
   - Criar um serviço de banco de dados **MySQL**
   - Configurar variáveis de ambiente para conexão ao banco de dados

3. **Execução:**
   - A aplicação deve ser iniciada corretamente com `docker-compose up -d`.

---

## Desafio 6: IaC AWS com Terraform  

### Tarefa  
Crie um projeto no Terraform que provisione a seguinte infraestrutura **AWS**

1. **Instância EC2**  
   - SO: **Amazon Linux 2**.  
   - Instalar e configurar um **nginx** para servir uma página estática com a mensagem `"Eu quero ser um Printer"`.
   - Expor a porta **80** para acesso público.

2. **Application Load Balancer (ALB)**  
   - Criar um **ALB** direcionando tráfego para a instância EC2

3. **Registro no Route 53**
   - Criar um domínio e registro fazendo apontamento para o ALB
   - O domínio pode ser simulado, sem necessidade de um domínio real
