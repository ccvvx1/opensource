    private void testDex(){
        try {
            // ָ����Ҫ���ص�DEX�ļ�·��
            String dexFilePath = "/data/data/com.chinamobile.cphsdk2demo/testDex.dex";

            // ��ȡ��ǰӦ�õ�ClassLoader
            ClassLoader parentClassLoader = MainActivity.class.getClassLoader();

            // ����DexClassLoader
            DexClassLoader dexClassLoader = new DexClassLoader(
                    dexFilePath,
                    null,
                    null,
                    parentClassLoader
            );

            // ������
            String className = "com.example.MyClass";
            Class<?> loadedClass = dexClassLoader.loadClass(className);

            // ����ʵ��
            Object instance = loadedClass.newInstance();

            // ���÷���
            Method method = loadedClass.getMethod("myMethod");
            method.invoke(instance);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }