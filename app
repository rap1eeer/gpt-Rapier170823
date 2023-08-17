#!/usr/bin/env python
# coding: utf-8

# In[3]:


import replicate


# In[2]:


pip install replicate


# In[4]:


import json,time,requests


# In[5]:


q=input("please describe the picture you want:")


# In[6]:


body = json.dumps(
    {"version": "db21e45d3f7023abc2a46ee38a23973f6dce16bb082a930b0c49861f96d1e5bf", "input": { "prompt": q } 
    }
)
headers = {'Authorization': 'Token r8_UVmbKtFW9THQK1jCAl1BxzoJTd47grp44ptHE','Content-Type': 'application/json'}
output = requests.post('https://api.replicate.com/v1/predictions',data=body,headers=headers)


# In[7]:


output


# In[8]:


time.sleep(10)
get_url = output.json()['urls']['get']
print(get_url)
get_result = requests.post(get_url,headers=headers).json()['output']
print(get_result)


# In[9]:


from PIL import Image
import requests
image = Image.open(requests.get(get_result[0], stream=True).raw)
image.show()


# In[ ]:




