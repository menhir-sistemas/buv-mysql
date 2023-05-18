<?php

namespace App\Exceptions;

use CodeIgniter\HTTP\Exceptions\HTTPException;
use CodeIgniter\HTTP\ResponseInterface;

class HTTPCustomException extends HTTPException {

    public static function forUnauthorized()
     {
        $retVal =  new static(lang('HTTP.unauthorized'));

        $retVal->code = ResponseInterface::HTTP_UNAUTHORIZED;

        return $retVal;
    }

}