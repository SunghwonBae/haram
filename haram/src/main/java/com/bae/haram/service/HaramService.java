package com.bae.haram.service;

import com.bae.haram.model.Haram;
import com.bae.haram.repository.HaramRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class HaramService {
    
    @Autowired
    HaramRepository haramRepository;

    public  Haram[] haramList(Haram haram) throws Exception{
        return haramRepository.haramList(haram);
    }


    public  Haram[] tableList(Haram haram) throws Exception{
        return haramRepository.tableList(haram);
    }


}