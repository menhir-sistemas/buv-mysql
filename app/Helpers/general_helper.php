<?php

/**
 * Funciones de uso general.
 */

/**
 * getArrayKey.
 *
 * Dado un array, devuelve el contenido de la clave o null si no existe
 *
 * @param string $key       La clave a buscar
 * @param array  $array     El array donde buscarla
 * @param bool   $deleteKey Si es true, borra el elemento después de leerlo
 *
 * @return mixed
 */
function getArrayKey(string $key, array &$array, bool $deleteKey = true)
{
    try {
        $retVal = $array[$key];
        if ( $deleteKey )
            unset($array[$key]);

        return $retVal;
    } catch (\Throwable $th) {
        return null;
    }
}

/**
 * getFlatArray.
 *
 * Pasa un array anidado en 2 niveles a uno sin anidar (para los models)
 *
 * @param mixed $input
 * @param mixed $key
 *
 * @return array
 */
function getFlatArray(array $input, $key): array
{
    $retVal = [];

    foreach ($input as $item) {
        try {
            $retVal[] = $item[$key];
        } catch (\Exception $ex) {
        }
    }

    return $retVal;
}

function getObjKey(string $key, object &$objt, bool $deleteKey = true)
{
    try {
        $retVal = $objt->$key;
        if ( $deleteKey )
            unset($objt->$key);

        return $retVal;
    } catch (\Throwable $th) {
        return null;
    }
}

function dataFromJWT($data) {
    return  (array) json_decode(base64_decode(str_replace('_', '/', str_replace('-','+',explode('.', $data)[1]))));
}

