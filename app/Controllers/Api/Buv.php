<?php

namespace App\Controllers\Api;

use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use Exception;
use Psr\Log\LoggerInterface;
use Keycloak\Admin\KeycloakClient;


class Buv extends BaseApiController
{
    protected $modelName = 'App\Models\BUVDataModel';

    private $kcClient = null;

    private $kcPassword = null;

    private $cfg;

    public function initController(RequestInterface $request, ResponseInterface $response, LoggerInterface $logger)
    {
        $this->cfg = Config('Keycloak');
        $this->kcClient = KeycloakClient::factory([
            'realm'     => $this->cfg->realm,
            'username'  => $this->cfg->realmAdminName,
            'password'  => $this->cfg->realmAdminPass,
            'client_id' => $this->cfg->adminClient,
            'baseUri'   => $this->cfg->baseUri,
            'verify'    => $this->cfg->verify
        ]);
        parent::initController($request, $response, $logger);
    }


    /**
     * Override de la función de nuevo registro
     *
     * @return array
     */
    public function newRec() : array {
        return [
            '_id'               => 'VALOR DE EJEMPLO',
            'apellido'          => 'VALOR DE EJEMPLO',
            'celular'           => 'VALOR DE EJEMPLO',
            'coordenadas'       => 'VALOR DE EJEMPLO',
            'correoElectronico' => 'VALOR DE EJEMPLO',
            'deptounidad'       => 'VALOR DE EJEMPLO',
            'direccion'         => 'VALOR DE EJEMPLO',
            'fechaDeCreacion'   => 'VALOR DE EJEMPLO',
            'fechaDeNacimiento' => 'VALOR DE EJEMPLO',
            'fechaDefuncion'    => 'VALOR DE EJEMPLO',
            'fechaModificacion' => 'VALOR DE EJEMPLO',
            'genero'            => 'VALOR DE EJEMPLO',
            'nacionalidad'      => 'VALOR DE EJEMPLO',
            'nombre'            => 'VALOR DE EJEMPLO',
            'numeroDocumento'   => 'VALOR DE EJEMPLO',
            'piso'              => 'VALOR DE EJEMPLO',
            'plataforma'        => 'VALOR DE EJEMPLO',
            'secretaria'        => 'VALOR DE EJEMPLO',
            'sexo'              => 'VALOR DE EJEMPLO',
            'telefono'          => 'VALOR DE EJEMPLO',
            'telefonoLaboral'   => 'VALOR DE EJEMPLO',
            'tipoDeDocumento'   => 'VALOR DE EJEMPLO',
            'torre'             => 'VALOR DE EJEMPLO',
            'verificado'        => 'VALOR DE EJEMPLO',
        ];
    }

    private function getKCUser($username) {
        $retVal = $this->kcClient->getUsers([
            'username' => $username,
        ]);
        if ( count($retVal) <= 0 )
            return null;
        return $retVal[0];
    }

    private function sanitize($data) {
        $reqFields = [
            'nombre',
            'apellido',
            'correoElectronico'
        ];
        foreach ($reqFields as $f) {
            if (! array_key_exists($f,$data) )
                $data[$f] = "";
        }

        // Si vino el campo *password*, no lo uso para update, sino en la *reset-password*
        if (array_key_exists('password',$data) ) {
            $this->kcPassword = $data['password'];
            unset($data['password']);
        }

        return $data;

    }

    /**
     * Transforma los datos de la buv en datos de keycloak
     *
     * @param array $data
     * @return array
     */
    private function kcDataFromData($data) : array {
        $hash = [
            'username'      => 'username',
            'firstName'     => 'nombre',
            'lastName'      => 'apellido',
            'email'         => 'correoElectronico',
            'id'            => '_id',
        ];
        $newData = [];
        foreach ($hash as $key => $value) {
            if ( array_key_exists($value,$data) )
                $newData[$key] = $data[$value];
        }

        return $newData;
    }

    /**
     * Invocacion a la REST de Keycloak para crear un usuario
     *
     * @param array Los datos a insertar
     * @return array El registro insertado
     */
    private function createKCUser($data) : array {
        $userData = $this->kcDataFromData($data);
        $userData['enabled'] = true;
        $userData['emailVerified'] = false;
        $retVal = $this->kcClient->createUser($userData);
        if ( array_key_exists('errorMessage',$retVal) )
            throw new Exception(($retVal['errorMessage']));

        $kcUser =  $this->getKCUser($data['username']);

        $this->updateKCCredentials($kcUser['id']);

        return $kcUser;
                
    }

    /**
     * Override
     *
     * @param array $data
     * @return int
     */
    public function createRec($data): int
    {
        $data = $this->sanitize((array)$data);
        // Inserto en keycloak
        $newData = $this->createKCUser($data);

        $data['_id'] = $newData['id'];

        return parent::createRec($data);
    }

    /**
     * Invocacion a la REST de Keycloak para borrar un usuario
     * 
     * @param string $_id
     * @return void
     */
    private function deleteKCUSer($_id) {
        $retVal = $this->kcClient->deleteUser([
            'id' => $_id,
        ]);
        if ( array_key_exists('errorMessage',$retVal) )
            throw new Exception(($retVal['errorMessage']));
    }

    /**
     * Override
     *
     * @param int $id
     * @return void
     */
    public function deleteRec($id)
    {
        $data = $this->model->find($id);

        $this->deleteKCUSer($data['_id']);
        return parent::deleteRec($id);
    }

    /**
     * Invocacion a la REST de Keycloak para modificar un usuario
     * 
     * @param array $data
     * @return void
     */
    private function updateKCUSer($data) {
        $retVal = $this->kcClient->updateUser($data);
        if ( array_key_exists('errorMessage',$retVal) )
            throw new Exception(($retVal['errorMessage']));
    }


    /**
     * Override
     *
     * Update de un registro
     *
     * @param mixed $id
     * @param mixed $data
     *
     * @return void
     */
    public function updateRec($id, $data){
        $data = $this->sanitize((array)$data);
        $oldData = $this->model->find($id);
        $data['_id'] = $oldData['_id'];

        $userData = $this->kcDataFromData($data);

        $this->updateKCUSer($userData);
        $data['id'] = $id;

        if ( $this->kcPassword != null) {
            $this->updateKCCredentials($data['_id']);
        }
        
        return parent::updateRec($id,$data);

    }

    private function updateKCCredentials($id) {
        // Si no se pasó password, pido reset de credenciales
        if ( $this->kcPassword == null) {
            $retVal = $this->kcClient->executeActionsEmail([
                'realm'        => $this->cfg->realm,
                'id'           => $id,
                'client_id'    => $this->cfg->adminClient,
                'lifespan'     => 60*12,
                'redirect_uri' => null,
                'actions'      => [
                    'VERIFY_EMAIL', 
                    'UPDATE_PASSWORD'
                ],
            ]);
        } else {
            $retVal = $this->kcClient->resetUserPassword([
                'id'           => $id,
                'realm'        => $this->cfg->realm,
                'cred'         => [ 
                    'type'       => 'password', 
                    'temporary'  => false, 
                    'value'      => $this->kcPassword
                ]
            ]);
        }

        if ( array_key_exists('errorMessage',$retVal) )
            throw new Exception(($retVal['errorMessage']));

    }

    public function getUserInfo() {
        return $this->respond(["userInfo" =>service('whoami')->getUserInfo()]);
    }

}