a = list(map(int,input("\nVe Goc : ").strip().split()))[:5]
b = list(map(int,input("\nVe Ban : ").strip().split()))[:5]
c=(b[0]-a[0])*9
d=(b[1]-a[1])*20
e=(b[2]-a[2])*25
f=(b[3]-a[3])*29
g=(b[4]-a[4])*35
sum=c+d+e+f+g
print ("ve 9k : " , c,"k")
print ("ve 20k : " , d,"k")
print ("ve 25k : " , e,"k")
print ("ve 29k : " , f,"k")
print ("ve 35k : " , g,"k")
print ("tong tien" , sum ,"k")
