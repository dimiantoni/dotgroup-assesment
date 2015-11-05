#Teste técnico para vaga de Desenvolvedor PHP Pleno.

###Todos os requisitos do escopo dos testes foram implementados inclusive os considerados diferenciais
todo o código escrito adequado as regras:
-----------------------------------

1. PSR-1: Basic Coding Standard
2. PSR-2: Coding Style Guide
3. PSR-3: Logger interface
4. PSR-4: Improved Autoloading


## Tarefa do teste-1

Escreva um programa que imprima números de 1 a 100. Mas, para múltiplos de 3 imprima
“Fizz” em vez do número e para múltiplos de 5 imprima “Buzz”. Para números múltiplos
de ambos (3 e 5), imprima “FizzBuzz”.

### Solução:
Criação de uma classe com um método simples para realizar a tarefa, foi feito com parâmetrização
apenas pra representar o dinamismo do uso de uma classe, que no caso desta implementação a classe
poderia ser instânciada em vários locais e executar a mesma tarefa para um intervalo diferente a
cada uso.

### Instalação e teste

### Requisitos
* PHP 5.3 ou superior.
* MySQL

Após ter clonado o repositório na raiz de um servidor apache funcional com PHP mínimo 5.3 instalado, apenas digite na barra de endereços do seu navegador a seguinte url:

```
http://localhost/teste-tecnico/teste-1/
```

## Tarefa do teste-2

Refatore o código abaixo, fazendo as alterações que julgar necessário.

```php
<?
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
    header("Location: http://www.google.com");
    exit();
} elseif (isset($_COOKIE['Loggedin']) && $_COOKIE['Loggedin'] == true) {
    header("Location: http://www.google.com");
    exit();
}
```

### Solução:

```php
<?php
/**
 * [redirect função para redirecionamento]
 * @return [type] [redireciona a aplicação para a url do google]
 * Foi criado uma classe visando a implementação de testes unitários.
 * Foi retirado a função exit() pois a mesma não é adequada, para uso principalmente
 * em casos que serão desenvolvidos testes unitários, também porquê o script é encerrado
 * naturalmente quando não há nenhuma instrução posterior ao cabeçalho. Usei como referência
 * a seguinte discussão em um tópico no stackoverflow, que se tratava exatamente do uso da função
 * exit() após um a escrita de um header.
 * http://stackoverflow.com/questions/3553698/php-should-i-call-exit-after-calling-location-header
 */

class Navigation
{
	public function redirect()
	{
	    header("Location: http://www.google.com");
	}
}

$nav = new Navigation;
print_r($nav);die;
if (isset($_SESSION['loggedin']) && $_SESSION['loggedin'] == true) {
    $nav->redirect();
} elseif (sset($_COOKIE['Loggedin']) && $_COOKIE['Loggedin'] == true) {
    $nav->redirect();
}
```

##  Tarefa do teste-3

Refatore o código abaixo, fazendo as alterações que julgar necessário.

```php
<?php

class MyUserClass
{
    public function getUserList()
    {
        $dbconn = new DatabaseConnection('localhost','user','password');
        $results = $dbconn->query('select name from user');

        sort($results);

        return $results;
    }
}
```

### Solução: 

Alterado o nome da classe para o mesmo nome da entidade à qual a mesma faz
referência. Retirei o nome MyUserClass pois não é recomendado combinar palavras
revervadas da linguagem ao declarar classes métodos e variáveis, mesmo que neste
caso o interpretador aceite, também o myUserClass faz referência a uma instância da entidade
e não a entidade em sí. Nome foi adequado por simples questão de boas práticas de cleancode
e codestyle.

 Também foi adequada a conexão, utilizando o PADRÃO PDO e tratando as entradas do banco com Prepared Statements
 considerada melhor prática pois protege o banco de ataques por SQL Injection nas entradas de dados.

 ```php
<?php
/**
 * Alterado o nome da classe para o mesmo nome da entidade à qual a mesma faz
 * referência. Retirei o nome MyUserClass pois não é recomendado combinar palavras
 * revervadas da linguagem na ao declarar classes métodos e variáveis, mesmo que neste
 * caso o interpretador aceite, também o myUserClass faz referência a uma instância da entidade
 * e não a entidade em sí. Nome adequado por simples questão de boas práticas de cleancode
 * e codestyle.
 */
class User
{
	/**
	 * [getUserList método que busca todos usuários da table user]
	 * @return [array] [lista de usuários]
	 */
	public function getUserList()
	{
		/**
		 * Melhor prática usando conexão PDO e tratando as entradas do banco
		 * com Prepared Statements
		 */
		try{
			/**
			 * Para testar a classe com uma base de dados importe no seu banco de dados o
			 * arquivo teste3.sql nele há uma tabela user criada já com informações de teste
			 * caso criar o banco de dados não esqueça de alterar as credenciais abaixo.
			 * [$conn instância da classe PDO]
			 * @var PDO
			 */
			$conn = new PDO('mysql:host=localhost;dbname=teste_tres','YOUR_USER_DB','YOUR_PASS_DB');
			$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
			$query = $conn->prepare('SELECT name as nome FROM user');
			$query->execute();
			while($results = $query->fetchAll()){
				sort($results);
				return $results;
			}
		}catch(PDOException $e) {
			echo 'ERROR: ' . $e->getMessage();
		}
	}
}
/**
 * [$users Objeto da classe user, teste de funcionamento da classe refatorada]
 * [Para testar crie um banco de dados e execute o sql do arquivo db-teste3.sql que está na raiz deste mesmo diretório]
 * Uma vez que o banco estiver criado passe seus parâmetros de banco de dados ao instânciar a classe PDO
 * @var User
 */
$users = new User;
$lista = $users->getUserList();
foreach ($lista as $user) {
	echo $user['nome'] . "<br>";
}
 ```

### Instalação e teste

### Requisitos
* PHP 5.3 ou superior.
* MySQL

Este teste pode ser testado executando o programa ou apenas analisado em um editor, para simplificar a avaliação
criei um banco de dados para testar o programa, o arquivo sql teste3.sql encontra-se na raiz da pasta teste-3
nele há uma tabela user criada, já com informações de teste caso escolha criar o banco de dados para avaliar este
teste, não esqueça de alterar as credenciais de usuário e senha para as do seu banco de dados, no lugar das
strings 'YOUR_USER_DB' e 'YOUR_PASS_DB'

Uma vez que o repositório esteja clonado na raiz de um servidor apache funcional com PHP mínimo 5.3 instalado,
e o banco de dados tenha sido criado e alterado os parâmetros de conexão, apenas digite na barra de endereços
do seu navegador a seguinte url:

```
http://localhost/teste-tecnico/teste-3/
```

## Tarefa do teste-4

Desenvolva uma API Rest para um sistema gerenciador de tarefas
(inclusão/alteração/exclusão). As tarefas consistem em título e descrição, ordenadas por
prioridade.

Desenvolver utilizando:
    * Linguagem PHP ou framework CakePHP; 
	(Por se tratar de um simples micro-serviço optei por usar um Micro-Framework, mais indicado para desenvolvimento de 
	APIs por possuir um kernel mais enxuto que dispensa recursos voltados para camadas de visão neste caso foi
	utilizado o Slim 3).
    * Banco de dados MySQL;
Diferenciais:
    * Criação de interface para visualização da lista de tarefas; (Implementado)
    * Interface com drag and drop;
    * Interface responsiva (desktop e mobile); (Implementado)

### Solução: 

- A API Rest foi desenvolvida utilizando o slim 3 e possuí os seguintes métodos
	```php
	function insertTask();
    function syncServer();
    function allTasks();
    function editTask();
    function removeTask();
    ```
- Interface para gerênciamento das tarefas foi criada utilizando o framework Bootstrap, junto com o
pacote de Icons Font Awesome, para a interface DragAndDrop e suas interações foi usado o módulo angular Sortable
ng-sortable.

- As lógicas para comunicação assíncrona com a API e interações com o usuário foram escritas em javascript usando
alguns recursos do AngularJS 1.3

### Requisitos para a API
* HTTP Server. Por exemplo: Apache. Mod_rewrite ativado.
* PHP 5.3 ou superior.
* MySQL

### Instalação e teste

Uma vez que o repositório esteja clonado na raiz de um servidor apache funcional com PHP mínimo 5.3 instalado,
importe o arquivo tasks.sql no seu banco de dados, o arquivo se encontra na raiz na pasta *teste-4*, considerando
que o banco de dados tenha sido criado com o nome definido no script sql, apenas altere as credenciais de conexão
com o banco de dados as constantes DB_USER e DB_PASSWORD que se encontram no arquivo env.php na raiz da pasta *srv* 
feito isto então acesse em seu navegador a seguinte url:

```
http://localhost/teste-tecnico/teste-4/controle-tarefas
```

###Para análise do código o projeto inteiro pode ser aberto no editor de sua preferência.
--------------------------------------
