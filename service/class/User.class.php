<?php
    class User extends ManipulaBanco{
        private $user, $password;
        function setUser($user){
            if(filter_var($user, FILTER_VALIDATE_EMAIL)){
                $this->user = $user;
            }else{
                return array('code'=>1,'msg'=>'O email fornecido não é valido.','status'=>false);
            }
        }
        function getUser(){
            return $this->user;
        }
        function setPassword($password){
            if(strlen($password)>=8){
                $this->password = $password;
            }else{
                return array('code'=>2,'msg'=>'A senha fornecida não está em um formato valido','status'=>false);
            }
        }
        function getPassword(){
            return $this->password;
        }
        function auth(){
            if(($this->user != "" || $this->user != null) && ($this->password != "" || $this->password != null)){
                $conexao = new ManipulaBanco;
                $dataUser = $conexao->selecionarRegistro('tbUsuario',
                "emailUsuario as email, statusUsuario, md5(idUsuario) as codeUser",
                "WHERE emailUsuario = '{$this->getUser()}' AND senhaUsuario = '{$this->getPassword()}'",
                "ORDER BY emailUsuario",
                "LIMIT 1");
                if($dataUser){
                    return $dataUser;
                }else{
                    return array('code'=>4,'msg'=>'usuario ou senha invalidos','status'=>false);
                }
            }else{
                return array('code'=>3,'msg'=>'Informações fornecidas invalidas','status'=>false);
            }
        }
    }
?>