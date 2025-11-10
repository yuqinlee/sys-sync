a ={1,"abc",function ()end,{}}

print(a[1])

print(type(a[1]))
print(type(a[2]))

for index, value in ipairs(t) do
    
    print(a)
end
for index, value in ipairs(a) do
    print(index,value)
end


for key, value in pairs(a) do
    print(key,value)
end

print(#a)
pri
