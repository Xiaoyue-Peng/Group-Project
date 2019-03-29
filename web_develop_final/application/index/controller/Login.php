<?php
namespace app\index\controller;

use think\controller;
use think\Db;
use think\request;
use think\validate;

class Login extends Controller
{
	public function index(){
		return view('login');	
	}
	public function post(Request $request){
		$post=$request->param();
		if ($post){
			$user = Db::table('usr_tb')
			->where('usrname',$post['username'])
			->where('passwd',md5($post['password']))
			->find();
			if ($user){
				session('uid',$user['usr_id']);
				session('username',$user['usrname']);
				//dump(session('username'));
				return $this->redirect('./index');
			}else{
				return $this->error('failed,wrong username or password');
			}
		}

	}
	public function logout(){
		session('username',null);
		return $this->redirect('./login');
		}  
}