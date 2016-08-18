jQuery(document).ready((function ($) {
    if (getCookie("themeStyle") == "") {
        if (default_theme == "default") {
            var h = new Date().getHours();
            if (h >= 7 && h <= 20) {
                setCookie("themeStyle", "light");
            } else {
                setCookie("themeStyle", "dark");
            }
        } else if (default_theme == "dark") {
            setCookie("themeStyle", "dark");
        } else {
            setCookie("themeStyle", "light");
        }
    }
    changeTheme(getCookie("themeStyle"));
}));

function setCookie(c_name, value, expiredays) {
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + expiredays);
    document.cookie = c_name + "=" + escape(value) +
        ((expiredays == null) ? "" : ";expires=" + exdate.toGMTString()) + ";path=/";
}
function getCookie(c_name) {
    if (document.cookie.length > 0) {
        c_start = document.cookie.indexOf(c_name + "=");
        if (c_start != -1) {
            c_start = c_start + c_name.length + 1;
            c_end = document.cookie.indexOf(";", c_start);
            if (c_end == -1) c_end = document.cookie.length;
            return unescape(document.cookie.substring(c_start, c_end));
        }
    }
    return "";
}

function loadCss(href) {
    if ($("#defaultStyle").length < 1) {
        var style = document.createElement('link');
        style.rel = 'stylesheet';
        style.type = 'text/css';
        style.id = 'defaultStyle';
        style.href = href;
        document.getElementsByTagName('HEAD').item(0).appendChild(style);
    } else {
        $("#defaultStyle").attr("href", href);
    }
}

function changeTheme(theme) {
    if (theme == "light") {
        $("#style-changer #light").css('display', 'none');
        $("#style-changer #dark").css('display', 'inline-block');
        loadCss(light_theme);
        setCookie("themeStyle", "light");
    } else {
        $("#style-changer #light").css('display', 'inline-block');
        $("#style-changer #dark").css('display', 'none');
        loadCss(dark_theme);
        setCookie("themeStyle", "dark");
    }
}
