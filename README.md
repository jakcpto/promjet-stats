# promjet-stats
Statistics of visitors from some site compaired to Yandex.Metrika or Google Analitycs data.
____

> Vote for us at [The Contest](https://openexchange.intersystems.com/contest/17)!
> This is our first apllication.
> We will be very thankfull for your support and feedback.

This application arose from the need to control the number of visitors to the client's site (promjet.ru).
External visitor tracking systems (Yandex.Metrica, Google Analytics) show slightly distorted indicators, because the Firefox browser and some of its branches block tracking tools, which include metrics systems, as well as ad blockers block these services.

![image](https://user-images.githubusercontent.com/41373877/132135881-17171c41-dd15-4f50-9b3b-286e45d735df.png)

We decided to rely on data from the Apache web server log files, they also record all information about visitors.
In addition, we can see the load created by search robots and content indexing systems.
![image (1)](https://user-images.githubusercontent.com/41373877/132135944-fa79a1fe-e206-4d62-aa7b-a79ffcbb60f9.png)

Links to actual demos attached in [Examples](https://github.com/jakcpto/promjet-stats/blob/main/README.md#examples) .

## Requirements
- Access to hosting via FTP or SSH
- Access to logfiles from php scripts
- Oauth token for Yandex.Metrika access

## Data source

First, you need to place a specially written PHP script on the hosting that takes data from log files and converts them to CSV format.
This file must be uploaded to webserver in folder "/api/get_scv/" from root of the site.
As an authentic tool we use token, sent via GET request (added in URL).
This token and filename for logfile is stored in the beginnig of index.php file.
![image](https://user-images.githubusercontent.com/41373877/132136017-961a5873-cd75-4582-a409-911a31aa6f6d.png)

On IRIS side this token was stored in "iris.script" file previosly.

![image](https://user-images.githubusercontent.com/41373877/132136082-10349bb3-a154-4f02-a4c5-047527928f69.png)

Later we replaced it by "csvgen" package and by command for importing data from website:
```
zpm "install csvgen"
d ##class(community.csvgen).GenerateFromURL("https://promjet.ru/api/get_csv/?token=6ab225b4-43b5-410a-ac9a-11c1dc2a8c6c",",","dc.irisbi.Promjet")
```

Data from Yandex Metrika also needs special PHP file stored on hosting.
Copy source file from "/api/get_csv_YaMetrika/" to your hosting root folder and change values in KEY and OAuthToken variables fitted to your projects.
![image](https://user-images.githubusercontent.com/41373877/132722950-14a60ecf-b3df-413b-aa02-6937e8fe4761.png)

## Cube
This data is taken by IRIS, builds a cube and outputs it to DeepSee or DSW.
The second Cube is built in AtScale

## Examples
Currently IRIS BI available at this [demo site](http://atscale.teccod.com:32792/dsw/index.html#/IRISAPP/Dashboard/)

Data from IRIS goes to AtScale server deployed at [ISC AtScale Server](http://isc.atscale.com:10500/org/default/project/0c0248ba-95ac-4ded-6126-d6c29259c65a).
There builds a cube, merging data from hosting and from Yandex.Metrika
![image](https://user-images.githubusercontent.com/41373877/132881969-5ce1da32-b434-4fd8-9939-b8d539d19172.png)

Dashboard on PowerBI get data from the cube and display it in widgets. 
Application published under [this link](https://app.powerbi.com/view?r=eyJrIjoiNzAxYTQ1NDAtNDY1ZC00ZTU2LWI3NDgtNjI5ZWZlMjc4NjU0IiwidCI6ImMwNDU1OGJhLWJiMzgtNDQzMC1iMDhkLThlMTYxMmQzY2NkOCIsImMiOjl9)
Also we have an interactive page on our site with built-in PowerBI dashboards [there](https://teccod.ru/atscale-powerbi)

![image](https://user-images.githubusercontent.com/41373877/132721077-9724703e-409e-4d70-8aa9-33dcdc1c468c.png)

Filters works by click on value
![image](https://user-images.githubusercontent.com/41373877/132721391-d1e94a64-f524-4ccc-8354-8a06773735b1.png)

Tableau version accessible with 
[This Public Tableau Page 1](https://public.tableau.com/app/profile/vladislav4262/viz/Book2_16312770743230/Overview)
[This Public Tableau Page 2](https://public.tableau.com/app/profile/vladislav4262/viz/Book2_16312770743230/YandexMetrika)

Logi version of reports is also in repo.
Screenshots attached below:
![image (35)](https://user-images.githubusercontent.com/41373877/133738437-0cc8e5dc-1ea6-4491-8dbd-b1c7e9cbee6c.png)
![image (37)](https://user-images.githubusercontent.com/41373877/133738475-bb4f8d1c-03ba-4811-9e27-6ed5ed881a75.png)
Logi server deployed at http://atscale.teccod.com:8888/jinfonet/welcome.jsp
