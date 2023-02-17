<?php

namespace App\Controllers;

use App\Controllers\BaseController;

class Test extends BaseController
{
    public function index()
    {
        // TODO: chequear development
        return view('test/index.php');
    }
}
