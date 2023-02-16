<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class Direcciones extends Migration
{
    public function up()
    {
        $this
        ->forge
        ->addField([
            'id'                => ['type' => 'INT', 'auto_increment' => true],
            'descripcion'       => ['type' => 'TEXT', 'null' => false],
            'created_at'        => ['type' => 'datetime', 'null' => false],
            'updated_at'        => ['type' => 'datetime', 'null' => true]
        ]);

        $this
            ->forge
            ->addKey('id', true);

        $this
            ->forge
            ->createTable('buv_tipo_domicilio',false,['ENGINE' => 'InnoDB']);

        $this
            ->forge
            ->addField([
                'id'                => ['type' => 'INT', 'auto_increment' => true],
                'idVecino'          => ['type' => 'INT', 'null' => false],
                'calle'             => ['type' =>  'text', 'null' => true],
                'numero'            => ['type' =>  'text', 'null' => true],
                'depto'             => ['type' =>  'text', 'null' => true],
                'piso'              => ['type' =>  'text', 'null' => true],
                'torre'             => ['type' =>  'text', 'null' => true],
                'cp'                => ['type' =>  'text', 'null' => true],
                'localidad'         => ['type' =>  'text', 'null' => true],
                'partido'           => ['type' =>  'text', 'null' => true],
                'tipoDomicilio'     => ['type' =>  'INT', 'null' => false],
                'estadoDomicilio'   => ['type' =>  'INT', 'null' => false],
                'created_at'        => ['type' => 'datetime', 'null' => false],
                'updated_at'        => ['type' => 'datetime', 'null' => true]
            ]);

        $this
            ->forge
            ->addKey('id', true);

        $this
            ->forge
            ->addForeignKey('idVecino', 'buv_data', 'id', 'CASCADE', 'CASCADE');
        $this
            ->forge
            ->addForeignKey('tipoDomicilio', 'buv_tipo_domicilio', 'id', 'CASCADE', 'CASCADE');

        $this
            ->forge
            ->createTable('buv_domicilio',false,['ENGINE' => 'InnoDB']);
    }

    public function down()
    {
        $this
            ->forge
            ->dropTable('buv_domicilio');
        $this
            ->forge
            ->dropTable('buv_tipo_domicilio');
    }
}
