<?php

namespace App\Controllers\Api;

use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Psr\Log\LoggerInterface;


class ActiveDirectory extends BaseApiController
{
    protected $modelName = '';

    private $cfg;

    public function initController(RequestInterface $request, ResponseInterface $response, LoggerInterface $logger)
    {
        $this->cfg = Config('ActiveDirectory');
        parent::initController($request, $response, $logger);
    }


    public function login()  {
        try {
            $loginData = $this->getRequestInput();

            $jwt = $this->loadRest('login',(array) $loginData);


            // Si dio OK, pido el grupo, si no, 401
            $userData = dataFromJWT($jwt);
            if ( array_key_exists('login',$userData) )
                if ( $userData['login'] === false )
                    throw new \Exception('Error en el login');

            // Por ahora, el grupo está fijo, pero en breve cambia
            $retData = [
                'JWT'      => $jwt,
                'user'     => $userData,
                'group'    => 'APP-AMIDD-ADM'
            ];
    
            return $this->respond($retData, ResponseInterface::HTTP_OK);
        } catch (\Throwable $th) {
            return $this->respond(['error' => $th->getMessage()], ResponseInterface::HTTP_UNAUTHORIZED);
        }
   }

   private function loadREST($method, $data) {

    $client = new \GuzzleHttp\Client(['base_uri' => $this->cfg->adURL]);

    $res = $client->request('POST', $method, [
        'allow_redirects' => false,
        'verify'          => false,
        'synchronous'     => true,
        'stream'          => true,
        'json'            => $data
    ]);
    $body = $res->getBody();

    $data = "";
    while (!$body->eof()) {
        $data .= $body->read(1024);
    }

    return $data;
   }
}
