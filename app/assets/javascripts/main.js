function changeValueCountdown(e, t, n) {
    $("#wrapper #container div.countdown div." + e + " ." + t + " .layer").html(n)
}

function secondPlayRight(e) {
    if (e == 0) {
        number = 9
    } else {
        number = e - 1
    }
    $("body").removeClass("play");
    var t = $("ul.secondRight li.active");
    if (t.html() == undefined) {
        t = $("ul.secondRight li").eq(0);
        t.addClass("before").removeClass("active").next("li").addClass("active").closest("body").addClass("play");
        $("ul.secondRight li:last-child .inn").html(e);
        $("ul.secondRight li:last-child").after('<li><a href="#"><div class="up"><div class="shadow"></div><div class="inn">' + number + '</div></div><div class="down"><div class="shadow"></div><div class="inn">' + number + "</div></div></a></li>")
    } else {
        $("ul.secondRight li").removeClass("before");
        t.addClass("before").removeClass("active").next("li").addClass("active").closest("body").addClass("play");
        $("ul.secondRight li:last-child").after('<li><a href="#"><div class="up"><div class="shadow"></div><div class="inn">' + number + '</div></div><div class="down"><div class="shadow"></div><div class="inn">' + number + "</div></div></a></li>");
        $("ul.secondRight li:first-child").remove()
    }
}

function secondLeft(e) {
    $("body").removeClass("play");
    var t = $("ul.secondLeft li.active");
    if (e - 1 == -1) {
        numberMinChange = 5
    } else {
        numberMinChange = e - 1
    } if (t.html() == undefined) {
        t = $("ul.secondLeft li").eq(0);
        t.addClass("before").removeClass("active").next("li").addClass("active").closest("body").addClass("play");
        $("ul.secondLeft li:last-child .inn").html(e);
        $("ul.secondLeft li:last-child").after('<li><a href="#"><div class="up"><div class="shadow"></div><div class="inn">' + numberMinChange + '</div></div><div class="down"><div class="shadow"></div><div class="inn">' + numberMinChange + "</div></div></a></li>")
    } else {
        $("ul.secondLeft li").removeClass("before");
        t.addClass("before").removeClass("active").next("li").addClass("active").closest("body").addClass("play");
        $("ul.secondLeft li:last-child").after('<li><a href="#"><div class="up"><div class="shadow"></div><div class="inn">' + numberMinChange + '</div></div><div class="down"><div class="shadow"></div><div class="inn">' + numberMinChange + "</div></div></a></li>");
        $("ul.secondLeft li:first-child").remove()
    }
}

function countdownAnimation(e, t, n, r) {
    $("body").removeClass("play");
    var i = $("ul." + t + " li.active");
    if (n == "right" && r == "minute" || n == "right" && r == "hours" || n == "right" && r == "days" || n == "left" && r == "days" || n == "center" && r == "days") {
        if (e == 0) {
            numberDefaultChange = 9
        } else {
            numberDefaultChange = e - 1
        }
    }
    if (n == "left" && r == "minute") {
        if (e == 0) {
            numberDefaultChange = 5
        } else {
            numberDefaultChange = e - 1
        }
    }
    if (n == "left" && r == "hours") {
        if (e == 0) {
            numberDefaultChange = 2
        } else {
            numberDefaultChange = e - 1
        }
    }
    if (i.html() == undefined) {
        i = $("ul." + t + " li").eq(0);
        i.addClass("before").removeClass("active").next("li").addClass("active").closest("body").addClass("play");
        $("ul." + t + " li:last-child .inn").html(e);
        $("ul." + t + " li:last-child").after('<li><a href="#"><div class="up"><div class="shadow"></div><div class="inn">' + numberDefaultChange + '</div></div><div class="down"><div class="shadow"></div><div class="inn">' + numberDefaultChange + '</div></div><div class="circleUp"></div><div class="circleDown"></div></a></li>')
    } else {
        $("ul." + t + " li").removeClass("before");
        i.addClass("before").removeClass("active").next("li").addClass("active").closest("body").addClass("play");
        $("ul." + t + " li:last-child").after('<li><a href="#"><div class="up"><div class="shadow"></div><div class="inn">' + numberDefaultChange + '</div></div><div class="down"><div class="shadow"></div><div class="inn">' + numberDefaultChange + '</div></div><div class="circleUp"></div><div class="circleDown"></div></a></li>');
        $("ul." + t + " li:first-child").remove()
    }
}

function countdown() {
    countdownActive = 1;
    var e = Date.parse(date);
    var t = new Date;
    var n = e - t;
    if (n < 0) {
        clearInterval(timer);
        changeValueCountdown("timerDigitsDays", "digitsLeft", "0");
        changeValueCountdown("timerDigitsDays", "digitsCenter", "0");
        changeValueCountdown("timerDigitsDays", "digitsRight", "0");
        changeValueCountdown("timerDigitsHours", "digitsLeft", "0");
        changeValueCountdown("timerDigitsHours", "digitsRight", "0");
        changeValueCountdown("timerDigitsMinutes", "digitsLeft", "0");
        changeValueCountdown("timerDigitsMinutes", "digitsRight", "0");
        changeValueCountdown("timerDigitsSeconds", "digitsLeft", "0");
        changeValueCountdown("timerDigitsSeconds", "digitsRight", "0");
        return
    } else {
        var r = Math.floor(n / _day);
        var i = Math.floor(n % _day / _hour);
        var s = Math.floor(n % _hour / _minute);
        var o = Math.floor(n % _minute / _second);
        if (r < 10) {
            if (first == 0) {
                $("ul.daysRight li:first-child .inn").html(r);
                $("ul.daysRight li:last-child .inn").html(r - 1);
                $("ul.daysCenter li:first-child .inn").html(0);
                $("ul.daysCenter li:last-child .inn").html(0);
                $("ul.daysLeft li:first-child .inn").html(0);
                $("ul.daysLeft li:last-child .inn").html(0);
                daysRight = r;
                daysLeft = 0;
                daysCenter = 0
            }
            if (daysRight != r) {
                daysRight = r;
                countdownAnimation(r, "daysRight", "right", "days")
            }
        } else if (r > 9 && r < 100) {
            var u = r,
                a = [],
                f = u.toString();
            for (var l = 0, c = f.length; l < c; l += 1) {
                a.push(+f.charAt(l))
            }
            daysBool = 0;
            if (first == 0) {
                $("ul.daysLeft li:first-child .inn").html(0);
                $("ul.daysLeft li:last-child .inn").html(0);
                $("ul.daysRight li:first-child .inn").html(f.charAt(1));
                $("ul.daysRight li:last-child .inn").html(f.charAt(1) - 1);
                $("ul.daysCenter li:first-child .inn").html(f.charAt(0));
                $("ul.daysCenter li:last-child .inn").html(f.charAt(0) - 1);
                daysRight = f.charAt(1);
                daysCenter = f.charAt(0)
            }
            if (daysRight != f.charAt(1)) {
                daysRight = f.charAt(1);
                countdownAnimation(f.charAt(1), "daysRight", "right", "days")
            }
            if (daysCenter != f.charAt(0)) {
                daysCenter = f.charAt(0);
                countdownAnimation(f.charAt(0), "daysCenter", "center", "days")
            }
        } else {
            var u = r,
                a = [],
                f = u.toString();
            for (var l = 0, c = f.length; l < c; l += 1) {
                a.push(+f.charAt(l))
            }
            daysBool = 0;
            if (first == 0) {
                $("ul.daysLeft li:first-child .inn").html(f.charAt(0));
                $("ul.daysLeft li:last-child .inn").html(f.charAt(0) - 1);
                $("ul.daysRight li:first-child .inn").html(f.charAt(2));
                $("ul.daysRight li:last-child .inn").html(f.charAt(2) - 1);
                $("ul.daysCenter li:first-child .inn").html(f.charAt(1));
                $("ul.daysCenter li:last-child .inn").html(f.charAt(1) - 1);
                daysRight = f.charAt(2);
                daysCenter = f.charAt(1);
                daysLeft = f.charAt(0)
            }
            if (daysRight != f.charAt(2)) {
                daysRight = f.charAt(2);
                countdownAnimation(f.charAt(2), "daysRight", "right", "days")
            }
            if (daysCenter != f.charAt(1)) {
                daysCenter = f.charAt(1);
                countdownAnimation(f.charAt(1), "daysCenter", "center", "days")
            }
            if (daysLeft != f.charAt(0)) {
                daysLeft = f.charAt(0);
                countdownAnimation(f.charAt(0), "daysLeft", "left", "days")
            }
        } if (i < 10) {
            if (first == 0) {
                $("ul.hoursRight li:first-child .inn").html(i);
                $("ul.hoursRight li:last-child .inn").html(i - 1);
                $("ul.hoursLeft li:first-child .inn").html(0);
                $("ul.hoursLeft li:last-child .inn").html(2);
                hoursRight = i;
                hoursLeft = 0
            }
            if (i == 9 && hoursBool == 0) {
                hoursBool = 1;
                hoursLeft = 0;
                countdownAnimation(hoursLeft, "hoursLeft", "left", "hours")
            }
            if (hoursRight != i) {
                minutesRight = i;
                countdownAnimation(i, "hoursRight", "right", "hour")
            }
        } else {
            hoursBool = 0;
            var u = i,
                a = [],
                f = u.toString();
            for (var l = 0, c = f.length; l < c; l += 1) {
                a.push(+f.charAt(l))
            }
            if (first == 0) {
                $("ul.hoursRight li:first-child .inn").html(f.charAt(1));
                $("ul.hoursRight li:last-child .inn").html(f.charAt(1) - 1);
                $("ul.hoursLeft li:first-child .inn").html(f.charAt(0));
                $("ul.hoursLeft li:last-child .inn").html(f.charAt(0) - 1);
                hoursRight = f.charAt(1);
                hoursLeft = f.charAt(0)
            }
            if (hoursRight != f.charAt(1)) {
                hoursRight = f.charAt(1);
                countdownAnimation(f.charAt(1), "hoursRight", "right", "hours")
            }
            if (hoursLeft != f.charAt(0)) {
                hoursLeft = f.charAt(0);
                countdownAnimation(f.charAt(0), "hoursLeft", "left", "hours")
            }
        } if (s < 10) {
            if (first == 0) {
                $("ul.minuteRight li:first-child .inn").html(s);
                $("ul.minuteRight li:last-child .inn").html(s - 1);
                $("ul.minuteLeft li:first-child .inn").html(0);
                $("ul.minuteLeft li:last-child .inn").html(5);
                minutesRight = s;
                minutesLeft = 0
            }
            if (s == 9 && minutesBool == 0) {
                minutesBool = 1;
                minutesLeft = 0;
                countdownAnimation(minutesLeft, "minuteLeft", "left", "minute")
            }
            if (minutesRight != s) {
                minutesRight = s;
                countdownAnimation(s, "minuteRight", "right", "minute")
            }
        } else {
            minutesBool = 0;
            var u = s,
                a = [],
                f = u.toString();
            for (var l = 0, c = f.length; l < c; l += 1) {
                a.push(+f.charAt(l))
            }
            if (first == 0) {
                $("ul.minuteRight li:first-child .inn").html(f.charAt(1));
                $("ul.minuteRight li:last-child .inn").html(f.charAt(1) - 1);
                $("ul.minuteLeft li:first-child .inn").html(f.charAt(0));
                $("ul.minuteLeft li:last-child .inn").html(f.charAt(0) - 1);
                minutesRight = f.charAt(1);
                minutesLeft = f.charAt(0)
            }
            if (minutesRight != f.charAt(1)) {
                minutesRight = f.charAt(1);
                countdownAnimation(f.charAt(1), "minuteRight", "right", "minute")
            }
            if (minutesLeft != f.charAt(0)) {
                minutesLeft = f.charAt(0);
                countdownAnimation(f.charAt(0), "minuteLeft", "left", "minute")
            }
        } if (o < 10) {
            if (o == 9) {
                secondsLeft = 0;
                secondLeft(secondsLeft)
            }
            secondPlayRight(o)
        } else {
            var u = o,
                a = [],
                f = u.toString();
            for (var l = 0, c = f.length; l < c; l += 1) {
                a.push(+f.charAt(l))
            }
            if (f.charAt(1) == 9) {
                secondLeft(f.charAt(0))
            }
            if (first == 0) {
                $("ul.secondLeft li:first-child .inn").html(f.charAt(0))
            }
            $("ul.secondLeft li:last-child .inn").html(f.charAt(0) - 1);
            secondPlayRight(f.charAt(1))
        }
        first++;
        countdownActive = 0
    }
}

function validateEmail(e) {
    var t = "";
    if (e == "" || e.indexOf("@") == -1 || e.indexOf(".") == -1 || e == "friend e-mail") {
        return false
    }
    return true
}

function writeNotification(e) {
    $("#wrapper #container .subscribeAndSocial .newsletter #notifications").html(e).fadeIn().delay(2e3).fadeOut()
}

function sendEmail() {
    var e = $("input[name=email]", "#form").val();
    if (validateEmail(e) == true) {
        var t = "";
        t = $("#form").serialize();
        $.ajax({
            type: "post",
            url: "send_mail.php",
            data: t,
            success: function (e) {
                if (parseInt(e)) {
                    writeNotification(notificationSuccess)
                } else {
                    writeNotification(notificationError)
                }
                $("#form")[0].reset()
            }
        })
    } else {
        writeNotification(notificationInvalidEmail)
    }
}

function changeMargin() {
    if ($("body").width() <= 740) {
        var e = $(".countdown").width();
        var t = $(".timerDigitsDays").width();
        var n = $(".timerDigitsHours").width();
        var r = (e - t) / 2;
        var i = (e - n) / 2;
        $(".timerDigitsDays").css("margin-left", r + "px");
        $(".timerDigitsMinutes").css("margin-left", i + "px");
        $(".timerDigitsHours").css("margin-left", i + "px");
        $(".timerDigitsSeconds").css("margin-left", i + "px")
    } else if ($("body").width() <= 1e3) {
        var e = $(".countdown").width();
        var t = $(".timerDigitsDays").width();
        var n = $(".timerDigitsHours").width();
        var r = (e - (t + n)) / 2;
        var i = (e - n * 2) / 2;
        $(".timerDigitsDays").css("margin-left", r + "px");
        $(".timerDigitsMinutes").css("margin-left", i + "px");
        $(".timerDigitsHours").css("margin-left", "0px");
        $(".timerDigitsSeconds").css("margin-left", "0px")
    } else if ($("body").width() > 1e3) {
        $(".timerDigitsDays").css("margin-left", "-1px");
        $(".timerDigitsMinutes").css("margin-left", "0px");
        $(".timerDigitsHours").css("margin-left", "0px");
        $(".timerDigitsSeconds").css("margin-left", "0px")
    }
}

function removeOrAddLinkSocialNetwork(e, t) {
    if (t != "") {
        $("#wrapper #container .subscribeAndSocial .socialNetwork ul.social li." + e + " a").attr("href", t)
    } else {
        $("#wrapper #container .subscribeAndSocial .socialNetwork ul.social li." + e).remove()
    }
}
var _second = 1e3;
var _minute = _second * 60;
var _hour = _minute * 60;
var _day = _hour * 24;
var timer;
var date;
var notificationSuccess;
var notificationError;
var notificationInvalidEmail;
numberSecondLeft = 0;
var first = 0;
var minutesRight = 0;
var minutesLeft = 0;
var minutesBool = 0;
var hoursRight = 0;
var hoursLeft = 0;
var hoursBool = 0;
var daysRight = 0;
var daysLeft = 0;
var daysCenter = 0;
var daysBool = 0;
var email = "";
$(function () {
    window.onload = function () {
        $.getJSON("container.json", function (e) {
            $("body").css({
                background: "url(" + e.container.background + ")",
                "background-repeat": "no-repeat",
                "background-size": "cover"
            });
            $("header").css("background", "url(" + e.container.backgroundHeader + ")")
        })
    };
    if (first == 0) {
        changeMargin()
    }
    $(window).resize(function () {
        changeMargin()
    });
    if (first == 0) {
        $.getJSON("container.json", function (e) {
            date = e.container.date;
            notificationSuccess = e.container.notificationSuccess;
            notificationError = e.container.notificationError;
            notificationInvalidEmail = e.container.notificationInvalidEmail;
            $("#wrapper #container .title").html(e.container.title);
            $("#wrapper #container .subtitle").html(e.container.subTitle);
            $("#wrapper #container .spanSubtitle").html(e.container.subTitleSpan);
            $("#wrapper #container div.countdown .timerDigitsDays .caption").html(e.container.days);
            $("#wrapper #container div.countdown .timerDigitsHours .caption").html(e.container.hours);
            $("#wrapper #container div.countdown .timerDigitsMinutes .caption").html(e.container.minutes);
            $("#wrapper #container div.countdown .timerDigitsSeconds .caption").html(e.container.seconds);
            $("#wrapper #container .subscribeAndSocial .newsletter .title").html(e.container.newsletterTitle);
            $("#wrapper #container .subscribeAndSocial .socialNetwork .title").html(e.container.socialNetworksTitle);
            $('#wrapper #container .subscribeAndSocial .newsletter form input[type="text"]').attr("placeholder", e.container.formPlaceholder);
            $('#wrapper #container .subscribeAndSocial .newsletter form input[type="submit"]').attr("value", e.container.formButton);
            $('#wrapper #container .subscribeAndSocial .newsletter form input[type="hidden"]').attr("value", e.email);
            $(".copyright").html(e.container.footer + "<span>" + e.container.footerSpan + "</span>");
            $("meta[name=keywords]").attr("content", e.container.keywords);
            $("meta[name=description]").attr("content", e.container.description);
            $("meta[name=author]").attr("content", e.container.author);
            $("link[rel=canonical]").attr("content", e.container.url);
            removeOrAddLinkSocialNetwork("facebook", e.container.linkFacebook);
            removeOrAddLinkSocialNetwork("twitter", e.container.linkTwitter);
            removeOrAddLinkSocialNetwork("gplus", e.container.linkGplus);
            removeOrAddLinkSocialNetwork("dribble", e.container.linkDribble);
            removeOrAddLinkSocialNetwork("flickr", e.container.linkYoutubePlay)
        })
    }
    timer = setInterval(countdown, 1e3);
    $('#wrapper #container .subscribeAndSocial .newsletter form input[type="submit"]').click(function () {
        sendEmail();
        return false
    });
    if (!Modernizr.touch) {
        $("#wrapper #container .subscribeAndSocial .newsletter form input[type='submit']").hover(function () {
            $(this).addClass("hoverSubmit")
        }, function () {
            $(this).removeClass("hoverSubmit")
        });
        $("#wrapper #container .subscribeAndSocial .socialNetwork ul.social li").hover(function () {
            $(this).addClass("hoverSocialNetwork")
        }, function () {
            $(this).removeClass("hoverSocialNetwork")
        })
    }
    if (navigator.userAgent.indexOf("MSIE") > 0) {
        var e = document.createElement("input");
        if ("placeholder" in e == false) {
            $("[placeholder]").focus(function () {
                var e = $(this);
                if (e.val() == e.attr("placeholder")) {
                    e.val("").removeClass("placeholder");
                    if (e.hasClass("password")) {
                        e.removeClass("password");
                        this.type = "password"
                    }
                }
            }).blur(function () {
                var e = $(this);
                if (e.val() == "" || e.val() == e.attr("placeholder")) {
                    if (this.type == "password") {
                        e.addClass("password");
                        this.type = "text"
                    }
                    e.addClass("placeholder").val(e.attr("placeholder"))
                }
            }).blur().parents("form").submit(function () {
                $(this).find("[placeholder]").each(function () {
                    var e = $(this);
                    if (e.val() == e.attr("placeholder")) e.val("")
                })
            })
        }
    }
})