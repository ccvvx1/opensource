import java.util.zip.Adler32;
import java.util.zip.CRC32;

public class Tmw {
    public static void main(String[] args) {
        byte[] byteArray = {26, 54, 26, 7, 82, 106, 15, 7, 98, 68, 1, 8, 2, 79, 72, 9, 18, 83, 69, 29, 8, 25, 27, 23, 1, 68, 65, 15, 10, 68, 87, 30, 5, 0, 76, 78, 1, 24, 87, 82, 7, 27, 78, 73, 7, 78, 68, 1, 2, 21, 19, 5, 1, 1, 68, 77, 2, 11, 1, 75};
        extracted(byteArray, 67);
//        byteArray = {26, 54, 26, 7, 82, 106, 15, 7, 98, 68, 1, 8, 2, 79, 72, 9, 18, 83, 69, 29, 8, 25, 27, 23, 1, 68, 65, 15, 10, 68, 87, 30, 5, 0, 76, 78, 1, 24, 87, 82, 7, 27, 78, 73, 7, 78, 68, 1, 2, 21, 19, 5, 1, 1, 68, 77, 2, 11, 1, 75};
        byte[] byteArray1 = {96, 54, 26, 7, 82, 106, 15, 7, 98, 76, 5, 10, 6, 11, 29, 22, 69, 67, 12, 26, 25, 8, 68, 78, 1, 27, 84, 66, 7, 69, 86, 23, 13, 5, 13, 5, 21, 17, 1, 74, 36, 0, 83, 54, 26, 85, 77, 12, 24, 89, 75, 14, 0, 21, 80, 85, 6, 26, 7, 9, 71, 84, 28, 13, 69, 83, 28, 9, 18, 3, 22, 19, 23, 69, 70, 9, 29, 82, 19, 3, 16, 77, 4, 7, 27, 1, 17, 22, 93};
        extracted(byteArray1, 57);
        byte[] byteArray2 = {26, 54, 26, 7, 82, 106, 15, 7, 98, 68, 1, 8, 2, 79, 72, 9, 18, 83, 69, 29, 8, 25, 27, 23, 1, 68, 65, 15, 10, 68, 87, 30, 5, 0, 76, 78, 1, 24, 87, 82, 7, 27, 78, 73, 7, 78, 68, 1, 2, 21, 19, 5, 1, 1, 68, 77, 2, 11, 1, 75};
        extracted(byteArray2, 67);
        byte[] byteArray3 = {86, 54, 26, 7, 82, 106, 15, 7, 98, 76, 5, 10, 6, 11, 29, 22, 69, 72, 9, 18, 83, 69, 29, 8, 25, 27, 23, 1, 74, 36, 0, 90, 60, 9, 4, 18, 22, 69, 82, 23, 11, 11, 18, 87, 89, 22, 26, 7, 82, 76, 5, 10, 6, 11, 29, 22, 69, 73, 15, 70, 89, 22, 26, 85, 87, 30, 26, 27, 72, 84, 27, 79, 82, 23, 6, 6, 12, 31, 19, 69, 83, 28, 9, 18, 3, 22, 19, 23, 69, 85, 5, 20, 5, 21, 17, 22, 93};
        extracted(byteArray3, 15);
        byte[] byteArray4 = {115, 54, 26, 7, 82, 106, 15, 7, 98, 83, 6, 23, 17, 16, 17, 27, 25, 4, 29, 6, 1, 78, 72, 9, 18, 83, 69, 29, 8, 25, 27, 23, 1, 74, 36, 0, 83, 54, 26, 85, 77, 12, 24, 89, 75, 14, 0, 21, 80, 85, 6, 26, 7, 9, 71, 84, 28, 13, 69, 83, 28, 9, 18, 3, 22, 19, 23, 69, 84, 27, 79, 87, 24, 29, 25, 75, 79, 1, 78, 69, 29, 17, 26, 7, 29, 7, 9, 71, 106, 14, 6, 112, 18, 70, 15, 5, 9, 22, 93};
        extracted(byteArray4, 42);
        byte[] byteArray5 = {85, 54, 26, 7, 82, 106, 15, 7, 98, 76, 5, 10, 6, 11, 29, 22, 69, 73, 26, 83, 78, 1, 27, 84, 65, 13, 0, 3, 24, 18, 1, 68, 84, 27, 79, 82, 7, 27, 64, 14, 112, 60, 9, 4, 18, 22, 69, 67, 12, 1, 26, 21, 2, 23, 84, 115, 38, 5, 0, 31, 29, 6, 84, 73, 15, 70, 89, 22, 26, 85, 84, 28, 1, 7, 5, 75, 84, 28, 1, 26, 83, 73, 26, 83, 65, 15, 78, 69, 23, 0, 29, 29, 92, 36, 0, 64, 15, 7, 98, 87, 30, 5, 0, 76, 84, 17, 23, 31, 4, 7, 15, 21, 17, 69, 83, 27, 7, 29, 6, 24, 21, 87};
        extracted(byteArray5, 12);
        byte[] byteArray6 = {121, 59, 15, 20, 1, 28, 7, 29, 27, 19, 31, 1, 68, 106, 15, 7, 98, 67, 15, 5, 12, 11, 26};
        extracted(byteArray6, 44);
        byte[] byteArray7 = {109, 15, 7, 98, 73, 26, 83, 78, 1, 27, 84, 80, 21, 23, 31, 4, 29, 0, 17, 1, 68, 84, 27, 79, 82, 7, 27};
        extracted(byteArray7, 39);
        byte[] byteArray8 = {-33, 39, 24, 23, 13, 5, 13, 68, 106, 15, 7, 98, 76, 5, 10, 6, 11, 29, 22, 69, 75, 14, 28};
        extracted(byteArray8, 150);
        byte[] byteArray9 = {-96, 1, 7, 23, 18, 72};
        extracted(byteArray9, 196);
        byte[] byteArray10 = {77, 11, 23, 23, 79, 93, 22, 6, 22, 7, 27, 29, 13, 87, 126, 34, 29, 27, 17, 6, 23, 29, 6, 1, 42, 43, 2, 12, 8, 7};
        extracted(byteArray10, 39);
        byte[] byteArray11 = {-23, 2, 17, 55, 44, 11, 1, 54, 60, 26, 7, 17, 6};
        extracted(byteArray11, 142);
        byte[] byteArray12 = {112, 11, 23, 23, 79, 66, 13, 15, 9, 73, 109, 47, 13, 18, 0};
        extracted(byteArray12, 26);
        byte[] byteArray13 = {38, 2, 17, 36, 34, 29, 27, 17, 6, 23, 29, 6, 1, 42, 43, 2, 12, 8, 7};
        extracted(byteArray13, 65);
        byte[] byteArray14 = {-107, 35, 0, 16, 23, 6, 11, 13, 11};
        extracted(byteArray14, 212);
        byte[] byteArray15 = {14, 60, 1, 26, 83, 68, 1, 8, 2, 79, 79, 9, 70, 106, 15, 7, 98, 67, 2, 15, 0, 1, 27, 84, 76, 3, 14, 5, 68, 83, 18, 23, 19, 1, 68, 106, 14, 6, 112, 18, 80, 2, 29, 5, 15, 6, 23, 7};
        extracted(byteArray15, 90);


        String originalText = "JEBKEY";
        int key = 42;

        // 加密
        byte[] encrypted = encrypt(originalText.getBytes(), key);
        System.out.println("Encrypted: " + new String(encrypted));

        // 解密
        byte[] decrypted = decrypt(encrypted, key);
        System.out.println("Decrypted: " + new String(decrypted));
    }

    private static void extracted(byte[] byteArray, int key) {
        System.out.println("=================================");
        int length = byteArray.length;
        byte[] bArr = new byte[length];
        byte b = (byte) key;
        for (int i = 0; i < length; i++) {
            bArr[i] = (byte) (b ^ byteArray[i]);
            b = bArr[i];
        }
        try {
            System.out.println(new String(bArr, "UTF-8"));
        } catch (Exception e2) {
        }
    }

    private static byte[] encrypt(byte[] byteArray, int key) {
        System.out.println("=================================");
        System.out.println("=================================");


        int length = byteArray.length;
        byte[] encryptedArray = new byte[length];
        byte b = (byte) key;

        for (int i = 0; i < length; i++) {
            encryptedArray[i] = (byte) (b ^ byteArray[i]);
            b = byteArray[i];
        }

        System.out.print("encryptedArray: ");
        for (byte bi : encryptedArray) {
            System.out.print(bi + ", ");
        }
        System.out.println();

        return encryptedArray;
    }


    private static byte[] decrypt(byte[] byteArray, int key) {
        System.out.println("=================================");
        System.out.println("=================================");
        int length = byteArray.length;
        byte[] bArr = new byte[length];
        byte b = (byte) key;
        for (int i = 0; i < length; i++) {
            bArr[i] = (byte) (b ^ byteArray[i]);
            b = bArr[i];
        }
        try {
            System.out.println(new String(bArr, "UTF-8"));
        } catch (Exception e2) {
        }

        return bArr;
    }

    private int flags;
    private long size = -1;
    private long crc32 = -1;
    private long adler32 = -1;
    private byte[] md5;
    private byte[] sha1;
    private byte[] sha256;

    private boolean doAlgo(int i) {
        return (this.flags & i) != 0;
    }

    public boolean compute() {
        try {
            CRC32 crc32 = doAlgo(1) ? new CRC32() : null;
            Adler32 adler32 = doAlgo(2) ? new Adler32() : null;
            MessageDigest messageDigest = doAlgo(4) ? MessageDigest.getInstance(KeyProperties.DIGEST_MD5) : null;
            MessageDigest messageDigest2 = doAlgo(8) ? MessageDigest.getInstance(KeyProperties.DIGEST_SHA1) : null;
            MessageDigest messageDigest3 = doAlgo(16) ? MessageDigest.getInstance(KeyProperties.DIGEST_SHA256) : null;
            long j = 0;
            byte[] bArr = new byte[16384];
            while (true) {
                int read = this.in.read(bArr, 0, bArr.length);
                if (read == -1) {
                    break;
                }
                if (crc32 != null) {
                    crc32.update(bArr, 0, read);
                }
                if (adler32 != null) {
                    adler32.update(bArr, 0, read);
                }
                if (messageDigest != null) {
                    messageDigest.update(bArr, 0, read);
                }
                if (messageDigest2 != null) {
                    messageDigest2.update(bArr, 0, read);
                }
                if (messageDigest3 != null) {
                    messageDigest3.update(bArr, 0, read);
                }
                j += read;
            }
            this.size = j;
            if (crc32 != null) {
                this.crc32 = crc32.getValue();
            }
            if (adler32 != null) {
                this.adler32 = adler32.getValue();
            }
            if (messageDigest != null) {
                this.md5 = messageDigest.digest();
            }
            if (messageDigest2 != null) {
                this.sha1 = messageDigest2.digest();
            }
            if (messageDigest3 != null) {
                this.sha256 = messageDigest3.digest();
                return true;
            }
            return true;
        } catch (NoSuchAlgorithmException e) {
            return false;
        }
    }
}
