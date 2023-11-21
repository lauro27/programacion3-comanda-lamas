<?php
interface IApiUsable
{
	public function TraerUno($request, $response, $args);
	public function TraerTodos($request, $response);
	public function CargarUno($request, $response);
	public function BorrarUno($request, $response);
	public function ModificarUno($request, $response);
}
