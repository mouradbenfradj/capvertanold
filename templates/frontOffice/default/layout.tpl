<!doctype html>

{* Declare assets directory, relative to template base directory *}
{declare_assets directory='assets/src'}
{* Set the default translation domain, that will be used by {intl} when the 'd' parameter is not set *}
{default_translation_domain domain='fo.default'}

{* -- Define some stuff for Smarty ------------------------------------------ *}
{config_load file='variables.conf'}
{block name="init"}{/block}
{block name="no-return-functions"}{/block}
{assign var="store_name" value={config key="store_name"}}
{assign var="store_description" value={config key="store_description"}}
{assign var="lang_code" value={lang attr="code"}}
{assign var="lang_locale" value={lang attr="locale"}}
{if not $store_name}{assign var="store_name" value={intl l='Thelia V2'}}{/if}
{if not $store_description}{assign var="store_description" value={$store_name}}{/if}

{* paulirish.com/2008/conditional-stylesheets-vs-css-hacks-answer-neither *}
<!--[if lt IE 7 ]><html class="no-js oldie ie6" lang="{$lang_code}"> <![endif]-->
<!--[if IE 7 ]><html class="no-js oldie ie7" lang="{$lang_code}"> <![endif]-->
<!--[if IE 8 ]><html class="no-js oldie ie8" lang="{$lang_code}"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="{$lang_code}" class="no-js"> <!--<![endif]-->
<head>
    {hook name="main.head-top"}
    {* Test if javascript is enabled *}
    <script>(function(H) { H.className=H.className.replace(/\bno-js\b/,'js') } )(document.documentElement);</script>

    <meta charset="UTF-8">
    <!-- The above 4 meta tags *must* come first in the head; any other head content must come *after* these tags -->

    {* Page Title *}
    <title>{block name="page-title"}{strip}{if $page_title}{$page_title}{elseif $breadcrumbs}{foreach from=$breadcrumbs|array_reverse item=breadcrumb}{$breadcrumb.title|unescape} - {/foreach}{$store_name}{else}{$store_name}{/if}{/strip}{/block}</title>

    {* Meta Tags *}
    <meta name="generator" content="{intl l='Thelia V2'}">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width,initial-scale=1.0", shrink-to-fit=no">
    {block name="meta"}
        <meta name="description" content="{if $page_description}{$page_description}{else}{$store_description|strip|truncate:120}{/if}">
    {/block}

    {stylesheets file='assets/src/style.css'}
        <link rel="stylesheet" href="{$asset_url}">
    {/stylesheets}

    {hook name="main.stylesheet"}

    {block name="stylesheet"}{/block}

    {* Favicon *}
    {* PNG file favicons are not supported by IE 10 and lower. In this case, we use the default .ico file in the template. *}

    <!--[if lt IE 11]>
    <link rel="shortcut icon" type="image/x-icon" href="{image file='assets/src/img/core-img/favicon.ico'}"/>
    <![endif]-->

    {local_media type="favicon" width=32 height=32}
    <link rel="icon" type="{$MEDIA_MIME_TYPE}" href="{$MEDIA_URL}" />
    {/local_media}

    {* Feeds *}
    <link rel="alternate" type="application/rss+xml" title="{intl l='All products'}" href="{url path="/feed/catalog/%lang" lang=$lang_locale}" />
    <link rel="alternate" type="application/rss+xml" title="{intl l='All contents'}" href="{url path="/feed/content/%lang" lang=$lang_locale}" />
    <link rel="alternate" type="application/rss+xml" title="{intl l='All brands'}"   href="{url path="/feed/brand/%lang" lang=$lang_locale}" />
    {block name="feeds"}{/block}

    {* HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries *}
    <!--[if lt IE 9]>
    <script src="//cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    {javascripts file="assets/dist/js/vendors/html5shiv.min.js"}
        <script>window.html5 || document.write('<script src="{$asset_url}"><\/script>');</script>
    {/javascripts}

    <script src="//cdnjs.cloudflare.com/ajax/libs/respond.js/1.4.2/respond.js"></script>
    {javascripts file="assets/dist/js/vendors/respond.min.js"}
        <script>window.respond || document.write('<script src="{$asset_url}"><\/script>');</script>
    {/javascripts}
    <![endif]-->

    {hook name="main.head-bottom"}
</head>

<body class="{block name="body-class"}{/block}" itemscope itemtype="http://schema.org/WebPage">

    <!-- Accessibility -->
    <a class="sr-only" href="#content">{intl l="Skip to content"}</a>

    <!-- Preloader -->
    <div class="preloader d-flex align-items-center justify-content-center">
        <div class="preloader-circle"></div>
        <div class="preloader-img">
            <img src="{image file='assets/src/img/core-img/leaf.png'}" alt="">
        </div>
    </div>

    <!-- ##### Header Area Start ##### -->
    <header class="header-area">
        {hook name="main.header-top"}
        <!-- ***** Top Header Area ***** -->
        <div class="top-header-area">
            <div class="container">
                <div class="row">
                    <div class="col-12">
                        <div class="top-header-content d-flex align-items-center justify-content-between">
                            <!-- Top Header Content -->
                            <div class="top-header-meta">
                                <a href="#" data-toggle="tooltip" data-placement="bottom" title=""><i class="fa fa-envelope-o" aria-hidden="true"></i> <span>Email: </span></a>
                                <a href="tel:{config key="store_phone"}" data-toggle="tooltip" data-placement="bottom" title="{config key="store_phone"}"><i class="fa fa-phone" aria-hidden="true"></i> <span> {config key="store_phone"}</span></a>
                            </div>

                            <!-- Top Header Content -->
                            <div class="top-header-meta d-flex">
                                <!-- Language Dropdown -->
                                {hook name="main.header-top"}
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        {ifhook rel="main.navbar-secondary"}
            {* Place everything within .nav-collapse to hide it until above 768px *}
            <nav class="navbar-collapse collapse nav-secondary" role="navigation"
                 aria-label="{intl l="Secondary Navigation"}">
                {hook name="main.navbar-secondary"}
            </nav>
        {/ifhook}
        <div class="alazea-main-menu">
            <div class="classy-nav-container breakpoint-off">
                <div class="container">
                    <!-- Menu -->
                    {hook name="main.navbar-primary"}
                    <!-- ***** Navbar Area ***** -->
                </div>


            </div>
        </div>
        {hook name="main.header-bottom"}
    </header>

<!-- logo
<a href="{navigate to="index"}" title="{$store_name}">
    {local_media type="logo"}
        <img src="{$MEDIA_URL}" alt="{$store_name}">
    {/local_media}
</a>
<!-- ##### Hero Area Start ##### -->
<section class="hero-area">
    <div class="hero-post-slides owl-carousel">

        <!-- Single Hero Post -->
        <div class="single-hero-post bg-overlay">
            <!-- Post Image -->
            <div class="slide-img bg-img"
                 style="background-image: url({image file='assets/src/img/bg-img/1.jpg'});"></div>
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <!-- Post Content -->
                        <div class="hero-slides-content text-center">
                            <h2></h2>
                            <p></p>
                            <div class="welcome-btn-group">
                                <!--<a href="#" class="btn alazea-btn mr-30">GET STARTED</a>-->
                                <a href="{url path='/contact'}"
                                   class="btn alazea-btn active">{intl l="Find us, Contact us" d="hookcontact.fo.default"}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Single Hero Post -->
        <div class="single-hero-post bg-overlay">
            <!-- Post Image -->
            <div class="slide-img bg-img"
                 style="background-image: url({image file='assets/src/img/bg-img/2.jpg'});"></div>
            <div class="container h-100">
                <div class="row h-100 align-items-center">
                    <div class="col-12">
                        <!-- Post Content -->
                        <div class="hero-slides-content text-center">
                            <h2></h2>
                            <p></p>
                            <div class="welcome-btn-group">
                                <!--<a href="#" class="btn alazea-btn mr-30">GET STARTED</a>-->
                                <a href="{url path='/contact'}"
                                   class="btn alazea-btn active">{intl l="Find us, Contact us" d="hookcontact.fo.default"}</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</section>
<!-- ##### Hero Area End ##### -->


{hook name="main.content-top"}
{block name="breadcrumb"}{include file="misc/breadcrumb.tpl"}{/block}
{block name="main-content"}{/block}
{hook name="main.content-bottom"}
<!-- ##### Footer Area Start ##### -->
<footer class="footer-area bg-img" style="background-image: url({image file='assets/src/img/bg-img/3.jpg'});" itemscope
        itemtype="http://schema.org/WPFooter">
    <div class="main-footer-area">
        <div class="container">
            <div class="row">
                <!-- Main Footer Area -->
                {ifhook rel="main.footer-top"}
                {hook name="main.footer-top"}
                {/ifhook}
                {elsehook rel="main.footer-top"}
                {/elsehook}

                {ifhook rel="main.footer-body"}

                {hookblock name="main.footer-body"  fields="id,class,title,content"}
                {forhook rel="main.footer-body"}
                    <!-- Single Footer Widget -->
                    <div class="col-12 col-sm-6 col-lg-3">
                        <div class="single-footer-widget">
                            <div class="widget-title">
                                <h5>   {$title}</h5>
                            </div>
                            {$content nofilter}
                        </div>
                    </div>
                {/forhook}
                {/hookblock}

                {/ifhook}

                {ifhook rel="main.footer-bottom"}
                {hook name="main.footer-bottom"}

                {/ifhook}
                {elsehook rel="main.footer-bottom"}
                {/elsehook}
            </div>
        </div>
    </div>

    <!-- Footer Bottom Area -->
    <div class="footer-bottom-area">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="border-line"></div>
                </div>
                <!-- Copywrite Text -->
                <div class="col-12 col-md-6">
                    <div class="copywrite-text">
                        <p>&copy; <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            Copyright &copy;<script>document.write(new Date().getFullYear());</script>
                            All rights reserved | This template is made with <i class="fa fa-heart-o"
                                                                                aria-hidden="true"></i> by <a
                                    href="https://colorlib.com" target="_blank">Colorlib</a>
                            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                        </p>
                    </div>
                </div>
                <!-- Footer Nav -->
                <div class="col-12 col-md-6">
                    <div class="footer-nav">
                        <nav>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">About</a></li>
                                <li><a href="#">Service</a></li>
                                <li><a href="#">Portfolio</a></li>
                                <li><a href="#">Blog</a></li>
                                <li>
                                    <a href="{url path='/contact'}">{intl l="Find us, Contact us" d="hookcontact.fo.default"}</a>
                                </li>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
{block name="before-javascript-include"}{/block}

{hook name="main.after-javascript-include"}

{block name="after-javascript-include"}{/block}

{hook name="main.javascript-initialization"}
{block name="javascript-initialization"}{/block}

<script src="{javascript file='assets/src/js/jquery/jquery-2.2.4.min.js'}"></script>
<script src="{javascript file='assets/src/js/bootstrap/popper.min.js'}"></script>
<script src="{javascript file='assets/src/js/bootstrap/bootstrap.min.js'}"></script>
<script src="{javascript file='assets/src/js/plugins/plugins.js'}"></script>
<script src="{javascript file='assets/src/js/active.js'}"></script>
{hook name="main.body-bottom"}
</body>

</html>