package com.bae.haram.repository;

import com.bae.haram.model.Haram;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface HaramRepository {
    Haram[] haramList(Haram haram) throws Exception;
    Haram[] tableList(Haram haram) throws Exception;
}