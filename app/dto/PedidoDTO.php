<?php
class PedidoDTO{
    public $id;
    public $id_usuario;
    public $nombre_cliente;
    public $producto;
    public $estado;
    public $estimado;
    public $hora_inicio;
    public $hora_entrega;
    public $cod_mesa;
    public $cod_pedido;
    public $fecha_baja = null;

    public function __construct(Pedido $pedido)
    {
        $this->id = $pedido->id;
        $this->id_usuario = $pedido->id_usuario;
        $this->nombre_cliente = $pedido->nombre_cliente;
        $this->producto = Producto::obtenerPorId($pedido->id_producto);
        $this->estado = $pedido->estado;
        $this->estimado = $pedido->estimado;
        $this->hora_inicio = $pedido->hora_inicio;
        $this->hora_entrega = $pedido->hora_entrega;
        $this->cod_mesa = $pedido->cod_mesa;
        $this->cod_pedido = $pedido->cod_pedido;
        $this->fecha_baja = $pedido->fecha_baja;
    }
}