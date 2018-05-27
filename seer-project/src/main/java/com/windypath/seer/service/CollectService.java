package com.windypath.seer.service;

import com.windypath.seer.pojo.Collect;

public interface CollectService {
    void add(Collect c);
    void delete(int id);
    Collect get(int uid,int aid);
}
