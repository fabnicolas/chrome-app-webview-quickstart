# Chrome WebView quickstart

While continuing my research about how to make a cross-platform desktop application based on ViStriker website, using a WebView and just connecting to the site without rewrite the application from scratch, I found this lightweight alternative: Google packaged Apps.

From: https://developer.chrome.com/apps/about_apps ,

"Chrome Apps let you use HTML5, CSS, and JavaScript to deliver an experience comparable to a native application."

Let's give a try!

## Notice
This is a temporary solution. As provided in the link above, Chrome packaged apps will be discontinued in the early 2018.

## Results
Obviously, results are amazing.

![image](https://i.imgur.com/kLq5pCR.png)

And it occupies only 16 KB disk space. This is an impressive result.

## Why it is so lightweight?
Chrome apps, in order to run, needs to have Google Chrome installed to work.

In fact, launchers like `linux_launcher.sh` launch the following process:
```
google-chrome --silent-launch --load-and-launch-app=$PWD/app
```
1) So we must have Google Chrome installed to run 'google-chrome' process;
2) Google Chrome is silently launched, so user doesn't notice it might be actually a Google Chrome application;
3) Flag `--load-and-launch-app` installs our Google App as an extension, temporarly, by fetching files inside `app` folder in the current working directory (PWD) such as `manifest.json` that contains application metadata, assets and more.

Although Google Chrome is a VERY common browser and it is installed on lots of machines, there are users who do not have it installed, therefore our application will not run without Chrome. This is a drawback to consider.

Another drawback, as stated above in "Notice" section, is the discontinuity of Google packaged apps. However you can follow a migration process. Check this resource: https://developers.chrome.com/apps/migration

I like this solution because it is VERY lightweight since I use Google Chrome on my computer.

In order to change webview website, edit the following line inside `/app/window.html`:
```html
    <webview src="http://finalgalaxy.github.io/vistriker-FE/"></webview>
```

Notice also that Google Apps have more features than just embedding websites.
