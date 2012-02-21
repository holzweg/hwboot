Bootstrap for eZ Publish
=======

Why Bootstrap?
----------------------------------------------------------
We believe in a fast yet configurable setup with no pain on the front end side. So do you?

Kickstart your project with the awesome Bootstrap framework by Twitter! 

--> See http://twitter.github.com/bootstrap for a full list of what's now at your fingertips.

How does it work?
----------------------------------------------------------
HWBoot works by overriding the ezwebin extension. So, to get you started,

1. Install ezwebin.  
You can install the extension into your current installation, or simply choose the "Website Interface" package when doing a fresh install.  
We are working on ways to ease the installation, in the meantime please bear with us!

2. Install eZ Less  
Simply follow the instructions at http://www.ezless.org. You can skip editing the templates, that has already been done for you.  
HWBoot depends on the eZ Less extension to render the bootstrap css through [LESS] (http://www.lesscss.org).

3. Clone this repository into your extension directory

4. Edit your settings/siteaccess/YOUR\_SITEACCESS/site.ini.append.php  
    [ExtensionSettings]  
    ActiveAccessExtensions[]=hwboot  
    [DesignSettings]
    SiteDesign=hwboot
    AdditionalSiteDesignList[]
    AdditionalSiteDesignList[]=ezwebin
    AdditionalSiteDesignList[]=base

5. And put the following in settings/siteaccess/YOUR\_SITEACCESS/image.ini.append.php  
    [ImageMagick]
    Filters[]=geometry/fill=-resize %1x%2^ -gravity center -extent %1x%2
    [listitem]
    Reference=
    Filters[]
    Filters[]=geometry/fill=140;100

6. Kick back, clear the cache and enjoy! (:

What is it exactly?
----------------------------------------------------------
HWBoot overrides the default ezwebin\_site package to provide you with a [bootstrap] (http://twitter.github.com/bootstrap) enabled frontend.
We currently use version 2.0 and compile our CSS via Less.

### Configuration
Using the power of [LESS] (http://www.lesscss.org), you can overwrite many things such as colours, column widths and font sizes.  
--> see design/hwboot/stylesheets/less/variables.less and design/hwboot/stylesheets/less/hwboot.less.

You may want to overwrite these files in your own extension to preserve the upgrade path.  
Additionally, we provide a few configuration options in  
--> settings/hwboot.ini

### Feedback and Feature Requests
We're happy to receive your feedback at technik[at]holzweg.com

Please feel to contribute by contacting us or simply sending us a pull request.

### Brought to you by Holzweg e-commerce Solutions, with love. ###
Note: No pixels were harmed during the development of this extension.
