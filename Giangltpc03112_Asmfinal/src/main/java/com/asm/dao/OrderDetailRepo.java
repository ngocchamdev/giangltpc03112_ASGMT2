package com.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.asm.model.OrderDetail;


@Repository
public interface OrderDetailRepo extends JpaRepository<OrderDetail, Long>{

}
