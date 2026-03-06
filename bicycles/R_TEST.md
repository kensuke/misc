tesuto

#### 【HTML】iframeタグの使い方
https://qiita.com/mzmz__02/items/c74a388c8ade33d7b4c0
<!--
<iframe 
  id="innerframe"
  src="https://laws.e-gov.go.jp/law/335AC0000000105/20260401_506AC0000000034#Mp-Ch_3-Se_1-At_17"
  width="1280" height="720">
</iframe>
-->

<iframe 
  id="innerframe"
  src=""
  width="640" height="480">
</iframe>

別の場所でonclickしたら、このiframeへパラメータ付きで渡すには？

<a href="#innerframe">16</a><br />
<a href="#innerframe">https://laws.e-gov.go.jp/law/335AC0000000105/20260401_506AC0000000034#Mp-Ch_3-Se_1-At_17</a><br />
<a href="#innerframe">https://laws.e-gov.go.jp/law/335AC0000000105/20260401_506AC0000000034#Mp-Ch_3-Se_1-At_18</a><br />


#### javascriptにおけるテキストエリアへの追加と削除
https://qiita.com/yuya-yuya/items/e5587898121b0aeee673

textarea？？ JavaScript？

<input type="button" value="17" onclick="addText();">
<input type="button" value="18" onclick="addText();">
<input type="button" value="削除" onclick="deleteText();">
<br>
<textarea id="area1"></textarea>

<script>
function addText() {
  document.getElementById("area1").value = "a";
}

function deleteText() {
  document.getElementById("area1").value="";
}
</script>


#### クリックすると展開表示する"折りたたみメニュー"を簡単に作る方法
https://fukafuka295.jp/oritatami-menu-setti/

てか、そもそもクリックしたら展開、、ってあるような？
ＪＳ？？

<div onclick="obj=document.getElementById('open').style; obj.display=(obj.display=='none')?'block':'none';">
<a style="cursor:pointer;">▼ クリックで展開</a>
</div>

<div id="open" style="display:none;clear:both;">
あ
</div>


<div onclick="obj=document.getElementById('open2').style; obj.display=(obj.display=='none')?'block':'none';">
<a style="cursor:pointer;">▼ クリックで展開</a>
</div>

<div id="open2" style="display:none;clear:both;">
い
</div>



