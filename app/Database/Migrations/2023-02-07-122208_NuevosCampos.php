<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class NuevosCampos extends Migration
{
    public function up()
    {
        // Nuevos campos en la buv_data
        $this
            ->forge
            ->addColumn('buv_data',[
                'cuil'            => ['type' =>  'text', 'null' => true, 'after' => 'verificado'],
                'emailValidado'   => ['type' =>  'text', 'null' => true, 'after' => 'cuil'],
                'nivelValidacion' => ['type' =>  'text', 'null' => true, 'after' => 'emailValidado'],
            ]);

    }

    public function down()
    {
        $this
            ->forge
            ->dropColumn('buv_data',[
                'cuil',
                'emailValidado',
                'nivelValidacion'
            ]);
    }
}
