package com.htcs.cms.common;

import net.sf.ehcache.Cache;
import net.sf.ehcache.CacheManager;
import net.sf.ehcache.Element;
import net.sf.ehcache.config.CacheConfiguration;

import java.net.URL;

/**
 * Ehcache 缓存工具类
 *
 * @author Dragon
 * @create 2017-09-21 10:25
 **/
public class EhcacheUtil {

	public static final String HITS_CACHE = "hitsCache";
	private static final String path = "/ehcache.xml";

	private URL url;

	private CacheManager manager;

	private static EhcacheUtil ehcache;

	private EhcacheUtil(String path) {
		url = getClass().getResource(path);
		manager = CacheManager.create(url);
	}

	public static EhcacheUtil getInstance() {
		if (ehcache == null) {
			ehcache = EhcacheInstance.ehcacheUtil;
		}
		return ehcache;
	}

	private static class EhcacheInstance {
		static EhcacheUtil ehcacheUtil = new EhcacheUtil(path);
	}

	/**
	 * 存入数据
	 *
	 * @param cacheName
	 * @param key
	 * @param value
	 */
	public void put(String cacheName, String key, Object value) {
		Cache cache = get(cacheName);
		Element element = new Element(key, value);
		cache.put(element);
	}

	/**
	 * 取出数据
	 *
	 * @param cacheName
	 * @param key
	 * @return
	 */
	public Object get(String cacheName, String key) {
		Cache cache = get(cacheName);
		Element element = cache.get(key);
		return element == null ? null : element.getObjectValue();
	}

	/**
	 * 删除缓存数据
	 *
	 * @param cacheName
	 * @param key
	 */
	public void remove(String cacheName, String key) {
		Cache cache = get(cacheName);
		cache.remove(key);
	}

	private Cache get(String cacheName) {
		return manager.getCache(cacheName);
	}

}
