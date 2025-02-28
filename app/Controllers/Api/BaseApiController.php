<?php

namespace App\Controllers\Api;

use CodeIgniter\API\ResponseTrait;
use CodeIgniter\HTTP\RequestInterface;
use CodeIgniter\HTTP\ResponseInterface;
use CodeIgniter\RESTful\ResourceController;
use Psr\Log\LoggerInterface;


/**
 * BaseApiController.
 *
 * Clase base de todos los Controladores de api
 */
class BaseApiController extends ResourceController
{
    use ResponseTrait;

    protected $format = 'json';
    protected $whoami = null;
    protected $me = null;

    /**
     * Indica si las operaciones REST mutables requieren acceso de realmAdmin
     *
     * @var boolean
     */
    protected bool $requiresRootForMutable = true;

    /**
     * Constructor.
     */
    public function initController(RequestInterface $request, ResponseInterface $response, LoggerInterface $logger)
    {
        // Do Not Edit This Line
        parent::initController($request, $response, $logger);

        helper(['general','jwt']);

        try {
            // El header de authorization 
            $authHeader = $request->getHeader('Authorization')->getValueLine();
            service('whoami')->setHeader($authHeader);
        } catch (\Throwable $th) {
            $this->me = null;
        }
    }

    /**
     * index devuelve todos los elementos.
     *
     * @return void
     */
    public function index()
    {
        try {
            if ( $this->requiresRootForMutable && !service('whoami')->canGet() )
                return $this->respond([],ResponseInterface::HTTP_UNAUTHORIZED);       
        } catch (\Throwable $th) {
            return $this->respond(ResponseInterface::HTTP_UNAUTHORIZED);
        }

        try {
            $params = $this->request->getGet();
    
            $result = $this->model->index($params);
    
            return $this->respond($result);
        } catch (\Throwable $th) {
            return $this->respond(['error' => $th->getMessage()], ResponseInterface::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * show Busca un registro vía GET
     * URL (model_url/(:num).
     *
     * @param mixed $id el id
     *
     * @return void
     */
    public function show($id = null)
    {
        try {
            if ( $this->requiresRootForMutable && !service('whoami')->canGet() )
                return $this->respond([],ResponseInterface::HTTP_UNAUTHORIZED);       
        } catch (\Throwable $th) {
            return $this->respond(ResponseInterface::HTTP_UNAUTHORIZED);
        }

        return $this->respond($this->model->find($id));
    }

    /**
     * create Inserta un registro vía POST
     * URL : model_url.
     *
     * @return void
     */
    public function create()
    {
        try {
            if ( $this->requiresRootForMutable && !service('whoami')->canPost() )
                return $this->respond([],ResponseInterface::HTTP_UNAUTHORIZED);       
        } catch (\Throwable $th) {
            return $this->respond(ResponseInterface::HTTP_UNAUTHORIZED);
        }

        $saveData = $this->getRequestInput();

        try {

            $id = $this->createRec($saveData);

            if ( $id === false) {
                return $this->respond(['errors' => $this->getErrors()], ResponseInterface::HTTP_INTERNAL_SERVER_ERROR);
            }
            return $this->respond(['id' => $id]);
        } catch (\Throwable $th) {
            return $this->respond(['error' => $th->getMessage()], ResponseInterface::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * update Actualiza el registro vía PUT
     * URL : model_url/(:num).
     *
     * @param mixed $id El id del registro
     *
     * @return void
     */
    public function update($id = null)
    {
        try {
            if ( $this->requiresRootForMutable && !service('whoami')->canPut())
                return $this->respond([],ResponseInterface::HTTP_UNAUTHORIZED);       
        } catch (\Throwable $th) {
            return $this->respond(ResponseInterface::HTTP_UNAUTHORIZED);
        }

        $updateData = $this->getRequestInput();

        try {
            // Primero busco a ver si existe
            if ( $this->model->find($id) == null )
                return $this->respond(['error' => "NOT_FOUND"], ResponseInterface::HTTP_NOT_FOUND);;
                
            // Para las validaciones tengo que agregar el id al array de datos
            $updateData->id = $id;
            if ($this->updateRec($id, $updateData) === false) {
                return $this->respond(['errors' => $this->getErrors()], ResponseInterface::HTTP_INTERNAL_SERVER_ERROR);
            }

            return $this->respond(['message' => 'OK']);
        } catch (\Throwable $th) {
            return $this->respond(['error' => $th->getMessage()], ResponseInterface::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * delete Maneja el borrado vía DELETE
     * URL : model_url/(:id).
     *
     * @param mixed $id
     *
     * @return void
     */
    public function delete($id = null)
    {
        try {
            if ( $this->requiresRootForMutable && !service('whoami')->canDelete())
                return $this->respond([],ResponseInterface::HTTP_UNAUTHORIZED);       
        } catch (\Throwable $th) {
            return $this->respond(ResponseInterface::HTTP_UNAUTHORIZED);
        }

        try {
            // Primero busco a ver si existe
            if ( $this->model->find($id) == null )
                return $this->respond(['error' => "NOT_FOUND"], ResponseInterface::HTTP_NOT_FOUND);;

            $ok = $this->deleteRec($id);
            if ( $ok === false) {
                return $this->respond(['error' => $this->getErrors()], ResponseInterface::HTTP_INTERNAL_SERVER_ERROR);
            }

            return $this->respond(['message'=> 'OK']);
        } catch (\Throwable $th) {
            return $this->respond(['error' => $th->getMessage()], ResponseInterface::HTTP_INTERNAL_SERVER_ERROR);
        }
    }

    /**
     * new.
     *
     * Devuelve un registro de ejemplo
     */
    public function new()
    {
        try {
            if ( $this->requiresRootForMutable && !service('whoami')->canGet())
                return $this->respond([],ResponseInterface::HTTP_UNAUTHORIZED);       
        } catch (\Throwable $th) {
            return $this->respond(ResponseInterface::HTTP_UNAUTHORIZED);
        }
            
        $retVal = (object) $this->newRec();

        return $this->respond($retVal, ResponseInterface::HTTP_OK);
    }

    /**
     * newRec.
     *
     * Crea un registro de ejemplo (para hacer override)
     *
     * @return array
     */
    protected function newRec(): array
    {
        return [];
    }

    /**
     * createRec.
     *
     * Un nuevo registro
     *
     * @param mixed $data
     *
     * @return int
     */
    public function createRec($data) : int
    {
        return $this->model->createRec($data);
    }

    /**
     * updateRec.
     *
     * Update de un registro
     *
     * @param mixed $id
     * @param mixed $data
     *
     * @return void
     */
    public function updateRec($id, $data)
    {
        return $this->model->updateRec($id, $data);
    }

    /**
     * deleteRec.
     *
     * Borrado de un registro
     *
     * @param mixed $id
     *
     * @return void
     */
    public function deleteRec($id)
    {
        return $this->model->deleteRec($id);
    }
    /**
     * getRequestInput Manejo del post, tanto json como form.
     *
     * @return object El input/body procesado
     */
    protected function getRequestInput(): object
    {
        $input = $this->request->getPost();
        if (empty($input)) {
            $input = $this->request->getJson(true);
        }

        return (object) $input;
    }

    /**
     * getErrors.
     *
     * Devuelve los errores del modelo en un formato como para mostrar
     *
     * @return void
     */
    protected function getErrors()
    {
        $retVal = [];
        foreach ($this->model->errors() as $key => $error) {
            $retVal[] = [
                'field' => $key,
                'text' => lang($error),
            ];
        }

        return $retVal;
    }
}
