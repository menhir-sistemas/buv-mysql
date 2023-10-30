<?php

namespace App\Models;

use CodeIgniter\Database\ConnectionInterface;
use CodeIgniter\Validation\ValidationInterface;


class BUVDataModel extends BaseModel
{
    protected $DBGroup          = 'default';
    protected $table            = 'buv_data';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $insertID         = 0;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = true;
    protected $protectFields    = false;
    protected $allowedFields    = [];

    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = 'deleted_at';

    // Validation
    protected $validationRules      = [];
    protected $validationMessages   = [];
    protected $skipValidation       = false;
    protected $cleanValidationRules = true;

    // Callbacks
    protected $allowCallbacks = true;
    protected $beforeInsert   = [];
    protected $afterInsert    = [];

    protected $beforeUpdate   = [];
    protected $afterUpdate    = [];
    protected $beforeFind     = [];
    protected $afterFind      = [ 'addDomicilios' ];
    protected $beforeDelete   = [];
    protected $afterDelete    = [];

    protected $is_log = true;

    public function __construct(ConnectionInterface &$db = null, ValidationInterface $validation = null)
    {
        $this->is_log = true;
        parent::__construct($db, $validation);
    }

    /**
     * Migra una fila entera
     *
     * @param string $_id     El id del indice de eslasticsearch
     * @param array  $colData El resto de los datos
     * @return int  El nuevo id (numerico)
     */
    public function newRow($_id,$colData) {
        $newData = [];
        $newData['_id'] = $_id;

        // Todo lo que es string vacío lo paso como null
        foreach ($colData as $key => $value) {
            if ( empty($value) )
                $value = null;
            $newData[$key] = $value;
        }

        return $this->insert($newData);
    }

    /**
     * Busca un registro por id de keycloak
     *
     * @param string $kcId
     * @return void
     */
    public static function getDataByKCId(string $kcId) {
        $model = new BUVDataModel();

        $resp = $model->where('_id',$kcId)->findAll();

        if ( count($resp) == 0 )
            return null;

        return $resp[0];

    }

    public function addDomicilios($data) {

        if ( $data['method'] === 'findAll' ) {
            for ($i=0; $i < count($data['data']); $i++) { 
                $id = $data['data'][$i]['id'];
                $data['data'][$i]['domicilios'] = $this->getDomicilios($id);
            }
        } else {
            $data['data']['domicilios'] = $this->getDomicilios($data['id']);
        }


        return $data;

    }

    private function getDomicilios($id) {
        $model = new BuvDomicilioModel();
        return $model->where('idVecino',$id)->findAll();
    }

    /**
     * createRec.
     *
     * Un nuevo registro
     *
     * @param mixed $data
     *
     * @return void
     */
    public function createRec($data)
    {
        $domicilios = null;
        // Extraigo los domicilios
        if ( array_key_exists( 'domicilios',$data)){
            $domicilios = $data['domicilios'];
            unset($data['domicilios']);
        }
        $id = parent::createRec($data);

        if ( $domicilios !== null ){
            // Inserto los domicilios
            BuvDomicilioModel::saveArrayOfDomicilios($id,$domicilios);
        }

        return $id;
    }

    /**
     * Override
     *
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

        $domicilios = null;
        // Extraigo los domicilios
        if ( array_key_exists( 'domicilios',$data)){
            $domicilios = $data['domicilios'];
            unset($data['domicilios']);
        }


        $retVal = parent::updateRec($id,$data);

        if ( $domicilios !== null ){
            // Actualizo los domicilios
            BuvDomicilioModel::saveArrayOfDomicilios($id,$domicilios);
        }

        return $retVal;
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
        BuvDomicilioModel::saveArrayOfDomicilios($id,[]);
        return $this->delete($id);
    }


    /*

    */

}
