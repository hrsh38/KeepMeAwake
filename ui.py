import http.client, urllib.request, urllib.parse, urllib.error, base64,json,webbrowser,matlab.engine,os

while True:
    headers = {
        # Request headers
        'Content-Type': 'application/json',
        'Ocp-Apim-Subscription-Key': '734fc3af815a4e6a9b5384ef32768c0e',
    }

    params = urllib.parse.urlencode({
    })

    while True:
        try:
            conn = http.client.HTTPSConnection('api.projectoxford.ai')
            url = input('Enter your url: ')
            #conn.request("POST", "/emotion/v1.0/recognize?%s" % params, "{\"url\":\"http://www.littlebeetkids.com/wp-content/uploads/2012/12/sleeping.jpg\"}", headers)
            conn.request("POST", "/emotion/v1.0/recognize?%s" % params, "{\"url\":\""+url+"\"}", headers)
            response = conn.getresponse()
            data = response.read()
            #print(data)
            s = data.decode("utf-8") 
            s.replace("'b","")
            small = (s[s.find("scores"):])  
            #print()
            l = small.split(',')
            l[-1] = l[-1][:l[-1].find("}")]

            nums = []

            for i in l:
                #print(i[i.rfind(":")+1:])
                nums.append(float(i[i.rfind(":")+1:]))

            #print(nums)
            conn.close()
        except Exception as e:
            print("[Errno {0}] {1}".format(e.errno, e.strerror))


        eng = matlab.engine.start_matlab()
        array = matlab.double(nums)
        tf = eng.test2(array)
        print(tf)
        #if(tf > .8):
        f = open('helloworld.html','w')
        if(tf>.80):
            message = """<html>
            <head></head>
            <body><p>The person is most likely SLEEPING</p></body>
            </html>"""
        else:
            message = """<html>
            <head></head>
            <body><p>The person is awake</p></body>
            </html>"""
        print((tf*100))



        f.write(message)
        f.close()  

        eng.quit()