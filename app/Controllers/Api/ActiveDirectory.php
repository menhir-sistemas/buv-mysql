<?php

namespace App\Controllers\Api;

use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Psr\Log\LoggerInterface;
use Firebase\JWT\JWT;
use Firebase\JWT\Key;


class ActiveDirectory extends BaseApiController
{
    protected $modelName = '';

    private $cfg;

    public function initController(RequestInterface $request, ResponseInterface $response, LoggerInterface $logger)
    {
        $this->cfg = Config('ActiveDirectory');
        parent::initController($request, $response, $logger);
    }


    public function login()
    {
        try {
            $loginData = $this->getRequestInput();

            $jwt = $this->loadRest('login', (array) $loginData);


            // Si dio OK, pido el grupo, si no, 401
            $userData = dataFromJWT($jwt);
            if (array_key_exists('login', $userData))
                if ($userData['login'] === false)
                    throw new \Exception('Error en el login');

            // TODO: traer el grupo desd A/D
            $group = $this->cfg->adAdmGroup;

            $jwtArrData = [
                "iat" => time(),
                // TODO: Ver algo razonable para la expiración
                //"exp" => time(),
                "iss" => $this->cfg->adIssuer,
                "aud" => $this->cfg->adAud,
                "realm_access" => [ "roles" => $this->getRolesByGroup($group)],
            ];
            // armo el nuevo JWT
            $retData = [
                'JWT'      => JWT::encode($jwtArrData, $this->cfg->adSeed, $this->cfg->adAlg),
                'user'     => $userData,
                'group'    => $group
            ];

            return $this->respond($retData, ResponseInterface::HTTP_OK);
        } catch (\Throwable $th) {
            return $this->respond(['error' => $th->getMessage()], ResponseInterface::HTTP_UNAUTHORIZED);
        }
    }

    private function loadREST($method, $data)
    {

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
    private function getRolesByGroup($group)
    {
        $roles = [
            "buv-get",
            "offline_access",
            "uma_authorization",
            "default-roles-buv"            
        ];

        if ( $group != $this->cfg->adOpGroup ) {
            $roles[] = 'buv-post';
            $roles[] = 'buv-put';
            $roles[] = 'buv-delete';
        }

        return  $roles;
    }
}
