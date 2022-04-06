# ET Process Overview


## Buckets

- ws-in -- all of our inputs - soils; climate/temperature; NDVI(MODIS) etc
- ws-out -- primary use is for chip outputs for 



## Compute

### Ec2
- Amazon Linux - RedHat derivative
- t3a-2xlarge -- personal pangeo
- memory optimized


```
(tendollar) [ec2-user@ip-10-12-68-5 ~]$ costs
costs all things are relative
['awsprice.py', 'butzer']
butzer
      state                                    name            ip       i_type  monthly_cost
0   running                 butzer-ws-bigship-intel  10.12.68.185   m5.4xlarge       560.640
1   stopped  butzer-ws-mini-pangeo-persistent-vtest   10.12.68.63  t3a.2xlarge       219.584
2   running                  butzer-ws-olena-pangeo   10.12.69.13  t3a.2xlarge       219.584
3   stopped       butzer-ws-ss-conus2-intel-bigship  10.12.67.237   m5.4xlarge       560.640
4   running                    butzer-ws1-tendollar    10.12.68.5     t2.small        16.790
5   stopped                 butzer-ws-steffi-pangeo   10.12.69.15   t3a.xlarge       109.792
6   stopped                 butzer-ws-joshua-pangeo  10.12.68.101  t3a.2xlarge       219.584
7   running                   butzer-ws-cole-pangeo  10.12.69.251  t3a.2xlarge       219.584
8   stopped             butzer-ws-ss-conus-hugeship  10.12.68.238   m5.8xlarge      1121.280
9   stopped                   butzer-ws-ss-conus-h3   10.12.68.73  m5.16xlarge      2242.560
10  stopped                   butzer-ws-ss-conus-h4   10.12.69.85  m5.16xlarge      2242.560
11  stopped              butzer-ws-ss-conus-bigship   10.12.69.56   m5.8xlarge      1121.280
12  stopped            butzer-ws-ss-conus-hugeship2  10.12.68.149   m5.8xlarge      1121.280
==========================================================================================
==========================================================================================
     state                     name            ip       i_type  monthly_cost
0  running  butzer-ws-bigship-intel  10.12.68.185   m5.4xlarge       560.640
2  running   butzer-ws-olena-pangeo   10.12.69.13  t3a.2xlarge       219.584
4  running     butzer-ws1-tendollar    10.12.68.5     t2.small        16.790

```

## Delivery to the end-user

- rclone to caldera at EROS
- deep archive on Netapp W: drive


## Time Estimate Table

| Task                                       | Time    |
|--------------------------------------------|---------|
| Run The Model CONUS                        | 3days   |
| Mosaic the Chips CONUS                     | 5 Days  |
| Stage the Daily Data S3                    | 1 Day   |
| Rclone to Caldera per Variable             | 5 days  |
| Tallgrass - Make Conus Mosaic per Variable | 20 Days |
