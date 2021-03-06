(function(n, h) {
    var k = {};
    k.encode = function(u) {
        var D = u.replace(/[\u0080-\u07ff]/g, function(E) {
            var F = E.charCodeAt(0);
            return String.fromCharCode(192 | F >> 6, 128 | F & 63)
        });
        D = D.replace(/[\u0800-\uffff]/g, function(F) {
            var E = F.charCodeAt(0);
            return String.fromCharCode(224 | E >> 12, 128 | E >> 6 & 63, 128 | E & 63)
        });
        return D
    };
    k.ROTL = function(D, u) {
        return (D << u) | (D >>> (32 - u))
    };
    k.toHexStr = function(u) {
        var E = "",
            F;
        for (var D = 7; D >= 0; D--) {
            F = (u >>> (D * 4)) & 15;
            E += F.toString(16)
        }
        return E
    };
    k.f = function(D, E, F, u) {
        switch (D) {
            case 0:
                return (E & F) ^ (~E & u);
            case 1:
                return E ^ F ^ u;
            case 2:
                return (E & F) ^ (E & u) ^ (F & u);
            case 3:
                return E ^ F ^ u
        }
    };
    k.hash = function(T, Z) {
        Z = (typeof Z == "undefined") ? true : Z;
        if (Z) {
            T = k.encode(T)
        }
        var ak = [1518500249, 1859775393, 2400959708, 3395469782];
        T += String.fromCharCode(128);
        var af = T.length / 4 + 2;
        var ah = Math.ceil(af / 16);
        var ae = new Array(ah);
        for (var ai = 0; ai < ah; ai++) {
            ae[ai] = new Array(16);
            for (var u = 0; u < 16; u++) {
                ae[ai][u] = (T.charCodeAt(ai * 64 + u * 4) << 24) | (T.charCodeAt(ai * 64 + u * 4 + 1) << 16) | (T.charCodeAt(ai * 64 + u * 4 + 2) << 8) | (T.charCodeAt(ai * 64 + u * 4 + 3))
            }
        }
        ae[ah - 1][14] = ((T.length - 1) * 8) / Math.pow(2, 32);
        ae[ah - 1][14] = Math.floor(ae[ah - 1][14]);
        ae[ah - 1][15] = ((T.length - 1) * 8) & 4294967295;
        var ad = 1732584193;
        var ac = 4023233417;
        var W = 2562383102;
        var am = 271733878;
        var Y = 3285377520;
        var al = new Array(80);
        var U, S, ab, X, V;
        for (var ai = 0; ai < ah; ai++) {
            for (var ag = 0; ag < 16; ag++) {
                al[ag] = ae[ai][ag]
            }
            for (var ag = 16; ag < 80; ag++) {
                al[ag] = k.ROTL(al[ag - 3] ^ al[ag - 8] ^ al[ag - 14] ^ al[ag - 16], 1)
            }
            U = ad;
            S = ac;
            ab = W;
            X = am;
            V = Y;
            for (var ag = 0; ag < 80; ag++) {
                var aa = Math.floor(ag / 20);
                var aj = (k.ROTL(U, 5) + k.f(aa, S, ab, X) + V + ak[aa] + al[ag]) & 4294967295;
                V = X;
                X = ab;
                ab = k.ROTL(S, 30);
                S = U;
                U = aj
            }
            ad = (ad + U) & 4294967295;
            ac = (ac + S) & 4294967295;
            W = (W + ab) & 4294967295;
            am = (am + X) & 4294967295;
            Y = (Y + V) & 4294967295
        }
        return k.toHexStr(ad) + k.toHexStr(ac) + k.toHexStr(W) + k.toHexStr(am) + k.toHexStr(Y)
    };
    var e = window,
        C = e.document,
        j = e.navigator;
    var q = "_umdata";
    var v = "";
    var z = 0;
    var a = window.indexedDB || window.mozIndexedDB || window.webkitIndexedDB || window.msIndexedDB;
    var B = "";
    var l = (function() {
        return {
            getExtProps: function() {
                var E = this.getPlugins();
                var D = {};
                D.epl = E.length;
                if (D.epl != 0) {
                    D.ep = k.hash(E.join(","))
                }
                var u = this.getCanvasData();
                if (u != "") {
                    D.ecn = k.hash(u)
                }
                D.ent = this.getDoNotTrack();
                D.eca = o.getBrowCookie("cna");
                D.est = z;
                D.erd = (B == "" ? null : k.hash(B));
                D.eua = j.userAgent;
                return g.toJson(D)
            },
            getPlugins: function() {
                if (g.isIE() && g.isIE() < 11) {
                    return this.getPluginsIE()
                } else {
                    var J = j.plugins || [];
                    var I = [];
                    for (var E = 0; E < J.length; E++) {
                        var F = J[E];
                        try {
                            if (F) {
                                var H = [];
                                for (var u = 0; u < F.length; u++) {
                                    if (F.item(u)) {
                                        H.push(F.item(u).type)
                                    }
                                }
                                var D = F.name + ";";
                                if (F.version) {
                                    D += F.version + ";"
                                }
                                D += F.filename + ";";
                                D += H.join(";");
                                I.push(D)
                            }
                        } catch (G) {}
                    }
                    return I
                }
            },
            getPluginsIE: function() {
                var u = [];
                var E = function(G) {
                    if (window && G && window.ActiveXObject) {
                        var H = 0;
                        var J = null;
                        while (J === null && H < G.ids.length) {
                            try {
                                J = new ActiveXObject(G.ids[H])
                            } catch (I) {}
                            H++
                        }
                        if (J) {
                            try {
                                u.push(G.name + "==" + G.getVersion(J, G.ids[H]))
                            } catch (I) {}
                        }
                    }
                };
                var D = [{
                    name: "Quicktime",
                    ids: ["QuickTimeCheckObject.QuickTimeCheck.1", "QuickTime.QuickTime"],
                    getVersion: function(H, G) {
                        return H.QuickTimeVersion.toString(16).replace(/^(.)(.)(.).*/, "$1.$2.$3")
                    }
                }, {
                    name: "Acrobat",
                    ids: ["PDF.PdfCtrl.7", "PDF.PdfCtrl.6", "PDF.PdfCtrl.5", "PDF.PdfCtrl.4", "PDF.PdfCtrl.3", "AcroPDF.PDF.1"],
                    getVersion: function(H, G) {
                        return G.replace(/^[a-zA-Z.]+\.([0-9][0-9.]*)/, "$1")
                    }
                }, {
                    name: "RealPlayer",
                    ids: ["RealPlayer.RealPlayer(tm) ActiveX Control (32-bit)", "RealVideo.RealVideo(tm) ActiveX Control (32-bit)", "rmocx.RealPlayer G2 Control"],
                    getVersion: function(H, G) {
                        return H.GetVersionInfo()
                    }
                }, {
                    name: "Flash",
                    ids: ["ShockwaveFlash.ShockwaveFlash.9", "ShockwaveFlash.ShockwaveFlash.8.5", "ShockwaveFlash.ShockwaveFlash.8", "ShockwaveFlash.ShockwaveFlash.7", "ShockwaveFlash.ShockwaveFlash.6", "ShockwaveFlash.ShockwaveFlash.5", "ShockwaveFlash.ShockwaveFlash.4"],
                    getVersion: function(H, G) {
                        return H.GetVariable("$version").replace(/[a-zA-Z ]*([0-9,]+)/, "$1").replace(/,/g, ".")
                    }
                }, {
                    name: "Adobe SVG",
                    ids: ["Adobe.SVGCtl"],
                    getVersion: function(H, G) {
                        return H.getSVGViewerVersion().replace(/[a-zA-Z; ]*([0-9.]+)/, "$1")
                    }
                }, {
                    name: "Windows Media Player",
                    ids: ["WMPlayer.OCX", "MediaPlayer.MediaPlayer.1"],
                    getVersion: function(H, G) {
                        return H.versionInfo
                    }
                }, {
                    name: "DivX",
                    ids: ["npdivx.DivXBrowserPlugin.1", "npdivx.DivXBrowserPlugin"],
                    getVersion: function(H, G) {
                        return H.GetVersion()
                    }
                }, {
                    name: "WPFe (Silverlight)",
                    ids: ["AgControl.AgControl"],
                    getVersion: function(K, I) {
                        var G = "1";
                        var J = "0";
                        var H = "0";
                        while (K.IsVersionSupported(G + "." + J + "." + H)) {
                            G++
                        }
                        G--;
                        while (K.IsVersionSupported(G + "." + J + "." + H)) {
                            J++
                        }
                        J--;
                        while (K.IsVersionSupported(G + "." + J + "." + H)) {
                            H++
                        }
                        H--;
                        return G + "." + J + "." + H
                    }
                }, {
                    name: "MSXML",
                    ids: ["MSXML2.DOMDocument.6.0", "MSXML2.DOMDocument.5.0", "MSXML2.DOMDocument.4.0", "MSXML2.DOMDocument.3.0"],
                    getVersion: function(H, G) {
                        return G.replace(/^[a-zA-Z.2]+\.([0-9]+\.[0-9.]+)/, "$1")
                    }
                }];
                for (var F = 0; F < D.length; F++) {
                    E(D[F])
                }
                return u
            },
            getCanvasData: function() {
                try {
                    var D = C.createElement("canvas");
                    D.height = 60;
                    D.width = 400;
                    var u = D.getContext("2d");
                    D.style.display = "inline";
                    u.textBaseline = "alphabetic";
                    u.fillStyle = "#f60";
                    u.fillRect(125, 1, 62, 20);
                    u.fillStyle = "#069";
                    u.font = "11pt no-real-font-123";
                    u.fillText("Cwm fjordbank glyphs vext quiz, \ud83d\ude03", 2, 15);
                    u.fillStyle = "rgba(102, 204, 0, 0.7)";
                    u.font = "18pt Arial";
                    u.fillText("Cwm fjordbank glyphs vext quiz, \ud83d\ude03", 4, 45);
                    return D.toDataURL()
                } catch (E) {
                    return ""
                }
            },
            getDoNotTrack: function() {
                var u = "";
                if (j.doNotTrack != null && j.doNotTrack != "unspecified") {
                    if (j.doNotTrack == "1" || j.doNotTrack == "yes") {
                        u = "yes"
                    } else {
                        u = "no"
                    }
                } else {
                    u = "NC"
                }
                return u
            },
            getWebRTCID: function() {
                try {
                    if (MediaStreamTrack && MediaStreamTrack.getSources) {
                        MediaStreamTrack.getSources(function(G) {
                            for (var F = 0, D = G.length; F < D; F++) {
                                var E = G[F];
                                try {
                                    B += E.id
                                } catch (H) {}
                            }
                        })
                    }
                } catch (u) {}
            }
        }
    })();
    var o = (function() {
        var u = null;
        var F;
        var E = false;
        var D = [10, 8, 7, 3, 2];
        return {
            init: function(H, G) {
                F = H;
                E = G
            },
            setUserData: function(G) {
                u = G
            },
            set: function(G, H) {
                try {
                    F && F.setCookie(G, H)
                } catch (I) {}
                try {
                    if (window.localStorage) {
                        localStorage[G] = H
                    }
                } catch (I) {}
                this.saveIndexdb(G, H);
                if (j.cookieEnabled) {
                    var K = 365 * 1000 * 60 * 60 * 24;
                    var J = G + "=" + encodeURIComponent(H);
                    J += ";expires=" + new Date(new Date().getTime() + K).toGMTString();
                    C.cookie = J
                }
                if (g.isIE() && (g.isIE() < 11) && u) {
                    try {
                        u.load("um");
                        u.setAttribute(G, H);
                        u.save("um")
                    } catch (I) {}
                }
            },
            get: function(G, J) {
                var H;
                if (E && F) {
                    try {
                        H = F.getCookie(G) || "";
                        if (H) {
                            z = 1;
                            if (!J && H) {
                                this.set(G, H)
                            }
                            return H
                        }
                    } catch (I) {}
                }
                try {
                    if (window.localStorage) {
                        H = localStorage[G] || "";
                        if (H) {
                            z = 2;
                            if (!J && H) {
                                this.set(G, H)
                            }
                            return H
                        }
                    }
                } catch (I) {}
                if (v) {
                    z = 4;
                    if (!J && v) {
                        this.set(G, v)
                    }
                    return v
                }
                if (g.isIE() && (g.isIE() < 11) && u) {
                    try {
                        u.load("um");
                        H = u.getAttribute(G);
                        if (H) {
                            z = 8;
                            if (!J && H) {
                                this.set(G, H)
                            }
                            return H
                        }
                    } catch (I) {}
                }
                if (j.cookieEnabled) {
                    H = this.getBrowCookie(G);
                    if (H) {
                        z = 16;
                        if (!J && H) {
                            this.set(G, H)
                        }
                        return H
                    }
                }
            },
            getBrowCookie: function(K) {
                var L = document.cookie ? document.cookie.split("; ") : [],
                    H;
                for (var J = 0, G = L.length; J < G; J++) {
                    var M = L[J].split("=");
                    var I = decodeURIComponent(M.shift());
                    if (K === I) {
                        H = M.shift();
                        break
                    }
                }
                return H
            },
            remove: function(H, G) {
                if (G == h) {
                    G = 255
                }
                if (j.cookieEnabled && (G & 16)) {
                    C.cookie = H + "=;expires=Thu, 01-Jan-70 00:00:01 GMT;"
                }
                if (g.isIE() && (g.isIE() < 11) && u) {
                    try {
                        u.load("um");
                        u.removeAttribute(H);
                        u.save("um")
                    } catch (I) {}
                }
                try {
                    (G & 4) && window.localStorage && localStorage.removeItem(H);
                    (G & 1) && E && F.setCookie(H, "")
                } catch (I) {}
                this.saveIndexdb(H, "")
            },
            renderUserData: function() {
                var G = document.createElement("INPUT");
                G.type = "hidden";
                G.style.display = "none";
                G.addBehavior("#default#userData");
                document.body.appendChild(G);
                o.setUserData(G)
            },
            saveIndexdb: function(G, I) {
                if (I === h) {
                    return
                }
                try {
                    if (a) {
                        var H = a.open("umdb", 1);
                        H.onerror = function(K) {};
                        H.onupgradeneeded = function(M) {
                            var L = M.target.result;
                            var K = L.createObjectStore("umdata", {
                                keyPath: "name"
                            })
                        };
                        H.onsuccess = function(O) {
                            var K = O.target.result;
                            if (K.objectStoreNames.contains("umdata")) {
                                var M = K.transaction(["umdata"], "readwrite");
                                var N = M.objectStore("umdata");
                                var L = N.put({
                                    name: G,
                                    value: I
                                })
                            }
                            K.close()
                        };
                        v = I
                    }
                } catch (J) {}
            },
            getIndexdb: function(H) {
                var G = arguments;
                try {
                    if (a) {
                        var I = a.open("umdb", 1);
                        I.onerror = function(K) {
                            if (G.length == 2) {
                                n.initInner(G[1])
                            }
                        };
                        I.onupgradeneeded = function(M) {
                            var L = M.target.result;
                            var K = L.createObjectStore("umdata", {
                                keyPath: "name"
                            })
                        };
                        I.onsuccess = function(N) {
                            var K = N.target.result;
                            if (K.objectStoreNames.contains("umdata")) {
                                var M = K.transaction(["umdata"], "readwrite");
                                var L = M.objectStore("umdata").get(H);
                                L.onsuccess = function(O) {
                                    if (L.result) {
                                        v = L.result.value
                                    }
                                    if (G.length == 2) {
                                        n.initInner(G[1])
                                    }
                                };
                                L.onerror = function(O) {
                                    if (G.length == 2) {
                                        n.initInner(G[1])
                                    }
                                }
                            }
                            K.close()
                        }
                    }
                } catch (J) {}
            }
        }
    })();
    var g = (function() {
        var D;
        var u = (function() {
            var G = j.userAgent;
            var F = G.indexOf("MSIE ");
            if (F > 0) {
                return parseInt(G.substring(F + 5, G.indexOf(".", F)), 10)
            }
            var E = G.indexOf("Trident/");
            if (E > 0) {
                var I = G.indexOf("rv:");
                return parseInt(G.substring(I + 3, G.indexOf(".", I)), 10)
            }
            var H = G.indexOf("Edge/");
            if (H > 0) {
                return parseInt(G.substring(H + 5, G.indexOf(".", H)), 10)
            }
            return false
        })();
        return {
            init: function(E) {
                D = E
            },
            isIE: function() {
                return u
            },
            jsonp: function() {
                var E = C.getElementsByTagName("head")[0] || C.documentElement,
                    F = function(H) {
                        var G = "_" + parseInt(Math.random() * 10000, 10) + "_" + new Date().getTime();
                        window[G] = function(I) {
                            H(I);
                            E.removeChild(C.getElementById(G));
                            try {
                                delete window[G]
                            } catch (J) {}
                        };
                        return G
                    };
                return function(L, O, K) {
                    var J = false,
                        M = C.createElement("script"),
                        H = F(O),
                        G = L,
                        I;
                    I = [];
                    for (var N in K || {}) {
                        I.push(N + "=" + encodeURIComponent(K[N]))
                    }
                    I.push("_callback=" + H);
                    G += G.indexOf("?") > 0 ? "&" : "?";
                    G += I.join("&");
                    M.id = H;
                    M.onload = M.onreadystatechange = function() {
                        if (!J && (!this.readyState || this.readyState === "loaded" || this.readyState === "complete")) {
                            J = true;
                            M.onload = M.onreadystatechange = null
                        }
                    };
                    M.src = G;
                    E.insertBefore(M, E.firstChild)
                }
            }(),
            extend: function(G) {
                for (var F = 1, E = arguments.length; F < E; F++) {
                    for (var H in arguments[F]) {
                        if (arguments[F].hasOwnProperty(H)) {
                            G[H] = arguments[F][H]
                        }
                    }
                }
                return G
            },
            detectPlugin: function(E, F) {
                return j.plugins && j.plugins[E] && j.mimeTypes && j.mimeTypes[F] && j.mimeTypes[F].enabledPlugin ? j.plugins[E] : false
            },
            detectActiveX: function(G) {
                var F = false;
                try {
                    F = new ActiveXObject(G)
                } catch (E) {}
                return F
            },
            toJson: function(I) {
                var E = [];
                try {
                    for (H in I) {
                        var F = "";
                        var G = I[H];
                        switch (typeof G) {
                            case "string":
                                G = G.replace(/\"/g, ".");
                                F = H + ':"' + G + '"';
                                E.push(F);
                                break;
                            case "number":
                                F = H + ":" + G;
                                E.push(F);
                                break;
                            case "boolean":
                                if (G) {
                                    F = H + ":1"
                                } else {
                                    F = H + ":0"
                                }
                                E.push(F);
                                break
                        }
                    }
                } catch (H) {}
                return "{" + E.join(",") + "}"
            },
            append: function(G, E) {
                if (!G) {
                    G = C.body
                }
                var F = C.createElement("span");
                F.innerHTML = E;
                G.insertBefore(F.firstChild, G.firstChild);
                F = null
            },
            track: function() {
                var E = [];
                return function(F) {
                    if (!D.debug) {
                        return
                    }
                    if (window.Tracker) {
                        Tracker.click("um-" + F)
                    } else {
                        if (F) {
                            E.push(F);
                            setTimeout(function() {
                                g.track(E.shift())
                            }, 100)
                        }
                    }
                }
            }()
        }
    })();
    var y = {
        version: "2.0.7",
        enabled: true,
        debug: false,
        ratio: 1,
        timeout: 3000,
        timestamp: "-",
        token: "",
        serviceUrl: "/service/um.json",
        flashUrl: "https://assets.alicdn.com/g/security/umflash/fp.swf?v1=1",
        enableMod: true,
        containers: {
            flash: null,
            dcp: null
        },
        appName: ""
    };
    var A = 6;
    var t = 0,
        r = null,
        x = false,
        s = null,
        c = false,
        m, w = null,
        b = {};
    var f = function() {
        r = C.getElementById("umFlash");
        s = C.getElementById("umDcp");
        try {
            if (s && typeof s.getHardVersion != "undefined") {
                w.mod = parseInt(s.getHardVersion().replace(/\./g, ""), 10) || 1
            }
        } catch (u) {}
        try {
            if (!x) {
                x = r && r.md5
            }
            o.init(r, x)
        } catch (u) {}
    };
    var i = function() {
        var F, D = [0, 0, 0],
            u = 0;
        if (g.isIE()) {
            F = g.detectActiveX("ShockwaveFlash.ShockwaveFlash");
            if (F) {
                try {
                    if ((G = F.GetVariable("$version"))) {
                        G = G.split(" ")[1].split(",");
                        D = [parseInt(G[0], 10), parseInt(G[1], 10), parseInt(G[2], 10)]
                    }
                } catch (E) {}
                F = null
            }
            F = b.enableMod && g.detectActiveX("Alim.webmod");
            if (F) {
                try {
                    u = 1;
                    if (typeof F.getHardVersion != "undefined") {
                        u = parseInt(F.getHardVersion().replace(/\./g, ""), 10) || 1
                    }
                } catch (E) {}
                F = null
            }
        } else {
            F = g.detectPlugin("Shockwave Flash", "application/x-shockwave-flash");
            if (F && F.description) {
                var G = F.description.replace(/^.*\s+(\S+\s+\S+$)/, "$1");
                D[0] = parseInt(G.replace(/^(.*)\..*$/, "$1"), 10);
                D[1] = parseInt(G.replace(/^.*\.(.*)\s.*$/, "$1"), 10);
                D[2] = /[a-zA-Z]/.test(G) ? parseInt(G.replace(/^.*[a-zA-Z]+(.*)$/, "$1"), 10) : 0;
                F = null
            }
            F = b.enableMod && g.detectPlugin("Alipay webmod control", "application/alidcp");
            if (F) {
                u = 1;
                F = null
            }
        }
        return {
            flash: D,
            mod: u
        }
    };
    n.getStatus = function(u) {
        return u ? t : t >= 200
    };
    n.init = function(u) {
        l.getWebRTCID();
        if (o.get(q, true)) {
            this.initInner(u)
        } else {
            if (!a) {
                this.initInner(u)
            } else {
                o.getIndexdb(q, u)
            }
        }
    };
    n.initInner = function(E) {
        if (c) {
            return
        }
        c = true;
        try {
            b = g.extend({}, y, E || {});
            g.init(b)
        } catch (D) {}
        w = i();
        t = 1;
        var u = 0;
        m = setTimeout(function() {
            if (t < 3) {
                f();
                u++;
                if (u < 10 && r) {
                    g.track(x ? "timeout-flash" : "timeout-flash-na");
                    setTimeout(arguments.callee, b.timeout >> 1);
                    p();
                    return
                } else {
                    setTimeout(arguments.callee, 200)
                }
            }
            t = 201
        }, b.timeout);
        if (b.debug) {
            n.options = b
        }
        if (b.enabled && (b.ratio <= 1 || !parseInt(Math.random() * b.ratio, 10))) {
            try {
                d()
            } catch (D) {
                g.track("init-error")
            }
        }
    };
    var p = function() {
        var u = function(F, E) {
                if (typeof F != "boolean" && (!F || F == "-")) {
                    return "-"
                }
                switch (E) {
                    case 0:
                        if (typeof F === "string") {
                            F = F === "true"
                        }
                        result = F ? "1" : "0";
                        break;
                    case 1:
                        result = parseInt(F, 10) || 0;
                        break;
                    case 2:
                        F = "" + F;
                        result = x && F.length > 32 ? r.md5(F) : F;
                        break;
                    case 3:
                        result = "" + F;
                        break;
                    default:
                        result = "-";
                        break
                }
                return result
            },
            D = [{
                avHardwareDisable: [0, 0],
                hasAudio: [0, 0],
                hasAudioEncoder: [0, 0],
                hasMP3: [0, 0],
                hasPrinting: [0, 0],
                hasStreamingAudio: [0, 0],
                hasStreamingVideo: [0, 0],
                hasVideoEncoder: [0, 0],
                maxLevelIDC: [1, 0],
                pixelAspectRatio: [1, 0],
                screenColor: [2, 0],
                screenDPI: [1, 1],
                screenResolutionX: [1, 0],
                screenResolutionY: [1, 0]
            }, {
                hasAccessibility: [0, 0],
                hasEmbeddedVideo: [0, 0],
                hasScreenBroadcast: [0, 0],
                hasScreenPlayback: [0, 0],
                isDebugger: [0, 0],
                isEmbeddedInAcrobat: [0, 0],
                hasIME: [0, 0],
                hasTLS: [0, 0],
                language: [2, 0],
                languages: [2, 0],
                localFileReadDisable: [0, 0],
                os: [2, 0],
                cookieEnabled: [0, 1],
                platform: [2, 1, function(E) {
                    if (!E) {
                        return ""
                    }
                    return E.split(" ").shift()
                }]
            }, {
                playerType: [2, 0],
                version: [2, 0],
                userAgent: [2, 1],
                appCodeName: [2, 1],
                appMinorVersion: [2, 1],
                appName: [2, 1],
                appVersion: [2, 1],
                systemLanguage: [2, 1],
                userLanguage: [2, 1],
                browserLanguage: [2, 1],
                manufacturer: [2, 0],
                fonts: [2, 0],
                cpuClass: [2, 1]
            }, {
                width: [1, 2],
                height: [1, 2],
                availWidth: [1, 2],
                availHeight: [1, 2],
                clientWidth: [1, 3],
                clientHeight: [1, 3],
                screenTop: [1, 5, function() {
                    return (typeof e.screenLeft == "number") ? e.screenLeft : e.screenX
                }],
                screenLeft: [1, 5, function() {
                    return (typeof e.screenTop == "number") ? e.screenTop : e.screenY
                }],
                language: [2, 1],
                oscpu: [2, 1],
                location: [3, 4, function(E) {
                    if (!E) {
                        return ""
                    }
                    return encodeURIComponent(E.href.slice(0, 255))
                }],
                timezone: [1, 5, function() {
                    var G = new Date();
                    G.setDate(1);
                    G.setMonth(5);
                    var F = -G.getTimezoneOffset();
                    G.setMonth(11);
                    var E = -G.getTimezoneOffset();
                    return Math.min(F, E)
                }],
                timestamp: [3, 5, function() {
                    return new Date().getTime()
                }]
            }];
        if (y.debug) {
            n.cookie = o;
            n.ua = w
        }
        return function() {
            if (arguments.callee.invoked || !c) {
                return
            }
            arguments.callee.invoked = true;
            t = 3;
            window.__flash__removeCallback = function(R, S) {
                if (R) {
                    R[S] = null
                }
            };
            f();
            var H = {
                xt: b.token || "",
                xa: b.appName || "",
                xh: ""
            };
            try {
                if (b.enableMod && w.mod) {
                    var N = g.isIE() ? new ActiveXObject("Alim.webmod") : s;
                    if (w.mod >= 2001) {
                        N.timestamp = b.timestamp || "-"
                    }
                    H.xh = N.ciraw()
                }
            } catch (L) {
                if (!H.xh) {
                    H.xh = ""
                }
            }
            var J;
            try {
                J = H.xs = o.get(q, false)
            } catch (L) {
                g.track("err-read-s")
            }
            try {
                for (var I = 0; I < 4; I++) {
                    var M = [],
                        P = [],
                        F = D[I];
                    for (var E in F) {
                        F.hasOwnProperty(E) && M.push(E)
                    }
                    M = M.sort();
                    for (var G = 0, K = M.length; G < K; G++) {
                        var Q = D[I][M[G]],
                            O = "";
                        try {
                            switch (Q[1]) {
                                case 0:
                                    O = (x && r.getCapabilities(M[G])) || "";
                                    if (O && Q[2]) {
                                        O = Q[2](O)
                                    }
                                    break;
                                case 1:
                                    O = j[M[G]] || "";
                                    if (O && Q[2]) {
                                        O = Q[2](O)
                                    }
                                    break;
                                case 2:
                                    O = e.screen[M[G]] || "";
                                    if (O && Q[2]) {
                                        O = Q[2](O)
                                    }
                                    break;
                                case 3:
                                    O = C.body[M[G]] || "";
                                    if (O && Q[2]) {
                                        O = Q[2](O)
                                    }
                                    break;
                                case 4:
                                    O = e[M[G]] || "";
                                    if (O && Q[2]) {
                                        O = Q[2](O)
                                    }
                                    break;
                                case 5:
                                    if (Q[2]) {
                                        O = Q[2]()
                                    }
                                    break
                            }
                        } catch (L) {}
                        P.push(u(O, Q[0]))
                    }
                    H["x" + I] = P.join("^^")
                }
                H.ext = l.getExtProps()
            } catch (L) {
                g.track("err-read")
            }
            H.xv = b.version;
            t = 4;
            try {
                g.jsonp(b.serviceUrl, function(R) {
                    m && clearTimeout(m);
                    if (!R || !("id" in R)) {
                        t = 200
                    } else {
                        t = 255;
                        J = R.id;
                        if (J) {
                            o.set(q, J)
                        }
                        b.debug && b.onCompleted && b.onCompleted(R.id)
                    }
                }, H)
            } catch (L) {}
        }
    }();
    var d = function() {
        n.flashLoaded = function() {
            if (arguments.callee.invoked || !c) {
                return
            }
            arguments.callee.invoked = true;
            x = true;
            p()
        };
        var D = function() {
                var E = '<embed height="1" width="1" id="umDcp" type="application/alidcp" class="umidWrapper" />';
                g.append(b.containers.dcp, E)
            },
            u = function() {
                var E = '<object type="application/x-shockwave-flash" data="' + b.flashUrl + '" width="1" height="1" id="umFlash" class="umidWrapper">';
                E += '<param name="movie" value="' + b.flashUrl + '" /><param name="allowScriptAccess" value="always" /></object>';
                g.append(b.containers.flash, E)
            };
        return function() {
            if (arguments.callee.invoked || !c) {
                return
            }
            arguments.callee.invoked = true;
            t = 2;
            try {
                g.isIE() && (g.isIE() < 11) && o.renderUserData()
            } catch (E) {}
            try {
                b.enableMod && !g.isIE() && w.mod && D()
            } catch (E) {}
            if (w.flash[0] >= 9) {
                try {
                    u()
                } catch (E) {
                    p()
                }
            } else {
                p()
            }
        }
    }()
})(window.um = {});