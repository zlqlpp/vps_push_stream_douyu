from http.server import HTTPServer, BaseHTTPRequestHandler
import json
from urllib import parse
import os

data = {'result': 'this is a test'}
host = ('0.0.0.0', 8888)

class Resquest(BaseHTTPRequestHandler):
    def do_GET(self):
        rtmpcode = parse.unquote(self.path)[1:len(self.path)]
        print(rtmpcode)
        
        fo = open("rtmp_code", "w")
        fo.write( rtmpcode)
        # 关闭打开的文件
        fo.close()
        #print(os.system("/root/pushstream/push.sh " ))
        #print('------------------')
        self.send_response(200)
        self.send_header('Content-type', 'application/json')
        self.end_headers()
        self.wfile.write(json.dumps(data).encode())

if __name__ == '__main__':
    server = HTTPServer(host, Resquest)
    print("Starting server, listen at: %s:%s" % host)
    server.serve_forever()