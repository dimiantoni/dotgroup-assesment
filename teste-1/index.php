<?php
/**
 * Criação de uma classe múltiplos, a parâmetrização é apenas pra
 * representar o dinamismo do uso de uma classe, no caso poderia ser
 * instânciada em vários locais e executar a mesma tarefa para um intervalo
 * diferente a cada uso.
 */
class Mutiplos
{

	public function multiplosVerify($inicio,$final){
		$resultado = array();
		$resultado ="";
		foreach(range($inicio,$final) as $key){
			if ($key % 3 == 0 && $key % 5 == 0) {
	    		$resultado .= "FizzBuzz<br>";
			} elseif ($key % 3 == 0) {
			    $resultado .= "Fizz<br>";
			} elseif ($key % 5 == 0) {
			    $resultado .= "Buzz<br>";
			}else{
				$resultado .= $key . "<br>";
			}
		}
		return $resultado;
	}

}

$multiplos = new Mutiplos;
$inicio =1;
$final =100;
echo $multiplos->multiplosVerify($inicio,$final);
