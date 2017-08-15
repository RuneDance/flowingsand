!function (a) {
    "use strict";
    function e() {
        this.wrapper = document.querySelector(".wrapper"),
            this.toggle = document.querySelector("#mm-menu-toggle"),
            this.menu = document.querySelector("#mm-menu"),
            this.menuItems = this.menu.querySelectorAll("li"),
            this.menuPosition = "off",
            this.mask = document.createElement("div"),
            this._init();
    }

    e.prototype._init = function () {
        this._initToggleEvents(),
            this._initItemTransitions();
    },
        e.prototype._initToggleEvents = function () {
            var a = this;
            this.toggle.addEventListener("click",
                function () {
                    "off" == a.menuPosition ? a._toggleMenuOn() : a._toggleMenuOff();
                });
        },
        //===============����򿪴���������=======================
        e.prototype._toggleMenuOn = function () {
            var a = this;
            this.toggle.classList.add("active"),
                this.menu.classList.add("active");
            for (var b = 0; b < a.menuItems.length; b++) {
                var c = a.menuItems[b];
                !
                    function (a) {
                        a.classList.add("in-view");
                    }(c);
            }
            this.mask.classList.add("active"),
                this.menuPosition = "on";
        },
        //===============����رմ���������=======================
        e.prototype._toggleMenuOff = function () {
            var a = this;
            this.toggle.classList.remove("active"),
                this.menu.classList.remove("active");
            for (var b = 0; b < a.menuItems.length; b++) {
                var c = a.menuItems[b];
                !
                    function (a) {
                        a.classList.remove("in-view");
                    }(c);
            }
            this.mask.classList.remove("active"),
                this.menuPosition = "off";
        },
        e.prototype._initItemTransitions = function () {
            for (var a = this.menuItems.length,
                     b = 0; a > b; b++) {
                var c = b + 1,
                    d = this.menuItems[b];
                this._itemTransitionHandler(d, c);
            }
        },
        e.prototype._itemTransitionHandler = function (a, b) {
            a.classList.add("item-" + b);
        },
        a.Menu = e;
}(window);