<?php
namespace app\index\controller;

use think\controller;
use think\Db;
use think\request;
use think\validate;

class Password extends Controller
{
	public function index(){
		return view('password');	
	}
	public function reset(Request $request){
		$post=$request->param();
		$password = Db::table('usr_tb')
			->where('usrname',session('username'))
			->where('passwd',md5($post['past_password']))
			->find();
			if($password){
				$validate = validate::make([
					'password'=>'require|min:6|max:20|confirm'
					]);
				$status = $validate->check($post);
				
				if ($status){
					$user = Db::table('usr_tb')
						->where('usrname',session('username'))
						->update([
							'passwd'=>md5($post['password']),
						]);

			return $this->redirect('./index');

			}else{
				return $this->error('past_password wrong');
			}
		}
	}

}