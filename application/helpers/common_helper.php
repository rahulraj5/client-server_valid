<?php defined('BASEPATH') OR exit('No direct script access allowed');

function generateRandomStringbylnth($length) {
    $characters = '01234567890123456789';
    $charactersLength = strlen($characters);
    $randomString = '';
    for ($i = 0; $i < $length; $i++) {
        $randomString .= $characters[rand(0, $charactersLength - 1)];
    }
    return $randomString;
}

function createRandomCode(){ 
	$chars = "023456789ABCDEFGHIJKLMNOPQRST";
	srand((double)microtime()*1000000);
	$i = 0; 
	$pass = '' ; 
	while ($i <= 8) { 
		$num = rand() % 33;
		$tmp = substr($chars, $num, 1);
		$pass = $pass . $tmp; 
		$i++; 
	} 
	return $pass; 
}



?>
