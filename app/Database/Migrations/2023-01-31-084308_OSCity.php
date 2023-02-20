<?php

namespace App\Database\Migrations;

use CodeIgniter\Database\Migration;

class OSCity extends Migration
{
    public function up()
    {
        $this
            ->forge
            ->addColumn('buv_data',[
                'id_oscity'          => ['type' =>  'text', 'null' => true, 'after' => '_id'],
            ]);

        $this
            ->forge
            ->addKey('id_oscity', false);

    }

    public function down()
    {
        $this
            ->forge
            ->dropColumn('buv_data','id_oscity');
    }
}
