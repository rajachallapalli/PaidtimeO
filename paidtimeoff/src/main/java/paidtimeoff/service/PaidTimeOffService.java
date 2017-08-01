package paidtimeoff.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import paidtimeoff.dao.PaidTimeOffRepository;
import paidtimeoff.model.PaidTimeOff;


@Service
@Transactional
public class PaidTimeOffService {
	
	private final PaidTimeOffRepository paidTimeOffRepository;

	public PaidTimeOffService(PaidTimeOffRepository paidTimeOffRepository) {
		
		this.paidTimeOffRepository = paidTimeOffRepository;
	}

	public List<PaidTimeOff> findAll()
	{
		List<PaidTimeOff> paidTimeOffs=new ArrayList<>();
		for(PaidTimeOff paidTimeOff : paidTimeOffRepository.findAll())
		{
			paidTimeOffs.add(paidTimeOff);
		}
		
		return paidTimeOffs;
	}
	
	public PaidTimeOff findTask(int id)
	{
		return paidTimeOffRepository.findOne(id);
	}
	
	public void save(PaidTimeOff paidTimeOff)
	{
		paidTimeOffRepository.save(paidTimeOff);
	}
	
	public void delete(int id)
	{
		paidTimeOffRepository.delete(id);
	}
	
}
