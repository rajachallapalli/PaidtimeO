package paidtimeoff.dao;

import org.springframework.data.repository.CrudRepository;

import paidtimeoff.model.PaidTimeOff;

public interface PaidTimeOffRepository extends CrudRepository<PaidTimeOff,Integer> {

}
