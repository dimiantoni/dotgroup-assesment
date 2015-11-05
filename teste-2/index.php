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