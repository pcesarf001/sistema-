<?php
    require_once '../function/autoloader.php';
    $conexao = new ManipulaBanco;
    // for ($i = 1; $i <=2; $i++){
    //    echo "<i>[".$i."]</i>";
    //    if ($i == 1){
    //        $data = array('nomePerfil'=>'Anezio');
    //        $conexao->inserirRegistro('tbPerfil',$data)
    //    }
    //    else {
    //        $data = array('nomePerfil'=>'PC');
    //        $conexao->inserirRegistro('tbPerfil',$data);
    //    }
    //}/ 
    // $conexao->inserirRegistro('tbPerfil',$data);
     var_dump($conexao->selecionarRegistro('tbPerfil','nomePerfil','admin'));
?>