
1. [Katana Test](#katana-test)


# Katana Test

1. Command from online 

```sh 
katana -u "fonda.txt" \
    -duc -silent -nc -jsl -kf -fk -xhr -ef \
    woff,css,png,svg,jpg,woff2,jpeg,gif, 
```
Command translation 

switches | explanation 
---| ---
`-duc` | -d = depth , -u = list also you can use --list , -c concurrency 
`-silent` | display output only
`-nc` | no color for capturing output 
`-jsl` | enable jsluice parsing in javascript file (memory intensive)
`-kf` | enable crawling of known files (all,robotstxt,sitemapxml), a minimum depth of 3 is required to ensure all known files are properly crawled.
`-fk` | extract form, input, textarea & select elements in jsonl output
`-xhr` | extract xhr request url,method in jsonl output
`-ef` | filter output for given extension (eg, -ef php,html,js)