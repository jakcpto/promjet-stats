<?php 

    $key = '6ab225b4-43b5-410a-ac9a-11c1dc2a8c6c';
    $OAuthToken = 'AQAEA7qj1Di7AAdaeUKugGDXdEwyrSdpuOqWuq4';
    $fileHeader = array('DateVisit', 'OS', 'OSRoot', 'Browser', 'DeviceType', 'AdBlock', 'TrafficSource', 'Sessions', 'Users');

    if($_GET['token'] != $key){
        http_response_code(404);
        die();
    }

    header("Content-type: text/csv");
    header("Cache-Control: no-store, no-cache");
    header('Content-Disposition: attachment; filename=file.csv');

    $opts = array(
        'http'=>array(
            'method'=>"GET",
            'header'=>"Authorization:OAuth ". $OAuthToken
        )
    );

    $url = 'https://api-metrika.yandex.net/stat/v1/data.csv'.
        '?id=22404520'.
        '&date1=2021-08-01'.
        '&date2=2021-08-31'.
        '&dimensions=ym:s:date,ym:s:operatingSystem,ym:s:operatingSystemRoot,ym:s:browser,ym:s:deviceCategory,ym:s:hasAdBlocker,ym:s:<attribution>TrafficSource'.
        '&metrics=ym:s:visits,ym:s:users'.
        '&limit=10000';
    
    $context = stream_context_create($opts);
    $file = explode("\n", file_get_contents($url, false, $context));
    $file[0] = implode(',', $fileHeader); unset($file[1]);
    file_put_contents("php://output", implode("\n", $file));

?>