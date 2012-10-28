    



















spitHere();
gITXTNIdx=0;gITXTNiIdx=0;

function rKWL2(m)
{
  if((ppp&&(gITXTNIdx>=gK.length))||(!ppp&&(gITXTNIdx>=gITXTN.length)))
  {
rKWL2i(50);

  }
  else
  {
    var tnow = (new Date()).getTime();
    if(ppp)
    {
      while((gITXTNIdx< gK.length)&&((new Date()).getTime()-tnow< m))
      {
        aKW = fHp( aKW, gK[gITXTNIdx], gCS[gITXTNIdx], gITXTN );
        gITXTNIdx++;
      }
    }
    else
    {
      while((gITXTNIdx< gITXTN.length)&&((new Date()).getTime()-tnow< m))
      {
        if((gOHk.length == 0)||(binarySearch(gOHk,gITXTNIdx+1)>=0))
            
        aKW=fH(aKW,gITXTNIdx,gK,gCS,gITXTN[gITXTNIdx],mk);
            
        gITXTNIdx++;
      }
    }
    window.setTimeout('rKWL2(50);', 50);
  }
}

function rKWL2i(m)
{
  if(gITXTNiIdx>=gITXTNi.length)
  {
itxtprep();
hIT(aAD,aKW,gSI||gIESI,aADi,aKWi);
var ndbET=new Date().getTime();

  }
  else
  {
    var tnow = (new Date()).getTime();
    while((gITXTNiIdx< gITXTNi.length)&&((new Date()).getTime()-tnow< m))
    {
    aKWi=fH(aKWi,gITXTNiIdx,gKi,gCSi,gITXTNi[gITXTNiIdx],mi);
    gITXTNiIdx++;
    }
    window.setTimeout('rKWL2i(50);', 50);
  }
}
rKWL2(250);


