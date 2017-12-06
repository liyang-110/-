(function(global, $) {
    // =======================================瀛樺偍鏀寔==========================================
    var checkStorage = function(s) {  
        var key = "CHECK_STOARGE_TEST",
            value;                
        
        try {
            s.setItem(key, 1);                
            value = s.getItem(key);
            s.removeItem(key); 
            
            return value == 1;
        } catch(e) {
            return false;
        }        
    };

    // 瀛樺偍鏀寔鎯呭喌
    try { 
        $.isSessionAble = checkStorage(sessionStorage);
        $.isLocalAble = checkStorage(localStorage);
    } catch(e) {
        $.isSessionAble = false;
        $.isLocalAble = false;
    }

    // window.name缂撳瓨锛屽拰localStorage鍙妔essionStorage琛屼负淇濇寔涓€鑷�
    var nameStore = {
        // 鍒锋柊鏁版嵁
        _flush: function(data) {
            data && (window.name = JSON.stringify(data));
        },
        getAll: function() {
            try{
                return this.data = $.parseJSON(window.name || '{}');
            }catch(e) {
                return this.data = {};
            }
        },
        setItem: function(key, value) {
            var data = this.data || this.getAll();
            if (!$.isPlainObject(data)) {
                data = {};
            }
            data[key] = value;
            this._flush(data);
        },
        getItem: function(key) {
            var data = this.data || this.getAll();
            if ($.isPlainObject(data)) {
                return data[key];
            }
        },
        removeItem: function(key) {
            var data = this.data || this.getAll();
            if ($.isPlainObject(data)) {
                delete data[key];
                this._flush(data);
            }
        }
    };

    /**
     * 瀛樺偍鏀寔
     * @param  {String} type      鍙€夛紝瀛樺偍绫诲瀷锛歭ocal銆乻ession銆乶ame銆乻torage锛岄粯璁ession
     * @param  {String} nameSpace 鍙€夛紝鍛藉悕绌洪棿锛岄粯璁や娇鐢�'STORAGE_NAMESPACE'鍛藉悕绌洪棿
     */
    var _Storage = function(type, nameSpace) {
        type = type || 'session'; 
        nameSpace = nameSpace || 'STORAGE_NAMESPACE';

      var 
        MAX = 40, // 鏈€澶у皾璇曟鏁�
        COUNT = 0, // 璁℃暟
        TIME = 1000 * 60 * 60 * 24, // 涓€澶╂椂闂�
        storageTpye = {
            local: function(key) {
                return $.isLocalAble ? // localStorage瀛樺偍锛屽鏋滀笉鏀寔璇ュ瓨鍌ㄦ柟寮忥紝璁剧疆鏃犳晥鏋滐紝鎵€浠ラ渶瑕佸厛鍒ゆ柇鏄惁鏀寔local瀛樺偍
                    [$.parseJSON(localStorage.getItem(key) || "{}"), localStorage] : [{}, {setItem: function(){}}];
            },
            session: function(key) { // session绾х紦瀛橈紝sessionStorage -> window.name 閫愭鍏煎
                return $.isSessionAble ? 
                    [$.parseJSON(sessionStorage.getItem(key) || "{}"), sessionStorage] : this.name(key);
            },
            name: function(key) { // 涔熸槸session绾х紦瀛橈紝浣嗘槸鍙敤window.name瀛樺偍
                return [nameStore.getItem(key), nameStore];
            },
            storage: function(key) { // localStorage -> sessionStorage -> window.name 閫愭鍏煎
                return $.isLocalAble ?
                    [$.parseJSON(localStorage.getItem(key) || "{}"), localStorage] : this.session(key);
            }
        };

        var temp, storage, storageData;
        temp = storageTpye[type](nameSpace);
        storageData = temp[0]; // 瀛樺偍鏁版嵁
        storage = temp[1]; // 瀛樺偍鏂瑰紡

        /**
         * 璁剧疆瀛樺偍鏁版嵁
         * @param {[type]} key   閿悕
         * @param {[type]} value 閿€�
         */
        var setItem = function(key, value) {
            COUNT = MAX;  //閲嶇疆
            storageData[key] = {"v" : value, "t": +new Date()};
            _flush();
        };

        // 鑾峰彇瀛樺偍鏁版嵁
        var getItem = function(key) {
            var value = storageData[key],
                vv = value && value.v;

            return $.isPlainObject(vv) ? $.extend(true,{},vv) : 
                $.isArray(vv) ? $.extend(true, [], vv) : vv;
        };

        // 绉婚櫎瀛樺偍鏁版嵁
        var removeItem = function(key) {
            COUNT = MAX;  //閲嶇疆
            delete storageData[key];
            _flush();
        };

        /**
         * 鍙栧緱鏁存鏁版嵁
         * @param  {Boolean} extend 锛屾渶濂戒紶鍏ヨ鍙傛暟涓簍rue锛岄槻姝㈠杩斿洖鐨勬暟鎹洿鏀�
         */
        var getAll = function(extend) {
            return extend ? $.extend(true, {}, storageData) : storageData;
        };

        // 鍒峰叆缂撳瓨鏁版嵁
        var _flush = function() {
            var dataStr;

            try {
                dataStr = JSON.stringify(storageData);
            } catch(e) {
                throw new Error('JSON.stringify杞寲鍑洪敊');
            }

            try {
                storage.setItem(nameSpace, dataStr);
            } catch(e) {
                COUNT--;
                if(COUNT >= 0) {
                    _deleteByTime();
                    _flush();
                } else {
                    throw new Error("鍐欏叆瀛樺偍鎶ラ敊");
                }
            }
        };

        // 鎸夋椂闂村垹闄�
        var _deleteByTime = function() {
            var old, key, now = +new Date();
            
            $.each(storageData, function(k,v){
                if(old){
                    if (now - old.t >= TIME) return false;
                    else if (old.t > v.t) { old = v; key = k;}
                }else{
                    old = v;
                    key = k;
                }
            });
            
            old && delete storageData[key];
        };

        return {
            getAll: getAll,
            setItem: setItem,
            getItem: getItem,
            removeItem: removeItem
        };
    };

    $.storage = _Storage;
    $.localS = _Storage('local');
    $.sessionS = _Storage('session');
    //鏆備笉寮€鏀撅紝闃叉鍐呭瓨鍗犵敤鍙婂彲鑳界殑鏁版嵁涓叉壈
    // $.nameS = storage('name');
    // $.storageS = storage('storage');
    
    // =======================================鍏ㄥ眬鍑芥暟澶勭悊==========================================
    var Overall = {
        _events : {},    // 鑷畾涔変簨浠�                          

        // 瑙﹀彂鑷畾涔変簨浠�
        emit : function (type) {
            if ( !this._events[type] ) {
                return;
            }

            var i = 0,
                l = this._events[type].length;

            if ( !l ) {
                return;
            }

            for ( ; i < l; i++ ) {
                this._events[type][i].apply(this, [].slice.call(arguments, 1)); 
            }
        },

        // 鍒犻櫎鑷畾涔変簨浠�
        off : function(name, callback) {
            if (!(name || callback)) {
                this._events = {};
                return;
             }

            var list = this._events[name];
            if (list) {
                if (callback) {
                    for (var i = list.length - 1; i >= 0; i--) {
                        if (list[i] === callback) {
                            list.splice(i, 1);
                        }
                    }
                }
                else {
                    delete this._events[name];
                }
            }
        },

        // 娣诲姞鑷畾涔変簨浠�
        on : function (type, fn) {
            if ( !this._events[type] ) {
                this._events[type] = [];
            }

            this._events[type].push(fn);
        },

        // 鍑芥暟鑺傛祦
        throttle: function(method, context, time) {
            clearTimeout(method.tId);
            method.tId = setTimeout(function() {
                method.call(context);
            }, time || 100);
        },

        // 鏍煎紡鍖栧€�
        formatVal: function(data, len) {
            len = len || 3;
            data = $.trim(data + '');

            var arr = [];
            while(data.length > len) {
                arr.push(data.slice(-len));
                data = data.slice(0, -len);
            }

            if(data) arr.push(data);

            return arr.reverse().join(',');
        },

        // 渚濊禆jQuery鎴杬epto
        ajaxEx: function(args) {
            var o = this._o || 
                (this._o = Overall.o);

            args = args || {};
            args.data = args.data || {};
            args.data.o = o;

            args = $.extend({
                cache: false,
                dataType: 'json'
            }, args);

            $.ajax(args);
        },

        // 鍙栧緱url鍗曚釜鍙傛暟
        getQueryStr: function(name, str) {
            var reg = new RegExp("(^|&|\\?)" + name + "=([^&]*)(&|$)", "i");
            var result = (str || location.search.substr(1)).match(reg);
            if (result != null) return decodeURIComponent(result[2]);
            return null;
        },

        /*  
         *  璇存槑锛氳繃婊SS
         *  @param  {String}    str 闇€瑕佽繃婊ょ殑鍐呭
         *  @return {String}    鏄剧ず鐨勫唴瀹�
         */
        xss: function(str) {
            var div = doc.createElement("div"),
                text = doc.createTextNode(str), val = '';

            div.appendChild(text);
            val = div.innerHTML;
            text = null; div = null;

            return val;
        },

        // 绠€鍗曠殑妯℃澘鏇挎崲鏂规硶
        format: function(str, data) {
            var that = this;
            return str.replace(/\{([^{}]+)\}/g, function(match, key) {
                var value = data[key];
                return (value !== undefined) ? that.xss('' + value) : match;
            });
        },

        /**
         * 鑾峰彇url鎴栬€呰嚜瀹氫箟瀛楃涓蹭腑鐨勫弬鏁�
         * 
         * @param {String} name 涓嶄紶name鍒欑洿鎺ヨ繑鍥炴暣涓弬鏁板璞�
         * @param {String} queryStr 鑷畾涔夊瓧绗︿覆
         * @param {Boolean} [unfilter:false] 涓嶈繘琛屽弬鏁癤SS瀹夊叏杩囨护
         * @param {Boolean} [undecode:false]] 涓嶈繘琛岃嚜鍔ㄨВ鐮�
         * @return {String|Object} 鑾峰彇鍒扮殑鍙傛暟鍊兼垨鑰呯敱鎵€鏈夊弬鏁扮粍鎴愬畬鏁村璞�
        */
        getQuery: function(name, queryStr, unxss, undecode) {
            var str = queryStr || location.search.replace("?",""), tempArr,
                obj = {}, temp, arr = str.split("&"), len = arr.length;

            if(len > 0) {
                for(var i = 0; i < len; i++) {
                    try{
                        if((tempArr = arr[i].split('=')).length === 2) {
                            temp = undecode ? tempArr[1] : decodeURIComponent(tempArr[1]);
                            obj[tempArr[0]] = unxss ? temp : this.xss(temp);
                        }                        
                    }catch(e){}
                }
            }

            return name ? obj[name] : obj;
        },

        /**
         * 鍒ゆ柇鏄惁鏄痠e鍙奿e鐨勭増鏈紝
         * @return {false|6|7|8|9} 
         */
        ie: function () {
            var v = 4, 
                div = document.createElement('div'),
                i = div.getElementsByTagName('i');
            do {
                div.innerHTML = '<!--[if gt IE ' + (++v) + ']><i></i><![endif]-->';
            } while (i[0]);
            return v > 5 ? v : false; //濡傛灉涓嶆槸IE锛岃繑鍥瀎alse
        },

        /**
         * https://github.com/sindresorhus/multiline
         * 鍦↗S涓嚜鐒跺湴鍐檋tml锛岀粡娴嬭瘯(2000000娆�)锛�
         *     chrome涓虹敤'+'鐨�10-15鍒嗕箣涓€锛岀害2.7绉�
         *     IE11涓虹敤'+'鐨�5-6鍒嗕箣涓€锛岀害11绉�
         * @param  {Function} fn 
         * @return {String}
         */
        multiline: function (fn) {
            if (typeof fn !== 'function') {
                throw new Error('multiline need a function');
            }
            // 鐢ㄦ鍒欏尮閰嶆瘮鐢ㄥ瓧绗︿覆蹇�
            return fn.toString().replace(/.*?\/\*!/, '').replace(/(!\*\/\})|(!\*\/;\})/, '');//.replace('!*/}', '').replace('!*/;}', '');
        },

        //JS涓や釜瀵硅薄鎴栨暟缁勭殑姣旇緝锛岀浉鍚岃繑鍥瀟rue锛屼笉鍚岃繑鍥瀎alse
        compare: function(obj1, obj2) {
            var i, 
                equal = arguments[2] || [true];

            obj1 = obj1 || {};
            obj2 = obj2 || {};

            for(i in obj1) {
                if (obj1.hasOwnProperty(i) && obj2.hasOwnProperty(i)) {
                    if (typeof obj1[i] === 'object') {
                        arguments.callee(obj1[i], obj2[i], equal) 
                            && arguments.callee(obj2[i], obj1[i], equal);//闃叉杩欑鎯呭喌锛歝ompare([1,2,{}],[1,2,{"1":""}])
                    } else {
                        if(obj1[i] !== obj2[i]) {
                            equal.push(false);
                            return false;
                        }
                    }
                } else {
                    equal.push(false);
                    return false;
                }
            }

            for(i in obj2) {//闃叉杩欑鎯呭喌锛歝ompare([1,2],[1,2,{}])
                if(!(obj1.hasOwnProperty(i) && obj2.hasOwnProperty(i))){
                    equal.push(false);
                    return false;
                }
            }

            return equal.join("").indexOf("false") === -1 ? true : false;
        },

        getToken: function() {
            var token = this.o;

            if(token && token.length > 0){
                return token;
            }else{
                var result = location.pathname.split('/')[1];
                return result || '';
            }
        },

        path: function(url) {
            return '/' + this.getToken() + (url.charAt(0) === '/' ? '' : '/') + url;
        },

        seajsDebug: false
    };

    Overall.o = document.getElementsByName('unitName')[0] && document.getElementsByName('unitName')[0].content;
    global.Overall = global.O = global.Util = Overall;
    
})(this, window.Zepto || window.jQuery);