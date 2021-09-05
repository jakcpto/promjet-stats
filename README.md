# promjetstats
Statistics from promjet.ru site compaired to Yandex.Matrika statistics

This application arose from the need to control the number of visitors to the client's site.
External visitor tracking systems (Yandex.Metrica, Google Analytics) show slightly distorted indicators, because the Firefox browser and some of its branches block tracking tools, which include metrics systems, as well as ad blockers block these services.

We decided to rely on data from the Apache web server log files, they also record all information about visitors.
In addition, we can see the load created by search robots and content indexing systems.

First, you need to place a specially written PHP script on the hosting that takes data from log files and converts them to CSV format.

This data is taken by IRIS, builds a cube and outputs it to DeepSee or DSW.

Then we plan to transfer this information to Atscale, and from it to PowerBI and Tableau.