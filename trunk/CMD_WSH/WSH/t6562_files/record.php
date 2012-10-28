function asRep_addEvent(obj,event,func,ecap){
 var oe=null;
 if(obj.addEventListener)obj.addEventListener(event,func,ecap?true:false);
 else if(obj.attachEvent)obj.attachEvent("on"+event,func);
 else eval("oe=obj.on"+event+";obj.on"+event+"=func;");
 return oe;
}
function asRep_InlineSend(jsok,url){
 this.obj=null;
 this.type=null;
 this.sendTime=0;
 this.loaded=false;
 if(jsok&&window.asRep_lateJS&&!this.obj){
  this.obj=document.createElement('script');
  this.obj.language="javascript";this.obj.type="text/javascript";
  document.getElementsByTagName('head')[0].appendChild(this.obj);
  this.type='s';
 }
 if(window.Image&&!this.obj){
  this.obj=new window.Image();
  this.type='i';
 }
 this.Send=function(url){
  this.loaded=false;
  this.sendTime=(new Date()).getTime();
  if(this.type=='i'){
   this.obj.src=url+"&transport=i";
  }else if(this.type=='s'){
   this.obj.src=url+"&transport=s";
  }
 }
 this.loadOK=function(ignoreimg){
  if(this.type=='i')return ignoreimg?false:this.obj.complete;
  return false; 
 }
 this.waitLoad=function(timeout,ignoreimg){
  if(this.sendTime)while(this.sendTime+timeout>(new Date()).getTime() && !this.loadOK(ignoreimg)){};
 }
 if(url)this.Send(url);
}
var asRep_RecViewTime=1216055335;
var asRep_RecId=86;
var asRep_adBoxes=new Array();
var asRep_sBoxes=new Array();
var asRep_adBoxLut=new Array();
var asRep_ViewData='';
var asRep_viewILS=new asRep_InlineSend(true);
var asRep_RoundTripDelay=(new Date()).getTime()-asRep_ViewTime;
if(asRep_RoundTripDelay>5000)asRep_RoundTripDelay=5000;
function asRep_gasAdBoxes(w,name){
 var a=new Array();
 if(w.document.all&&w.document.all(name)){
  var b=w.document.all(name);if(b.length)for(var i=0;i<b.length;i++)a[i]=b[i];else a[0]=b;
 }else
 if(w.document.getElementsByName && w.document.getElementsByName(name)){
  var b=w.document.getElementsByName(name);
  for(var i=0;i<b.length;i++)a[i]=b[i];
 }else
 if(w.document.getElementsByTagName && w.document.getElementsByTagName('iframe')){
  var f=w.document.getElementsByTagName('iframe');
  for(var i=0;i<f.length;i++)if(f[i].src&&f[i].src.substring(7,36)=="pagead2.googlesyndication.com")a[a.length]=f[i];
 }
 return a;
}
function asRep_gasAdBoxesAll(w,digdown){
 var a=asRep_gasAdBoxes(w,"google_ads_frame");
 for(var i=0;i<a.length;i++)a[i].ownerWindow=w;
 if(digdown && w.frames){
  for(var i=0;i<w.frames.length;i++){
   try{a=a.concat(asRep_gasAdBoxesAll(w.frames[i],digdown));}catch(e){};
  }
 }
 return a;
}
function asRep_gasSearchBoxes(w){
 var a=new Array();
 var forms=w.document.forms?w.document.forms:w.document.getElementsByTagName("form"); 
 for(var i=0;i<forms.length;i++)
  if(forms[i].action && forms[i].action.search && forms[i].action.search(/google\.[a-zA-Z0-9.]+\/custom$/)>-1 && forms[i].client)
   a[a.length]=forms[i];
 return a;
}
function asRep_gasSearchBoxesAll(w,digdown){
 var a=asRep_gasSearchBoxes(w);
 if(digdown && w.frames){
  for(var i=0;i<w.frames.length;i++){
   try{a=a.concat(asRep_gasSearchBoxesAll(w.frames[i],digdown));}catch(e){};
  }
 }
 return a;
}
function asRep_getClickCookie(w){
 var ca=w.document.cookie.split('; ');
 for(var j=0;j<ca.length;j++){
  var cakv=ca[j].split('=');
  if(cakv[0]=='asRep_click'){
   w.document.cookie="asRep_click=; path=/; expires="+(new Date(0)).toGMTString();
   return cakv[1];
  }
 }
 return '';
}
function asRep_altAd(adbox){
 var boxUrl='';
 try{boxUrl=adbox.contentDocument.location+'';}catch(e){boxUrl='';};
 if(!boxUrl)try{boxUrl=adbox.contentWindow.location+'';}catch(e){boxUrl='';};
 return boxUrl?1:0;
}
function asRep_repAltAds(){
 var anyalt=0;
 var data="rep=alt&tv="+asRep_RecViewTime+"&id="+asRep_RecId+"&asn="+asRep_adBoxes.length;
 for(var i=0;i<asRep_adBoxes.length;i++){
  if(asRep_adBoxLut[i]<3){
   var isalt=asRep_altAd(asRep_adBoxes[i]);
   data+="&aua"+i+"="+isalt;
   anyalt=anyalt||isalt;
  }
 }
 if(anyalt)new asRep_InlineSend(true,asRep_serverURL+"?"+data);
}
function asRep_repView(w){
 var data="&nav="+asRep_nav();
 data+="&p="+escape(eval("w.loc"+"ation"));
 data+="&asn="+asRep_adBoxes.length;
 var vasv=",channel,format,fb,color_bg,color_text,color_link,color_url,color_border,color_line,";
 var ii=0;
 for(var i=0;i<asRep_adBoxes.length;i++){
  if(asRep_adBoxes[i].src){
   var isalt=0;
   data+="&aua"+i+"="+isalt;
   var qmi=asRep_adBoxes[i].src.indexOf('?');
   if(qmi>=0){
    var asd=asRep_adBoxes[i].src.substring(qmi+1,asRep_adBoxes[i].src.length).split('&');
    for(var j=0;j<asd.length;j++){
     var askv=asd[j].split('=');
     if(vasv.indexOf(','+unescape(askv[0])+',')>=0){
	  data+='&'+askv[0]+i+'='+askv[1];
	  if(askv[0]=='format'){
	   if(askv[1].indexOf('0ads')>0)asRep_adBoxLut[i]=3;
	   else if(ii<3){asRep_adBoxLut[i]=ii++;}
	   else asRep_adBoxLut[i]=-1;
	  }	
	 }
    }
    data+="&fb"+i+"="+asRep_adBoxes[i].frameBorder;
   }
  }
 }
 data+="&wsn="+asRep_sBoxes.length ;
 for(var i=0;i<asRep_sBoxes.length;i++){
  if(asRep_sBoxes[i].channel)data+="&wsc"+i+"="+asRep_sBoxes[i].channel.value;
 }
 data+="&ref="+escape(eval("w.doc"+"ument"+".ref"+"errer"));
 asRep_ViewData=data;
 var cdata=asRep_getClickCookie(w);
 if(cdata.length)data+="&cdata="+cdata;
 data="rep=v&tv="+asRep_RecViewTime+"&id="+asRep_RecId+data;
 asRep_viewILS.Send(asRep_serverURL+"?"+data);
}
var asRep_repILS=new asRep_InlineSend(false);
var asRep_repILSWUnloadOld=null;
 
function asRep_repViaILS(url){
 asRep_repILS.Send(url);
}
function asRep_eRepILSWUnload(e){
 asRep_repILS.waitLoad(asRep_RoundTripDelay,1);
 if(asRep_repILSWUnloadOld)asRep_repILSWUnloadOld(e);
}

function asRep_repAction(ct,data,showpopup){
 var url=asRep_serverURL+"?"+data;
 asRep_repViaILS(url);
}
function asRep_repSBoxSubmit(st,q,web,sbno){
 var ts=Math.floor((st-asRep_ViewTime)/1000);
 if(ts==0)ts=1;
 var data="rep=s&tv="+asRep_RecViewTime+"&id="+asRep_RecId+"&ts="+ts+"&q="+escape(q)+"&web="+web+"&wsno="+sbno;
 asRep_repAction(st,data,1);
}
var asRep_SBoxSubmitOld=new Array();
function asRep_eSBoxSubmit(e,sbno){
 var q=asRep_sBoxes[sbno].q?asRep_sBoxes[sbno].q.value:'';
 var web=1;
 if(asRep_sBoxes[sbno].sitesearch)for(var i=0;i<asRep_sBoxes[sbno].sitesearch.length;++i)
  if(asRep_sBoxes[sbno].sitesearch[i].checked)web=asRep_sBoxes[sbno].sitesearch[i].value?0:1;
 asRep_repSBoxSubmit((new Date()).getTime(),q,web,sbno);
 if(asRep_SBoxSubmitOld[sbno])asRep_SBoxSubmitOld[sbno](e);
}
function asRep_prepSBoxTracking(){
 for(var i=0;i<asRep_sBoxes.length;i++)
  eval("asRep_SBoxSubmitOld[i]=asRep_addEvent(asRep_sBoxes[i],'submit',function(e){asRep_eSBoxSubmit(e,"+i+");});");
}
function asRep_repAdBoxClick(ct,st,adboxno,cver){
 var tc=Math.floor((ct-asRep_ViewTime)/1000);
 if(tc==0)tc=1;
 var data="rep=c&tv="+asRep_RecViewTime+"&id="+asRep_RecId+"&tc="+tc+"&st="+escape(st)+"&cau="+asRep_adBoxLut[adboxno]+"&cver="+cver;
 asRep_repAction(ct,data,cver);
}
var asRep_tAdBoxNo=-1;
var asRep_tAdBoxFocusNo=-1;
var asRep_tAdBoxFocusTime=0;
   
function asRep_eAdBoxMouseOver(adboxno){
 asRep_tAdBoxNo=adboxno;
}
var asRep_AdBoxWMouseMoveOld=new Array();
function asRep_eAdBoxWMouseMove(e,fi){
 asRep_tAdBoxNo=-1;
 if(asRep_AdBoxWMouseMoveOld[fi])asRep_AdBoxWMouseMoveOld[fi](e);
}
var asRep_AdBoxWFocusOld=new Array();
function asRep_eAdBoxWFocus(e,fi){
 asRep_tAdBoxFocusNo=-1;
 if(asRep_AdBoxWFocusOld[fi])asRep_AdBoxWFocusOld[fi](e);
}
var asRep_AdBoxWBlurOld=new Array();
function asRep_eAdBoxWBlur(e,fi){
 if(asRep_tAdBoxNo>=0){ 
  asRep_tAdBoxFocusNo=asRep_tAdBoxNo;
  asRep_tAdBoxFocusTime=(new Date()).getTime();
  asRep_repAdBoxClick(asRep_tAdBoxFocusTime,'Unknown (Gecko DOM Browser)',asRep_tAdBoxFocusNo,0);
 }else{
  asRep_tAdBoxFocusNo=-1;
 }
 if(asRep_AdBoxWBlurOld[fi])asRep_AdBoxWBlurOld[fi](e);
}

var asRep_AdBoxWUnloadOld=null;
function asRep_eAdBoxWUnload(e){
 var ct=(new Date()).getTime();
 if(asRep_tAdBoxFocusNo>=0&&(ct-asRep_tAdBoxFocusTime<9000))asRep_repAdBoxClick(ct,'Unknown (Gecko DOM Browser)',asRep_tAdBoxFocusNo,1);
 if(asRep_AdBoxWUnloadOld)asRep_AdBoxWUnloadOld(e);
}
function asRep_setWindEvents(w){
 eval("w.do"+"cument.loca"+"tion.hr"+"ef");

 var i0=asRep_AdBoxWMouseMoveOld.length;
 asRep_AdBoxWMouseMoveOld[i0]=asRep_addEvent(w.document,'mousemove',function(e){asRep_eAdBoxWMouseMove(e,i0);});
 var i1=asRep_AdBoxWFocusOld.length;
 asRep_AdBoxWFocusOld[i1]=asRep_addEvent(w,'focus',function(e){asRep_eAdBoxWFocus(e,i1);});
 var i2=asRep_AdBoxWBlurOld.length;
 asRep_AdBoxWBlurOld[i2]=asRep_addEvent(w,'blur',function(e){asRep_eAdBoxWBlur(e,i2);});

 if(w.frames){
  for(var i=0;i<w.frames.length;i++){
   try{asRep_setWindEvents(w.frames[i]);}catch(e){};
  }
 }
}
function asRep_prepAdBoxTracking(w){
 for(var i=0;i<asRep_adBoxes.length;i++)
  eval("asRep_addEvent(asRep_adBoxes[i],'mouseover',function(e){asRep_eAdBoxMouseOver("+i+")});");
 if (asRep_adBoxes.length){
  asRep_AdBoxWUnloadOld=asRep_addEvent(w,'unload',asRep_eAdBoxWUnload,true);
  asRep_setWindEvents(w);
 }
}

function asRep_prepClickTracking(w){
 if (asRep_adBoxes.length || asRep_sBoxes.length)asRep_repILSWUnloadOld=asRep_addEvent(w,'unload',asRep_eRepILSWUnload,false);
 asRep_prepSBoxTracking();
 asRep_prepAdBoxTracking(w);
}
function asRep_prepTracking(){
 asRep_adBoxes=asRep_gasAdBoxesAll(asRep_workWind,0);
 asRep_sBoxes=asRep_gasSearchBoxesAll(asRep_workWind,0);
 asRep_repView(asRep_workWind);
 asRep_prepClickTracking(asRep_workWind);
}
asRep_prepTracking();
var asRep_WOnloadOld=null;
asRep_WOnloadOld=asRep_addEvent(asRep_workWind,'load',function(e){asRep_repAltAds();if(asRep_WOnloadOld)asRep_WOnloadOld(e);});
