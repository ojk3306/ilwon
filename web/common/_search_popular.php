<?php
include_once('./_common.php');
$stx = $_GET['stx'];
$sql = "select
			distinct(pp_word)
		from
			g5_popular
		where
			pp_word like '%".$stx."%'
		group by
			pp_word
		order by
			pp_word asc ";
$result = sql_query($sql,true);
// value : 검색된 단어이며, input 값으로 넘어갑니다.
// label : 특정검색어를 입력시 자동완성 리스트로 표시됩니다. (다양하게 응용가능)
while($row=sql_fetch_array($result)) {
	$arr[] = array(
				"value"	=> $row['pp_word'],
				"label"	=> $row['pp_word']
				);
}
echo json_encode($arr);
?>