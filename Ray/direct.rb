# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: direct.rb
功能:计算直射路径
输入:网元对象、终端对象、平面数组对象、信号对象
输出:直射路径数组[损耗，时延,[坐标数组]]
作者:刘洋
日期:16/6/14
时间:下午4:29
备注:未测试
=end
require File.join(File.expand_path(".."),'/Space/intersect')
require File.join(File.expand_path(".."),'/Space/verifyPoint')
require File.join(File.expand_path(".."),'/Delay/delay')
require File.join(File.expand_path(".."),'/Loss/directLoss')
def direct(beginPoint,endPoint,planeArray,singal)
  directPoint = [beginPoint,endPoint] #交点数组
  pointNumber = directPoint.length
  planeArray.each do |plane|
    interPoint = intersect(beginPoint,endPoint,plane.point,plane.equation) #求直线和平面交点
    pointResult = verifyPoint(beginPoint,endPoint,interPoint) #计算交点
    if pointResult == 1 then
      return directPoint #无直射路径返回初始交点数组
    end
  end
  directDelay = delay(directPoint,pointNumber) #计算时延
  directDistance = distance(directPoint,pointNumber) #计算距离
  directLossValue = directLoss(singal.strength,singal.frequency,directDistance) #计算损耗
  directPath = [directLossValue,directDelay,directPoint] #直射路径数组
  return directPath
end
