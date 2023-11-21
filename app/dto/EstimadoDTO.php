<?php
class EstimadoDTO{
    public $id;
    public $usuario_a_cargo;
    public $nombre_cliente;
    public $producto;
    public $estado;
    public $estimado;
    public $cod_mesa;
    public $cod_pedido;

    public function __construct(Pedido $pedido)
    {
        $this->usuario_a_cargo = Usuario::obtenerUsuarioPorId($pedido->id_usuario)->usuario;
        $this->nombre_cliente = $pedido->nombre_cliente;
        $this->producto = Producto::obtenerPorId($pedido->id_producto);
        $this->estado = $pedido->estado;
        $this->estimado = $pedido->estimado;
        $this->cod_mesa = $pedido->cod_mesa;
        $this->cod_pedido = $pedido->cod_pedido;
    }
}