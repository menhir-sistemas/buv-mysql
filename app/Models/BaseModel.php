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
        return $this->insert($data);
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
        return $this->update($id, $data);
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
        return $this->delete($id);
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
