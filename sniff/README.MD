
1. [Katana Test](#katana-test)
2. [Installing Chrome In Debian](#installing-chrome-in-debian)


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

# Installing Chrome In Debian 

1. This is required by gowitness to run. 
2. Currently testing this 

https://webscraping.ai/faq/headless-chromium/how-do-i-install-headless-chromium-on-my-system

```code 
# Install wget if it's not already installed
sudo apt-get install wget

# Download the Google Chrome deb package
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

# Install the package using dpkg
sudo dpkg -i google-chrome-stable_current_amd64.deb

# If you encounter any errors during installation, run the following to fix missing dependencies
sudo apt-get install -f
```
