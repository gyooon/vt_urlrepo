# vt_urlrepo
Retrieving VirusTotal URL scan reports  

csv format  
scan_date,url,positives,total,positives detail  


# Requirement
You should put your api key in this script

# Usage
perl vt_urlrepo.pl  
or  
echo \<URL\> | perl vt_urlrepo.pl  


# Exapmples

```sh
$ perl vt_urlrepo.pl
www.yahoo.co.jp
2016-02-29 01:15:05,http://www.yahoo.co.jp/,2,67,CLEAN MX:phishing site;SCUMWARE.org:malware site
```

```sh
$ echo www.yahoo.co.jp | perl vt_urlrepo.pl
2016-02-29 01:15:05,http://www.yahoo.co.jp/,2,67,CLEAN MX:phishing site;SCUMWARE.org:malware site
```


```sh
$ while read line;do echo $line|perl vt_urlrepo.pl;sleep 16;done < list.txt
2016-02-29 01:15:05,http://www.yahoo.co.jp/,2,67,CLEAN MX:phishing site;SCUMWARE.org:malware site
2016-02-29 02:36:42,http://www.google.co.jp/,0,67,
2016-02-28 09:10:26,http://qiita.com/,0,67,
2016-02-28 09:01:53,http://hatenablog.com/,0,67,
```
By reason of the 4 requests/minute limitation of the Public API, I put 16 sleep.



