<?php

class CsvHandler{
    public static function ObtenerDatosUsuarios($pathArchivo){
        if ($pathArchivo === NULL) return array();

        $arrayColumnas = array("usuario","clave", "rol");
        $retorno = array();
    
        if (($archivo = fopen($pathArchivo, "r")) !== false) {
            while (($data = fgetcsv($archivo, 0, ',')) !== false) {
                $count = count($data);
                $datosArchivo = array();

                if ($count != count($arrayColumnas)) {
                    fclose($archivo);
                    var_dump($array);
                    return array();
                }

                for ( $index = 0; $index < $count; $index++ ) {
                    $datosArchivo[$arrayColumnas[$index]] = $data[$index];
                }
                array_push($retorno, $datosArchivo);
            }
            fclose($archivo);
        }
        return $retorno;
    }

    public static function ObtenerArchivo ( string $nombreFile ) : ?string {
        return (key_exists($nombreFile, $_FILES)) ? $_FILES[$nombreFile]['tmp_name'] : NULL;
    }

    public static function GenerarCodigo()
    {
        return substr(str_shuffle(str_repeat("0123456789abcdefghijklmnopqrstuvwxyz", 5)), 0, 5);
    }

    public static function GenerarArchivo($data, $filename = 'output.csv') {
        $file = fopen($filename, 'w');
    
        if (!empty($data)) {
            $firstRow = reset($data);
            $header = array_keys(get_object_vars($firstRow));
            fputcsv($file, $header);
        }
    
        foreach ($data as $row) {
            fputcsv($file, get_object_vars($row));
        }
    
        fclose($file);
    }
}

?>