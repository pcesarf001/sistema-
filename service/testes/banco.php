<?php
    require_once '../function/autoloader.php';
    $conexao = new ManipulaBanco;
    // $data = array('nomePerfil'=>'Cliente');
    // $conexao->inserirRegistro('tbPerfil',$data);
    var_dump($conexao->selecionarRegistro('tbPerfil','nomePerfil'));
?>