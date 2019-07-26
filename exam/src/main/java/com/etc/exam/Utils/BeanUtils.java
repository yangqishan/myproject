package com.etc.exam.Utils;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

/**
 * 数组拷贝工具
 *
 * @author xiongx
 */
public class BeanUtils extends org.springframework.beans.BeanUtils {

    /**
     * 拷贝工具
     */
    public static <T> List<T> copyAsList(Collection<?> collection, Class<T> clazz) {
        List<T> targetList = new ArrayList<>();
        if (collection != null) {
            T target = null;
            Iterator<?> it = collection.iterator();
            try {
                while (it.hasNext()) {
                    target = clazz.newInstance();
                    copyProperties(it.next(), target);
                    targetList.add(target);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return targetList;
    }

    /**
     * 拷贝工具
     */
    @SuppressWarnings("unchecked")
    public static <T> T[] copyAsArray(Collection<?> collection, Class<T> clazz) {
        List<T> targetList = copyAsList(collection, clazz);
        return (T[]) targetList.toArray();
    }

    /**
     * 拷贝
     */
    public static <T> T deepCopy(Object source, Class<T> clazz) {
        try {
            T target = clazz.newInstance();
            BeanUtils.copyProperties(source, target);
            return target;
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 拷贝
     */
    public static void copyProperties(Object source, Object target) {
        if(source!=null){
            org.springframework.beans.BeanUtils.copyProperties(source, target);
        }
    }
}

