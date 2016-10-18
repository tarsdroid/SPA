# encoding: utf-8
=begin
项目: SPA
类名/模块名:
文件: Data_VisibleWedge.rb
功能:
输入:
输出:
作者:宋世伟
日期:16/6/24
时间:下午2:13
备注:
=end
require File.join($SPA_Path, '/Entity/Path')
require File.join($SPA_Path, '/Entity/Cube')
require File.join($SPA_Path, '/IO/SPA_Read')

module Data_VisibleWedge
  def wedgeArray (cube)

    wedgeArray = Array.new #可见劈数组
    #cubeArray.each do |cube|
    l=cube.plane.size
#    p "1234567890#{l}"
      for i in 0 ..l-2
        for j in i+1..l-1
          a=cube.plane[i].type
   #       p "13580#{a}"
          b=cube.plane[j].type
 #         p "13590#{b}"
          if compare1(cube.plane[i],cube.plane[j],a,b).length!= 0 then
          wedgePoint=compare1(cube.plane[i], cube.plane[j],a,b)
          wedge =[wedgePoint, cube.plane[i], cube.plane[j]]
          wedgeArray.push(wedge)

          end
        end
      end
    #end
  #  p wedgeArray
    return wedgeArray
  end


module_function :wedgeArray

def compare1(plane_A, plane_B,a,b)
  wedgePoint=Array.new
  for k in 0..a-1
    for l in 0..b-1
      if plane_A.point[k]==plane_B.point[l] then
        wedgePoint.push(plane_A.point[k])

      end
    end


  end
  return wedgePoint
end
  module_function :compare1
end



#p wedgeArray(cubeArray)