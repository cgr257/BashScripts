#!/bin/python

import os,datetime, argparse

def main():
  #parse command line options
  parser = argparse.ArgumentParser()
  parser.add_argument("-d", "--userdate", help="enter date for show to download in the form YearMonthDay (e.g. 20170322)", dest="udate", action="store")
  args = parser.parse_args()

  if args.udate:
    print(args.udate)
    cyear = args.udate[0:4]
    cmonth = args.udate[4:6]
    cday = args.udate[6:8]
  else:
    now = datetime.datetime.now()
    cyear = now.strftime("%Y")
    cmonth = now.strftime("%m")
    cday = now.strftime("%d")

  #download show
  command=str("cd ~/DN/ && wget http://hot.dvlabs.com/democracynow/360/dn{}-{}{}.mp4".format(cyear,cmonth,cday))
  os.system(command)
  #print(command) 

if __name__ == '__main__':
  main()
