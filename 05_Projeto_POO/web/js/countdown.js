var g_iCount = new Number();

// de 30 a 0 //
var g_iCount = 60;

function startCountdown(){
       if((g_iCount - 1) >= 0){
               g_iCount = g_iCount - 1;
               numberCountdown.innerText = '0' + g_iCount;
               setTimeout('startCountdown()',1000);
       }
}
