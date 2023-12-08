<?php

namespace App\Models;

use CodeIgniter\Model;
use CodeIgniter\Database\ConnectionInterface;
use CodeIgniter\Validation\ValidationInterface;

class BaseModel extends Model
{
    /**
     * start.
     *
     * Registro de inicio
     *
     * @var int
     */
    protected $start = 0;

    /**
     * limit.
     *
     * Cantidad de registros a traer
     *
     * @var int
     */
    protected $limit = 0;

    /**
     * El usuario corriente (puede ser nulo)
     */
    protected $me = null;

    protected $is_log = false;

    /**
     * Model constructor.
     *
     * Override: Carga de los helpers
     *
     * @param ConnectionInterface|null $db         DB Connection
     * @param ValidationInterface|null $validation Validation
     */
    public function __construct(ConnectionInterface &$db = null, ValidationInterface $validation = null)
    {
        parent::__construct($db, $validation);

        helper('general');

    }

    /**
     * index.
     *
     * Trae todos los registros asociados con el index del crud
     *
     * @param mixed $params Los parámetros leídos desde el get
     *
     * @return void
     */
    public function index(array $params)
    {
        $this->setIndexFilter($params);
        $this->setIndexOrder($params);
        $this->setIndexLimits($params);
        $this->setIndexSelect();

        return $this->findAll($this->limit, $this->start);
    }

    /**
     * show.
     *
     * Trae un registro en particular
     *
     * @param mixed $id
     *
     * @return void
     */
    public function show($id)
    {
        $this->setIndexSelect();

        return $this->find($id);
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
        $newData = $this->insert($data);
        if ( $this->is_log ) {
            // Grabo log
            $me = service('whoami')->userName();
            $logsModel = new LogsModel();
            $logsModel->insert ([
                'op'          => 'I',
                'table_name'  => $this->table,
                'id_rec'      => $newData,
                'user'        => $me,
                'prev'        => null,
                'post'        => json_encode($data)
            ]);
        }

        return $newData;
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
        if ( $this->is_log ){
            $prev = $this->previousData($id);
        }

        $newData = $this->update($id, $data);
        if ( $this->is_log ) {
            // Grabo log
            $me = service('whoami')->userName();
            $logsModel = new LogsModel();
            $logsModel->insert ([
                'op'          => 'U',
                'table_name'  => $this->table,
                'id_rec'      => $id,
                'user'        => $me,
                'prev'        => $prev,
                'post'        => json_encode($data)
            ]);
        }

        return $newData;
       
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
        if ( $this->is_log ){
            $prev = $this->previousData($id);
        }
        $ok = $this->delete($id);
        if ( $this->is_log ) {
            // Grabo log
            $me = service('whoami')->userName();
            $logsModel = new LogsModel();
            $logsModel->insert ([
                'op'          => 'D',
                'table_name'  => $this->table,
                'id_rec'      => $id,
                'user'        => $me,
                'prev'        => $prev,
                'post'        => null
            ]);
        }

        return $ok;

    }

    /**
     * Devuelve el registro previo
     */
    protected function previousData($id) {
        $prevData = $this->find($id);
        return json_encode($prevData);
    }

    /**
     * nonFilterKeys.
     *
     * Las claves que no son parte del filtro
     *
     * @var array
     */
    protected $nonFilterKeys = [
        '_', // La posible cookie de datatables
        'start',
        'limit',
        'order',
        'order_dir',
    ];

    /**
     * setIndexSelect.
     *
     * Arma el select básico (posiblemente con joins)
     *
     * @return void
     */
    protected function setIndexSelect()
    {
        return $this->select();
    }

    /**
     * Elimino los parámetros no relacionados con un filtro
     */
    public function removeNonFilterKeys(array $params) {
        $retVal = [];
        foreach ($params as $key => $value) {
            if (array_search($key, $this->nonFilterKeys) !== false) {
                continue;
            }
            $retVal[$key] = $value;
        }
        return $retVal;
    }

    /**
     * setIndexFilter.
     *
     * Si hay filtro, lo aplica
     *
     * @param mixed $params
     *
     * @return void
     */
    protected function setIndexFilter(array &$params)
    {
        foreach ($params as $key => $value) {
            if (array_search($key, $this->nonFilterKeys) !== false) {
                continue;
            }
            $this->where([$key => $value]);
        }
    }

    /**
     * setIndexOrder.
     *
     * Ordenamiento
     *
     * @param mixed $params
     *
     * @return void
     */
    protected function setIndexOrder(array &$params)
    {
        $order = getArrayKey('order', $params) ?? 'id';
        $orderDir = getArrayKey('order_dir', $params) ?? 'asc';
        $this->orderBy($order, $orderDir);
    }

    /**
     * setIndexLimits.
     *
     * Si hay limites, los aplica
     *
     * @param mixed $params
     *
     * @return void
     */
    protected function setIndexLimits(array &$params)
    {
        $this->start = + (getArrayKey('start', $params) ?? '0');
        $this->limit = + (getArrayKey('limit', $params) ?? '0');
    }
}
