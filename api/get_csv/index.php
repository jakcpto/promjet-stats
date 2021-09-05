<?php

    $key = '6ab225b4-43b5-410a-ac9a-11c1dc2a8c6c';
    $logFilePath = 'promjet.archjet.ru-Aug-2021.gz';
    $saveFileName = 'file.csv';

    if($_GET['token'] != $key){
        http_response_code(404);
        die();
    }

    header("Content-type: text/csv");
    header("Cache-Control: no-store, no-cache");
    header('Content-Disposition: attachment; filename="'.$saveFileName.'"');

    $lines = gzfile($logFilePath);
    $fp = fopen('php://output', 'w');

    fputcsv($fp, array('ip', 'time', 'method', 'url', 'status_code', 'full_url', 'core', 'device', 'agent'));

    foreach($lines as $item){

        $list = explode(" ", $item);
        $device = explode(';', explode('(', $item)[1]);
        $agent = substr($item, strrpos($item, "\"", -3) + 1, - 2);
        $splitAgent = explode(';', stristr(substr($agent, strpos($agent, '(') + 1), ')', true));
        $timestamp = strtotime(substr(strstr($item, ' +', true), strpos($item, '[') + 1));
        $date = date_create();

        fputcsv($fp, array(
            stristr($item, '- -', true),
            // date_format(date_timestamp_set($date, $timestamp), 'U = Y-m-d H:i:s'),
            $timestamp,
            substr($list[5], 1),
            $list[6],
            $list[8],
            substr($list[10], 1, strlen($list[10]) - 2),
            $splitAgent[0],
            substr($splitAgent[1], 2),
            str_replace(';', ' ', $agent)
        ));
    }

    fclose($fp);
?>