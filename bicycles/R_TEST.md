tesuto

<!-- 【HTML】iframeタグの使い方 https://qiita.com/mzmz__02/items/c74a388c8ade33d7b4c0 -->
<!--
<iframe 
  id="innerframe"
  src="https://laws.e-gov.go.jp/law/335AC0000000105/20260401_506AC0000000034#Mp-Ch_3-Se_1-At_17"
  width="1280" height="720">
</iframe>

別の場所でonclickしたら、このiframeへパラメータ付きで渡すには？

<a href="#innerframe">16</a><br />
<a href="#innerframe">https://laws.e-gov.go.jp/law/335AC0000000105/20260401_506AC0000000034#Mp-Ch_3-Se_1-At_17</a><br />
<a href="#innerframe">https://laws.e-gov.go.jp/law/335AC0000000105/20260401_506AC0000000034#Mp-Ch_3-Se_1-At_18</a><br />
-->

textarea？？ JavaScript？

<input type="button" value="17" onclick="addText();">
<input type="button" value="18" onclick="addText();">
<input type="button" value="削除" onclick="deleteText();">
<br>
<textarea id="area1"></textarea>

<script>   
function addText(var n) {
  document.getElementById("area1").value = n;
}

function deleteText() {
  document.getElementById("area1").value="";
}
</script>   

てか、そもそもクリックしたら展開、、ってあるような？
ＪＳ？？
