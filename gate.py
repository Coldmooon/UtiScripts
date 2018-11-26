#!/usr/bin/python
# -*- coding:utf-8 -*-

"""
北邮人网关登录脚本：
使用方法：
登录：python loginBuptGw.py i
退出：python loginBuptGw.py o
"""

import urllib2
import urllib
import cookielib
import hashlib
import os
import re
import sys
reload(sys)
sys.setdefaultencoding('utf8')

uname = 2012010196    #请正确填写学号
upass = 'lengyue312'  #请正确填写密码

def safe_md5(temp_pass):
	tempchar = '1' + temp_pass + '12345678'
	#print tempchar
	upass = hashlib.md5(tempchar).hexdigest() + '123456781'
	return upass

def login(u_pass):
	postdata = {
		'DDDDD': uname,
		'upass': u_pass,
		'R1': 0,
		'R2': 1,
		'para': 00,
		'0MKKey': 123456
		}
	url_login = 'http://10.3.8.211'
	cj = cookielib.CookieJar()
	opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj))
	urllib2.install_opener(opener)
	opener.add_handler = [('User-agent','Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.36 (KHTML, like Gecko) Ubuntu Chromium/32.0.1700.107 Chrome/32.0.1700.107 Safari/537.36')]
	en_url = urllib.urlencode(postdata)
	r_login = urllib2.urlopen(url_login,en_url)
	return r_login.read()

def check_success(u_data):
	re_check = re.compile(r'<title>登录成功窗</title>')
	if re_check.search(u_data):
		print '登录成功'
	else:
		print '登录失败'

def quit():
	quit_url = 'http://10.3.8.211/F.htm'
	urllib2.urlopen(quit_url)
	print '退出成功'

def usage():
	print "请正确选择登录、退出方式："
	print "登录：python loginBuptGw.py i "
	print "退出：python loginBuptGw.py o "

if __name__ == '__main__':
	if len(sys.argv) < 2 or len(sys.argv) >= 3:
		usage()
	else:
		if sys.argv[1] == "i":
			u_pass =  safe_md5(upass)
			u_data = login(u_pass).decode('gbk','ignore').encode('utf-8')
			#print u_data
			check_success(u_data)
		elif sys.argv[1] == "o":
			quit()
		else:
			usage()



