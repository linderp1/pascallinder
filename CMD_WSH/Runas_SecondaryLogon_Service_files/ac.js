
var acOldValue,acNewValue,actimer,acStatsDotNet,acQueryBox,acListDiv,acNode,acResizerImg,acResizerImgRtl,acIframeHack,acLcid;var acNoVal="";var acReservedKeys=[13,38,40];var acMinWidth=150;var acStartChar=4;var achead=document.getElementsByTagName('head').item(0);var acBaseUrl='http://autocomplete.support.microsoft.com';


var ACDoShowTarget=function(){acListDiv.style.display="block";};var ACDoHideTarget=function(){acListDiv.style.display="none";};var ACResizer=function(){addACResizer();};var ACMoveResize=function(e){ACDoMoveResize(e);};


var saf=navigator.userAgent.indexOf('AppleWebKit');var clrwin=(saf==-1)? 'Window' : '#FFF';var clrwintxt=(saf==-1)? 'WindowText' : '#000';var clrhigh=(saf==-1)? 'Highlight' : '#CCC';var clrhightxt=(saf==-1)? 'HighlightText' : '#000';

function ACGetSuggestions(){var temp=document.getElementById('acScript');if(temp){achead.removeChild(temp);}var script=document.createElement('SCRIPT');script.id='acScript';script.setAttribute("type","text/javascript");script.src=acBaseUrl+'/ACSearchSuggest.aspx?lcid='+acLcid+'&query='+encodeURIComponent(acOldValue);achead.appendChild(script);}





function CreateAC(options){var q,o=options;if(!o){return false;}if(typeof(o.id)==='string'){q=document.getElementById(o.id);}else if(typeof(o.id)==='object'&&o.id.nodeName=='INPUT'){q=o.id;}else{return false;}

 
 if(typeof(acLcid)=='undefined'){if(!o.lcid||typeof(o.lcid)!=='string'){acLcid='1033';}else{acLcid=o.lcid;}}if(o.acURL&&typeof(o.acURL)==='string'){acBaseUrl=unescape(o.acURL);}if(o.statsObj&&typeof(o.statsObj)==='object'){acStatsDotNet=o.statsObj;}if(o.startChar&&(typeof(o.startChar)==='string'||typeof(o.startChar)==='number')){try{acStartChar=parseInt(o.startChar,10);}catch(ex){acStartChar=4;}if(acStartChar<2)acStartChar=2;if(acStartChar>8)acStartChar=8;}if(q){var parentEl=q.parentNode;if(q.offsetWidth<acMinWidth){acMinWidth=q.offsetWidth;}q.setAttribute('autocomplete','off');q.style.display='block';q.initialValue=(o.initialValue!='undefined')? unescape(o.initialValue): 'Search';
 var a=document.createElement('DIV');var as=a.style;a.id='acListDiv';as.margin=as.padding='0px';as.marginTop='-2px';as.display='none';as.zIndex='99';as.position='absolute';as.width=(q.offsetWidth&&q.offsetWidth>acMinWidth)?(q.offsetWidth)+'px' : acMinWidth+'px';as.borderTop=as.borderBottom='1px solid #999';as.overflow='hidden';if(ACComputedStyle(q,'position')==='absolute'||ACComputedStyle(q,'position')==='relative'){as.left=q.offsetLeft+'px';as.top=q.offsetTop+q.offsetHeight+'px';}a.parentInput=q;
 var r=document.createElement("img");r.parentDiv=acListDiv;r.id="acResizer";r.src=acBaseUrl+'/images/resize-right.gif';ACAddEvt(r,"mousedown",ACInitResize);as=r.style;as.position='absolute';as.right='0px';as.bottom='0px';as.height=as.width='12px';as.cursor='w-resize';as.backgroundColor="transparent";acResizerImg=r;acResizerImgRtl=r.cloneNode(true);acResizerImgRtl.src=acBaseUrl+'/images/resize-left.gif';acResizerImgRtl.style.right='auto';acResizerImgRtl.style.bottom='1px';acResizerImgRtl.style.left='1px';ACAddEvt(acResizerImgRtl,"mousedown",ACInitResize);
 if(navigator.userAgent.indexOf('MSIE')>0){if(parseInt((navigator.userAgent.charAt(navigator.userAgent.indexOf('MSIE')+5)),10)<7){ACMakeIframeHack(q.parentNode,a);}}q.parentNode.appendChild(a);
acNode=document.createElement("div");as=acNode.style;acNode.className="acSugDiv";acNode.parentInput=q;as.whiteSpace="nowrap";as.overflow="hidden";as.fontSize=ACComputedStyle(q,"fontSize");as.fontFamily=ACComputedStyle(q,"fontFamily");as.backgroundColor=clrwin;as.color=clrwintxt;as.cursor='hand';as.borderRight=as.borderLeft='1px solid #999';

 if(!q.value||q.value.length===0){var dtxt=document.createElement('span');dtxt.id='acInitialText';dtxt.style.color='#888';dtxt.style.fontSize='10pt';dtxt.style.fontSize=ACComputedStyle(q,"fontSize");dtxt.style.fontFamily=as.fontFamily;dtxt.style.fontFamily=ACComputedStyle(q,"fontFamily");var qbwid=ACComputedStyle(q,"borderWidth");if(!qbwid){qbwid='2px';}dtxt.style.margin=qbwid;var qbhigh=ACComputedStyle(q,"height");if(!qbhigh){qbhigh='1em';}dtxt.style.height=qbhigh;dtxt.style['line-height']=qbhigh;dtxt.style.paddingLeft=dtxt.style.paddingRight='.2em';dtxt.style.position='absolute';dtxt.innerHTML=q.initialValue;parentEl.insertBefore(dtxt,q);ACAddEvt(dtxt,"mousedown",ACRemoveInstruction);ACAddEvt(dtxt,"keydown",ACRemoveInstruction);ACAddEvt(dtxt,"focus",ACQueryFocus);ACAddEvt(dtxt,"drop",ACRemoveInstruction);ACAddEvt(q,"mousedown",ACRemoveInstruction);ACAddEvt(q,"keydown",ACRemoveInstruction);ACAddEvt(q,"drop",ACRemoveInstruction);}
 ACAddEvt(q,"keyup",ACInitSuggestions);ACAddEvt(q,"keydown",ACHandleKeysDown);
 
 if(document.all){ACAddEvt(q,"resize",ACDoPlaceList);}else {ACAddEvt(window,"resize",ACDoPlaceList);}ACAddEvt(document,"mouseup",ACClickHandler);
 acListDiv=a;acQueryBox=q;
 if(q.createTextRange&&!document.location.hash){var range=q.createTextRange();range.move('character',q.value.length);range.select();}}}var ACDoPlaceList=function(el){ACPlaceList(el);};function ACPlaceList(el){acListDiv.style.width=(acQueryBox.offsetWidth&&acQueryBox.offsetWidth>acMinWidth)?(acQueryBox.offsetWidth)+'px' : acMinWidth+'px';if(ACComputedStyle(acQueryBox,'position')==='absolute'||ACComputedStyle(acQueryBox,'position')==='relative'){acListDiv.style.left=acQueryBox.offsetLeft+'px';acListDiv.style.top=acQueryBox.offsetTop+acQueryBox.offsetHeight+'px';}}function ACQueryFocus(){acQueryBox.focus();}function ACSetLcid(newLcid){acLcid=newLcid;}function ACChangeCharStart(chars){acStartChar=chars;}function ACIsChild(child,parent){if(!child||!parent){return false;}var pe=child.parentNode;if(parent==pe){return true;}if(!pe){return false;}return ACIsChild(pe,parent);}
function ACClickHandler(e){var el=ACSrcEl(e);var ic=ACIsChild(el,acListDiv);if(el===acQueryBox)return false;if(!ic){ACHideTarget();return false;}var returnValue=true;if(acListDiv){var q=acQueryBox;var n=acListDiv.childNodes[q.selectedIndex];if(ic&&n){if(n.innerText)q.value=n.innerText;else if(n.textContent)q.value=n.textContent;else q.value=n.innerHTML;q.focus();ACSelectText(e);acOldValue=q.value;if(acStatsDotNet){acStatsDotNet.eventCollectionId=SetLogCollectionBit(acStatsDotNet.eventCollectionId,41);}returnValue=false;}if(acListDiv&&ic)ACHideTarget();}return returnValue;}
function ACGetKeyCode(e){if(e.keyCode){return e.keyCode;}if(e.charCode){return e.charCode;}return null;}
function ACInitSuggestions(e){for(var i=0;i<acReservedKeys.length;i++){if(ACGetKeyCode(e)==acReservedKeys[i]){return;}}var q=acQueryBox;if(ACGetKeyCode(q)==9){ACClickHandler(q);}q.selectedIndex=-1;ACHighlight();acNewValue=(q.value)? q.value.removeSpaces().toLowerCase(): "";if(acNoVal!=""){if(acNoVal==acNewValue.substring(0,acNoVal.length)){return;}else{acNoVal=""}}if(acOldValue!=acNewValue&&acNewValue.length>=acStartChar){if(actimer){clearTimeout(actimer);}acOldValue=acNewValue;actimer=setTimeout(ACGetSuggestions,100);}else if(acNewValue.length<acStartChar){ACHideTarget();acOldValue=acNewValue;}}function ACErrorSuggestions(query,error){
 return;}
function ACOutputSuggestions(query,output){try{if(output==""){acNoVal=query;ACHideTarget();return;}else{acNoVal="";}if(acStatsDotNet){
 acStatsDotNet.eventCollectionId=SetLogCollectionBit(acStatsDotNet.eventCollectionId,40);
 acStatsDotNet.flexId=11;acStatsDotNet.flexValue1=query.substr(0,256);}var sg=[];sg=output.sort(ACSugCompare);if(sg.length===0){ACHideTarget();return;}acListDiv.innerHTML="";for(var i=0;i<sg.length;i++){var d0=acNode.cloneNode(true);var dtxt=document.createTextNode(sg[i]);d0.appendChild(dtxt);ACAddEvt(d0,"mouseover",acMouseHighlight);acListDiv.appendChild(d0);}ACDoShowTarget();ACResizer();}catch(ex){ACHideTarget();}}
function addACResizer(){var dir=ACComputedStyle(acQueryBox,"direction");if(dir!='rtl')acListDiv.appendChild(acResizerImg);else acListDiv.appendChild(acResizerImgRtl);}
function ACSugCompare(a,b){return a.length - b.length;}
function ACAddEvt(el,op,fnc){if(el.attachEvent){el.attachEvent("on"+op,fnc);}else{el.addEventListener(op,fnc,true);}}
function ACKillEvt(el,op,fnc){if(el.detachEvent){el.detachEvent("on"+op,fnc);}
else{el.removeEventListener(op,fnc,true);}}
function ACSrcEl(e){if(e){if(e.srcElement){return e.srcElement;}
if(e.target){return e.target;}}return e;}
function ACHandleKeysDown(e){var k=ACGetKeyCode(e);var q=ACSrcEl(e);
if(acListDiv&&acListDiv.style&&acListDiv.style.display!="none"){var max=acListDiv.childNodes.length;var si=q.selectedIndex;var n=acListDiv.childNodes;if(k==40){if(si<max-2){q.selectedIndex++;}else if(si>=max-2){q.selectedIndex=-1;}si=q.selectedIndex;ACHighlight();if(q.selectedIndex<0){q.value=acOldValue;}else{if(n[si].innerText)q.value=n[si].innerText;else if(n[si].textContent)q.value=n[si].textContent;else q.value=n[si].innerHTML;}ACSelectText(e);e.returnValue=false;return false;}else if(k==38){if(si>=0){q.selectedIndex--;}else if(si==-1){q.selectedIndex=max-2;}si=q.selectedIndex;ACHighlight();if(q.selectedIndex==-1){q.value=acOldValue;}else{if(n[si].innerText)q.value=n[si].innerText;else if(n[si].textContent)q.value=n[si].textContent;else q.value=n[si].innerHTML;}ACSelectText(e);e.returnValue=false;return false;}else if(k==13){e.returnValue=ACClickHandler(n[si]);ACStopDefault(e);return e.returnValue;}else if(k==27){ACHideTarget();q.value=acOldValue;q.focus();ACSelectText(e);e.returnValue=false;return false;}else if(k==9){ACClickHandler(e);}}else{if(k==27){q.value='';q.focus();ACSelectText(e);e.returnValue=false;return false;}}}

function ACSelectText(event){if(!acOldValue)return;if(acQueryBox.createTextRange){var textRange=acQueryBox.createTextRange();textRange.moveStart("character",acOldValue.length);textRange.select();}else if(acQueryBox.setSelectionRange){acQueryBox.focus();acQueryBox.setSelectionRange(acOldValue.length,acQueryBox.value.length);}ACStopDefault(event);}function acMouseHighlight(e){var el=ACSrcEl(e);var sibs=el.parentNode.childNodes;for(var i=0;i<sibs.length;i++){if(sibs[i]==el){acQueryBox.selectedIndex=i;}}ACHighlight();}function ACHighlight(){var sibs=acListDiv.childNodes;for(var i=0;i<sibs.length;i++){if(sibs[i].className=="acSugDiv"){if(i!=acQueryBox.selectedIndex){sibs[i].style.backgroundColor=clrwin;sibs[i].style.color=clrwintxt;}else{sibs[i].style.backgroundColor=clrhigh;sibs[i].style.color=clrhightxt;}}}}
var acRstrt,acLstrt;function ACInitResize(event){acLstrt=ACAbsPos(acListDiv).left;acRstrt=acLstrt+acListDiv.offsetWidth;
 ACAddEvt(document,"mousemove",ACMoveResize);ACAddEvt(document,"mouseup",ACKillResize);
 ACKillEvt(document,"mouseup",ACClickHandler);
 ACStopDefault(event);}function ACDoMoveResize(event){
 var x=(window.event)? window.event.clientX+document.documentElement.scrollLeft+document.body.scrollLeft : event.clientX+window.scrollX;if(!window.event){if(x+10>=document.body.clientWidth||x<1){ACKillEvt(document,"mousemove",ACMoveResize);return;}}var dir=ACComputedStyle(acQueryBox,"direction");if(dir=='rtl'){var xx=(window.event)? 16 : 0;if((acRstrt - x+xx)>acMinWidth){acListDiv.style.width=(acRstrt - x+xx)+'px';}}else{if((x - acLstrt)>acMinWidth){acListDiv.style.width=(x - acLstrt)+'px';}}
 ACStopDefault(event);}
function ACKillResize(event){
 ACKillEvt(document,"mousemove",ACMoveResize);ACKillEvt(document,"mouseup",ACKillResize);
 ACAddEvt(document,"mouseup",ACClickHandler);acQueryBox.focus();}
function ACStopDefault(event){if(window.event){window.event.cancelBubble=true;window.event.returnValue=false;}else{if(event.preventDefault)event.preventDefault();}}function ACHideTarget(){if(acListDiv){ACDoHideTarget();acQueryBox.selectedIndex=-1;}}function ACRemoveInstruction(e){e=document.getElementById('acInitialText');if(e){e.parentNode.removeChild(e);}}
function ACComputedStyle(el,style){var returnVal="";if(document.defaultView&&document.defaultView.getComputedStyle){returnVal=document.defaultView.getComputedStyle(el,null)[style];}else if(el.currentStyle){style=style.replace(/-(w)/g,function(strMatch,p1){return p1.toUpperCase();});returnVal=el.currentStyle[style];}return returnVal;}
function ACAbsPos(obj){var x=y=0;if(obj){x=obj.offsetLeft;y=obj.offsetTop;while(obj=obj.offsetParent){x+=obj.offsetLeft;y+=obj.offsetTop;}}return{left:x,top:y};}
var dbcsSpaceRE=new RegExp(String.fromCharCode(12288),"g");String.prototype.removeSpaces=function(){var temp=this.replace(dbcsSpaceRE,' ');temp=temp.replace(/^\s+|\s+$/g,'');return temp.replace(/\s\s+/g,' ');};


function ACMakeIframeHack(parent,a){if(!acIframeHack){acIframeHack=document.createElement('IFRAME');var i=acIframeHack.style;var as=a.style;i.marginTop=as.marginTop;i.left=as.left;i.top=as.top;i.display=as.display;i.width=(parseInt(as.width,10)+2)+'px';i.position=as.position;acIframeHack.style['filter']='progid:DXImageTransform.Microsoft.Alpha(style=0,opacity=0)';acIframeHack.src="";parent.appendChild(acIframeHack);ACDoShowTarget=function(){as.display=i.display='block';};ACDoHideTarget=function(){as.display=i.display='none';};ACResizer=function(){addACResizer();var x=parseInt(a.offsetHeight,10);i.height=(x<=0)? '192px' : x+'px';i.width=parseInt(a.offsetWidth,10)+'px';};ACMoveResize=function(event){ACDoMoveResize(event);i.width=(parseInt(a.offsetWidth,10)+2)+'px';};ACDoPlaceList=function(el){ACPlaceList(el);ACPlaceList(acIframeHack);};ACAddEvt(document,"mouseup",ACResizer);}}