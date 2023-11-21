<?php
// Error Handling
error_reporting(-1);
ini_set('display_errors', 1);

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Psr\Http\Server\RequestHandlerInterface;
use Slim\Factory\AppFactory;
use Slim\Routing\RouteCollectorProxy;
use Slim\Routing\RouteContext;

require __DIR__ . '/../vendor/autoload.php';

require_once './db/AccesoDatos.php';
require_once './middlewares/Logger.php';
require_once './middlewares/AuthMW.php';
require_once './util/AuthJWT.php';
require_once './util/CsvHandler.php';
//require_once './util/Enums.php';

require_once './controllers/UsuarioController.php';
require_once './controllers/LoginController.php';
require_once './controllers/MesaController.php';
require_once './controllers/PedidoController.php';
require_once './controllers/ProductoController.php';

// Load ENV
$dotenv = Dotenv\Dotenv::createImmutable(__DIR__);
$dotenv->safeLoad();

// Instantiate App
$app = AppFactory::create();

//$app->setBasePath("/comanda/app");
// Add error middleware
$app->addErrorMiddleware(true, true, true);

// Add parse body
$app->addBodyParsingMiddleware();

$app->addRoutingMiddleware();

date_default_timezone_set("America/Argentina/Buenos_Aires");

// Routes
$app->post('/login[/]', \LoginController::class . ':IniciarSesion')
  ->add(new Logger("Inicio de sesion"));

$app->group('/usuarios', function (RouteCollectorProxy $group) {
    $group->get('[/]', \UsuarioController::class . ':TraerTodos')
      ->add(new Logger("busca todos los usuarios"));
    $group->get('/{usuario}', \UsuarioController::class . ':TraerUno')
      ->add(new Logger("busca usuario"));
    $group->post('[/]', \UsuarioController::class . ':CargarUno')
      ->add(new Logger("creando usuario"));
    $group->put('[/]', \UsuarioController::class . 'ModificarUno')
      ->add(new Logger("modificando usuario"));
    $group->post('/csv[/]', \UsuarioController::class . ':CargarPorCsv')
      ->add(new Logger("creando usuarios por csv"));
    $group->options('/csv[/]', \UsuarioController::class . ':DescargarCsv')
    ->add(new Logger("Descargando csv"));
    $group->delete("[/]", \UsuarioController::class . 'BorrarUno')
    ->add(new Logger("borra usuario"));
})->add(\AuthMW::class . ':LoginSocio');

$app->group('/productos', function (RouteCollectorProxy $group){
  $group->get('[/]', \ProductoController::class . ':TraerTodos');
  $group->get('/{id}', \ProductoController::class . ':TraerUno');
  $group->post('[/]', \ProductoController::class . ':CargarUno')
    ->add(\AuthMW::class . ':LoginSocio')
      ->add(new Logger("Agrega producto"));
});

$app->group('/mesa', function (RouteCollectorProxy $group){
  $group->get('[/]', \MesaController::class . ':TraerTodos')
    ->add(new Logger("Busca todas las mesas"));
  $group->get('/{mesa}', \MesaController::class . ':TraerUno')
    ->add(new Logger("Busca mesa"));
  $group->post('[/]', \MesaController::class . ':CargarUno')
    ->add(new Logger("Agrega mesa"));
  $group->put('[/]', \MesaController::class . ":ModificarUno")
    ->add(new Logger("modificado estado de mesa"));
  $group->delete('[/]', \MesaController::class . ":BorrarUno")
    ->add(new Logger("Borra mesa"));
  $group->put('/cuenta[/]', \MesaController::class . ":TraerCuenta")
    ->add(new Logger("Traer cuenta de mesa"));
  $group->put('/cerrar[/]', \MesaController::class . ":PagarMesa")
    ->add(\AuthMW::class . ':LoginSocio')
    ->add(new Logger("Cierra mesa"));
})->add(\AuthMW::class . ':LoginSocioMozo');



$app->group('/pedidos', function (RouteCollectorProxy $group){
  $group->get('[/]', \PedidoController::class . ':TraerTodos')
    ->add(\AuthMW::class . ':Login')  
    ->add(new Logger("Busca todos los pedidos"));
  
  $group->get('/codigo/{pedido}', \PedidoController::class . ':MostrarUno')
    ->add(new Logger("Busca pedido"));
  
  $group->post('[/]', \PedidoController::class . ':CargarUno')
    ->add(\AuthMW::class . ':LoginSocioMozo')
    ->add(new Logger("Nuevo pedido"));
  
  $group->get('/sector[/]', \PedidoController::class . ":TraerTodosSector")
    ->add(\AuthMW::class . ':Login')
    ->add(new Logger('Verificar productos de pedido'));

  #region SETEO DE ESTADO
  $group->put('/preparando[/]', \PedidoController::class . ":SetearPreparando")
    ->add(\AuthMW::class . ':Login')
    ->add(new Logger('Preparando pedido'));
  
  $group->put('/listo[/]', \PedidoController::class . ":SetearListo")
    ->add(\AuthMW::class . ':Login')
    ->add(new Logger('Pedido listo'));
  
  $group->put('/entregado[/]', \PedidoController::class . ":SetearEntregado")
    ->add(\AuthMW::class . ':LoginSocioMozo')
    ->add(new Logger('Entrega pedido'));

  $group->put('/pagado[/]', \PedidoController::class . ":SetearPagado")
    ->add(\AuthMW::class . ':LoginSocio')
    ->add(new Logger('Terminar pago de mesa'));
  
  $group->delete('[/]', \PedidoController::class . ":SetearCancelado")
    ->add(\AuthMW::class . ':LoginSocioMozo')
    ->add(new Logger('Cancelar pedido'));
  #endregion
  
  $group->get('/estimado/{mesa}/{codigo}', \PedidoController::class.':TraerUnoConMesa');
  $group->get('/mesa/{mesa}', \PedidoController::class.':TraerTodosPorMesa');
  
  $group->get('/listos', \PedidoController::class . ":TraerListos")
    ->add(\AuthMW::class . ':LoginSocioMozo')
    ->add(new Logger('Busca todos los pedidos listos'));
  
  $group->post('/total', \PedidoController::class . ':TraerCuenta')
    ->add(\AuthMW::class . ':LoginSocioMozo')
    ->add(new Logger('Pide Factura'));
});

$app->get('[/]', function (Request $request, Response $response) {    
    $payload = json_encode(array("mensaje" => "La comanda - Lamas Juan Pablo"));
    
    $response->getBody()->write($payload);
    return $response->withHeader('Content-Type', 'application/json');
});

$app->run();
