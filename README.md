# promjetstats
Statistics of visitors from any site compaired to Yandex.Metrika statistics

This application arose from the need to control the number of visitors to the client's site (promjet.ru).
External visitor tracking systems (Yandex.Metrica, Google Analytics) show slightly distorted indicators, because the Firefox browser and some of its branches block tracking tools, which include metrics systems, as well as ad blockers block these services.

We decided to rely on data from the Apache web server log files, they also record all information about visitors.
In addition, we can see the load created by search robots and content indexing systems.

## data source

First, you need to place a specially written PHP script on the hosting that takes data from log files and converts them to CSV format.
As an authentic tool we use token, send via GET request (added in URL).

Previously this token was stored in "iris.script" file (screenshot will be attached)

Later we moved it to "csvgen" command 

This data is taken by IRIS, builds a cube and outputs it to DeepSee or DSW.

Then we plan to transfer this information to Atscale, and from it to PowerBI and Tableau.