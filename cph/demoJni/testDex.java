    private void testDex(){
        try {
            // 指定需要加载的DEX文件路径
            String dexFilePath = "/data/data/com.chinamobile.cphsdk2demo/testDex.dex";

            // 获取当前应用的ClassLoader
            ClassLoader parentClassLoader = MainActivity.class.getClassLoader();

            // 创建DexClassLoader
            DexClassLoader dexClassLoader = new DexClassLoader(
                    dexFilePath,
                    null,
                    null,
                    parentClassLoader
            );

            // 加载类
            String className = "com.example.MyClass";
            Class<?> loadedClass = dexClassLoader.loadClass(className);

            // 创建实例
            Object instance = loadedClass.newInstance();

            // 调用方法
            Method method = loadedClass.getMethod("myMethod");
            method.invoke(instance);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }