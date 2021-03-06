package com.cte.credit.gw.action.crypto;


import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.Security;

/**
 * Created by caoyanfei079 on 4/23/15.
 */
public final class WandaAES {
    static {
        Security.addProvider(new org.bouncycastle.jce.provider.BouncyCastleProvider());
    }
    private final byte[] passwordBytes;
    private final Integer keySize;

    public WandaAES(byte[] passwordBytes) {
        this(passwordBytes, AESConstants.AES_SIZE_128);
    }
    public WandaAES(byte[] passwordBytes, Integer keySize) {
        this.passwordBytes = passwordBytes;
        this.keySize = keySize;
    }
    protected Cipher getEncryptCipher() throws WandaCryptoAESException {
        return getCipher(Cipher.ENCRYPT_MODE);
    }

    protected Cipher getDecryptCipher() throws WandaCryptoAESException {
        return getCipher(Cipher.DECRYPT_MODE);
    }

    // cipher 不是线程安全的，如果需要性能上的考虑，
    // 使用cache的方案来实现，暂时应该不需要
    protected Cipher getCipher(Integer mode) throws WandaCryptoAESException {
        try {
            SecretKeySpec key = new SecretKeySpec(passwordBytes, AESConstants.ALGORITHM_AES);
            Cipher cipher = Cipher.getInstance(AESConstants.CIPHER_ALGORITHM_CBC,AESConstants.BC_PROVIDER);// 创建密码器
            cipher.init(mode, key, new IvParameterSpec(AESConstants.DEFAULT_ROOT_IV.getBytes()));// 初始化
            return cipher;
        }catch (Exception e) {
            throw new WandaCryptoAESException("Failed to get the cipher with passwordBytes [" + passwordBytes + "] key size + [" + keySize + "] mode [" + mode + "]", e);
        }
    }

    /**
     * 加密
     *
     * @param content 需要加密的内容
     * @return
     */
    public byte[] encrypt(String content) throws WandaCryptoAESException {
        try {
            byte[] byteContent = content.getBytes(AESConstants.DEFAULT_CHARSET);
            return encrypt(byteContent);
        } catch (Exception e) {
            throw new WandaCryptoAESException("failed to encryptInputStream the content [" + content + "]",e);
        }
    }
    public byte[] decrypt(String content) throws WandaCryptoAESException {
        try {
            byte[] byteContent = content.getBytes(AESConstants.DEFAULT_CHARSET);
            return decrypt(byteContent);
        } catch (Exception e) {
            throw new WandaCryptoAESException("failed to decryptOutputStream the content [" + content + "]",e);
        }
    }

    public byte[] encrypt(byte[] content) throws WandaCryptoAESException {
        try {
            return getEncryptCipher().doFinal(content);
        } catch (Exception e) {
            throw new WandaCryptoAESException("failed to encryptInputStream the content [" + content + "]",e);
        }
    }
    public byte[] decrypt(byte[] content) throws WandaCryptoAESException {
        try {
            return getDecryptCipher().doFinal(content);
        } catch (Exception e) {
            throw new WandaCryptoAESException("failed to Decrypt the content [" + content + "]",e);
        }
    }
}
