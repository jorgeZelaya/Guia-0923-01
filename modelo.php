<?php

function  Obtener_Unidades_Medida()
{
	$query = "select * from tbl_unidad_medida";
	$cnn = mysql_connect('localhost','root','');
	mysql_select_db('db_inventario', $cnn);
	$resultado = mysql_query($query);

	$datos = array();
	while ($fila = mysql_fetch_array($resultado, MYSQL_ASSOC))
	{
		$datos[] = $fila;
	}

	return $datos;

}

?>