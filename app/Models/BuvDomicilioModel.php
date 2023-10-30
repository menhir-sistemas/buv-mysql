<?php

namespace App\Models;

use CodeIgniter\Database\ConnectionInterface;
use CodeIgniter\Validation\ValidationInterface;

class BuvDomicilioModel extends BaseModel
{
    protected $DBGroup          = 'default';
    protected $table            = 'buv_domicilio';
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
    protected $afterFind      = [];
    protected $beforeDelete   = [];
    protected $afterDelete    = [];


    public function __construct(ConnectionInterface &$db = null, ValidationInterface $validation = null)
    {
        $this->is_log = true;
        parent::__construct($db, $validation);
    }
    /**
     * saveArrayOfDomicilios
     * 
     * Graba los (posiblemente nuevos) domicilios en la base de datos
     *
     * @param int $owner El id del vecino
     * @param array $domicilios Los domicilios
     * @return void
     */
    public static function saveArrayOfDomicilios($owner, $domicilios){

        $model = new BuvDomicilioModel();
        
        // Borro los domicilios anteriores
        $x = $model->where('idVecino',$owner)->delete();

        // Inserto lo que me llegó
        foreach ($domicilios as $dom) {
            $dom['idVecino'] = $owner;
            $model->insert($dom);
        }


    }
}
