<?php

namespace App\Models;

use CodeIgniter\Model;

class BUVDataModel extends Model
{
    protected $DBGroup          = 'default';
    protected $table            = 'buv_data';
    protected $primaryKey       = 'id';
    protected $useAutoIncrement = true;
    protected $insertID         = 0;
    protected $returnType       = 'array';
    protected $useSoftDeletes   = false;
    protected $protectFields    = false;
    protected $allowedFields    = [];

    // Dates
    protected $useTimestamps = true;
    protected $dateFormat    = 'datetime';
    protected $createdField  = 'created_at';
    protected $updatedField  = 'updated_at';
    protected $deletedField  = '';

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
}
