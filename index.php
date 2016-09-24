<?php
	//Incluir la lógica del modelo
require_once('modelo.php');

	//Obtener la lista de unidades
$datos = Obtener_Unidades_Medida();

	//Incluir la lógica de la vista
require('vista.php');

?>