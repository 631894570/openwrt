#添加kenzok8/small-package库
sed -i '$a src-git small8 https://github.com/kenzok8/small-package' feeds.conf.default


#添加iStoreOS
svn co https://github.com/linkease/istore/trunk/luci package/istore
svn co https://github.com/linkease/istore-ui/trunk/app-store-ui package/app-store-ui
rm -rf package/istore/.svn
sed -i 's/luci-lib-ipkg/luci-base/g' package/istore/luci-app-store/Makefile
sed -i 's/("iStore"), 31/("应用商店"), 61/g' package/istore/luci-app-store/luasrc/controller/store.lua
