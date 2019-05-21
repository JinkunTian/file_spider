################################################################
# @FileName:file_spider.py
# @Author:JinkunTian
# @Email:husky@tianjinkun.com
# @Description:By traversing folders and subfolders, 
#   the specified type of file information is inserted
#   into the database to achieve the function of creating 
#   a file structure index.
# @Date:2019-04-04
################################################################
import os
import time
import MySQLdb
#config the path you want to index
path = '/var/pub/MECCA/'

#Database config
#MySQL Only
MYSQL_HOST='your_db_ip'
MYSQL_USER='your_db_user'
MYSQL_PASS='your_db_password'
MYSQL_DB='your_db_name'

index_file_types=[]
all_files_count=0
all_dirs_count=0
inserted_files_count=0
inserted_dirs_count=0
time_start=time.time()
print "################################################################"
print "file_spirder created by JinkunTian"
print "This is a spider bot that index your files to MySQL Database"
print "Email:  husky@tianjinkun.com"
print "Blog:   http://blog.tianjinkun.com"
print "GitHub: https://github.com/JinkunTian"
print "----------------------------------------------------------------"

def exit_spider():
  print "################################################################"
  db.close()
  exit()
def print_with_time(strings):
  print "["+time.strftime('%Y-%m-%d %H:%M:%S',time.localtime(time.time()))+"]"+strings

print_with_time("Start to connect to database...")
try:
  db = MySQLdb.connect(MYSQL_HOST,MYSQL_USER,MYSQL_PASS,MYSQL_DB, charset='utf8' )
  cursor = db.cursor()
  print_with_time("Connect to database success!")
except:
  print_with_time("Error:Connect to database failed! exit!")
  exit_spider()

print_with_time("Start to fatch index file types..." )

sql = "SELECT `type` FROM `search_index_file_type` WHERE `en_index`=1"

try:
  cursor.execute(sql)
  results=cursor.fetchall()
  for row in results:
    index_file_types.append(row[0])
  print_with_time("Fatch index file types success!")
except:
  print_with_time("Error:unable to fatch data! exit!")
  exit_spider()

print_with_time("Start to searching files and creating index..." )

for (root, dirs, files) in os.walk(path):
  #skip the hidden files
  files = [f for f in files if not f[0] == '.']
  dirs[:] = [d for d in dirs if not d[0] == '.']
  for filename in files:
    file_type=os.path.splitext(filename)
    if file_type[1].lower() in index_file_types:
      all_files_count=all_files_count+1
      sql = "SELECT * FROM `search_file_info` WHERE `absolute_path`='"+os.path.join(root,filename)+"' limit 1"
      try:
        cursor.execute(sql)
        results=cursor.fetchall()
        if not results:
          sql = "INSERT INTO `search_file_info`(`absolute_path`, `web_path`,`web_full_path`, `name`, `classify`, `type`) VALUES ('"+os.path.join(root,filename)+"','"+os.path.join(root)[len(path):]+"','"+os.path.join(root,filename)[len(path):]+"','"+filename+"','file','"+file_type[1]+"')"
          try:
            cursor.execute(sql)
            db.commit()
            inserted_files_count=inserted_files_count+1
          except:
            db.rollback()
            print_with_time("Error:Insert file info to database failed!exit!")
            exit_spider()
      except:
        print_with_time("Error:Compare file info failed!exit!")
        exit_spider()
  for dirc in dirs:
    all_dirs_count=all_dirs_count+1
    sql = "SELECT * FROM `search_file_info` WHERE `absolute_path`='"+os.path.join(root,dirc)+"' limit 1"
    try:
      cursor.execute(sql)
      results=cursor.fetchall()
      if not results:
        sql = "INSERT INTO `search_file_info`(`absolute_path`, `web_path`, `web_full_path`, `name`, `classify`, `type`) VALUES ('"+os.path.join(root,dirc)+"','"+os.path.join(root,dirc)[len(path):]+"','"+os.path.join(root,dirc)[len(path):]+"','"+dirc+"','dir','dir')"
        try:
          cursor.execute(sql)
          db.commit()
          inserted_dirs_count=inserted_dirs_count+1
        except:
          db.rollback()
          print_with_time("Error:Insert dir info to database failed!exit!")
          exit_spider()
    except:
      print_with_time("Error:Compare dir info failed!exit!")
      exit_spider()
print_with_time("Indexing files success!")
print_with_time("Scaned "+bytes(all_dirs_count)+" Folders "+bytes(all_files_count)+ " Files")
print_with_time("New Insert "+bytes(inserted_dirs_count)+" Folders "+bytes(inserted_files_count)+" Files")
time_end=time.time()
print_with_time("Processed in "+bytes(time_end-time_start)+" seconds")
print_with_time("Indexing files success!")
exit_spider()