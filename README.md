# promjetstats
Statistics of visitors from any site compaired to Yandex.Metrika or Google Analitycs data.

This application arose from the need to control the number of visitors to the client's site (promjet.ru).
External visitor tracking systems (Yandex.Metrica, Google Analytics) show slightly distorted indicators, because the Firefox browser and some of its branches block tracking tools, which include metrics systems, as well as ad blockers block these services.

![image](https://user-images.githubusercontent.com/41373877/132135881-17171c41-dd15-4f50-9b3b-286e45d735df.png)

We decided to rely on data from the Apache web server log files, they also record all information about visitors.
In addition, we can see the load created by search robots and content indexing systems.
![image (1)](https://user-images.githubusercontent.com/41373877/132135944-fa79a1fe-e206-4d62-aa7b-a79ffcbb60f9.png)

## data source

First, you need to place a specially written PHP script on the hosting that takes data from log files and converts them to CSV format.
This file must be uploaded to webserver in folder "/api/get_scv/" from root of site.
As an authentic tool we use token, send via GET request (added in URL).
This token and filename for logfile is stored in the beginnig of index.php file.
![image](https://user-images.githubusercontent.com/41373877/132136017-961a5873-cd75-4582-a409-911a31aa6f6d.png)

On IRIS side this token was stored in "iris.script" file previosly.

![image](https://user-images.githubusercontent.com/41373877/132136082-10349bb3-a154-4f02-a4c5-047527928f69.png)

Later we replaced it by "csvgen" package and by command for importing data from website:
```
zpm "install csvgen"
d ##class(community.csvgen).GenerateFromURL("https://promjet.ru/api/get_csv/?token=6ab225b4-43b5-410a-ac9a-11c1dc2a8c6c",",","dc.irisbi.Promjet")
```

This data is taken by IRIS, builds a cube and outputs it to DeepSee or DSW.

Then we plan to transfer this information to Atscale, and from it to PowerBI and Tableau.
