<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class BorradoLogico extends Migration
{
    public function up()
    {
        $this
            ->forge
            ->addColumn('buv_data',[
                'deleted_at'  => ['type' =>  'datetime', 'null' => true]
        ]);

        $this
            ->forge
            ->addColumn('buv_domicilio',[
                'deleted_at'  => ['type' =>  'datetime', 'null' => true]
        ]);

        
        
    }

    public function down()
    {
        $this
            ->forge
            ->dropColumn('buv_data','deleted_at');
        $this
            ->forge
            ->dropColumn('buv_domicilio','deleted_at');
    }
}
