// JavaScript Document
var $ = function (id) {
    return "string" == typeof id ? document.getElementById(id) : id;
};

var Class = {
  create: function() {
    return function() {
      this.initialize.apply(this, arguments);
    }
  }
}

Object.extend = function(destination, source) {
    for (var property in source) {
        destination[property] = source[property];
    }
    return destination;
}

function addEventHandler(oTarget, sEventType, fnHandler) {
    if (oTarget.addEventListener) {
        oTarget.addEventListener(sEventType, fnHandler, false);
    } else if (oTarget.attachEvent) {
        oTarget.attachEvent("on" + sEventType, fnHandler);
    } else {
        oTarget["on" + sEventType] = fnHandler;
    }
};

var ColorFade = Class.create();
ColorFade.prototype = {
  initialize: function(Obj, options) {
    this._obj = $(Obj);
    this._timer = null;
    
    this.SetOptions(options);
    this.Step = Math.abs(this.options.Step);
    this.Speed = Math.abs(this.options.Speed);
    this.StartColor = this._color = this.GetColors(this.options.StartColor);
    this.EndColor = this.GetColors(this.options.EndColor);
    this._arrStep = [this.GetStep(this.StartColor[0], this.EndColor[0]), this.GetStep(this.StartColor[1], this.EndColor[1]), this.GetStep(this.StartColor[2], this.EndColor[2])];
    this._set = !this.options.Background ? function(color){ this._obj.style.color = color; } : function(color){ this._obj.style.backgroundColor = color; };
    
    this._set(this.options.StartColor);
    
    var oThis = this;
    addEventHandler(this._obj, "mouseover", function(){ oThis.Fade(oThis.EndColor); });
    addEventHandler(this._obj, "mouseout", function(){ oThis.Fade(oThis.StartColor); });
  },
  //设置默认属性
  SetOptions: function(options) {
    this.options = {//默认值
      StartColor:    "#000",//定义原来的颜色
      EndColor:        "#DDC",//定义要渐变的颜色
      Background:    false,//是否背景变色(默认文字)
      Step:            20,//渐变级数
      Speed:        10//渐变速度
    };
    Object.extend(this.options, options || {});
  },
  //获取颜色数据    
  GetColors: function(sColor) {
    sColor = sColor.replace("#", "");
    var r, g, b;
    if (sColor.length > 3) {
        r = Mid(sColor, 0, 2); g = Mid(sColor, 2, 2); b = Mid(sColor, 4, 2);
    } else {
        r = Mid(sColor, 0, 1); g = Mid(sColor, 1, 1); b = Mid(sColor, 2, 1); r += r; g += g; b += b;
    }
    return [parseInt(r, 16), parseInt(g, 16), parseInt(b, 16)];
  },
  //获取渐变颜色数据
  GetColor: function(c, ec, iStep) {
    if (c == ec) { return c; }
    if (c < ec) { c += iStep; return (c > ec ? ec : c); }
    else { c -= iStep; return (c < ec ? ec : c); }
  },
  //获取渐变级数
  GetStep: function(start, end) {
    var iStep = Math.abs((end - start) / this.Step);
    if(iStep > 0 && iStep < 1) iStep = 1;
    return parseInt(iStep);
  },
  //颜色渐变
  Fade: function(rColor) {
    clearTimeout(this._timer);
    
    var er = rColor[0], eg = rColor[1], eb = rColor[2], r = this.GetColor(this._color[0], er, this._arrStep[0]), g = this.GetColor(this._color[1], eg, this._arrStep[1]), b = this.GetColor(this._color[2], eb, this._arrStep[2]);
    
    this._set("#" + Hex(r) + Hex(g) + Hex(b));
    this._color = [r, g, b];
    
    if(r != er || g != eg || b != eb){ var oThis = this; this._timer = setTimeout(function(){ oThis.Fade(rColor); }, this.Speed); }
  }
};

//返回16进制数
function Hex(i) {
    if (i < 0) return "00";
    else if (i > 255) return "ff";
    else { var str = "0" + i.toString(16); return str.substring(str.length - 2); }
}

//仿asp的mid 截字
function Mid(string, start, length) {
    if (length) return string.substring(start, start + length);
    else return string.substring(start);
}
