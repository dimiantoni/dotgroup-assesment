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