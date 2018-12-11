package com.htcs.cms.listener;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

@WebListener
public class TomcatContextListener implements ServletContextListener {
    private static Logger logger = LoggerFactory.getLogger(TomcatContextListener.class);

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {

    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        logger.debug("down...");
        // TODO 添加缓存flush， 序列化到磁盘上
    }
}
