package com.dsp.equipment.dao;


import com.dsp.equipment.entity.Role;

import java.util.List;


public interface RoleDao {

    public Role findById(Integer id);

    public List<Role> list(Role role);

    public Integer add(Role role);

    public Integer update(Role role);

    public Integer delete(Integer id);
}
