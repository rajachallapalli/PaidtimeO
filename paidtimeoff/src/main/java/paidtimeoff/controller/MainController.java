package paidtimeoff.controller;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import paidtimeoff.model.PaidTimeOff;
import paidtimeoff.service.PaidTimeOffService;

@Controller
public class MainController {
	
	
	@Autowired
	private PaidTimeOffService paidTimeOffService;
	@GetMapping("")
	public String home(HttpServletRequest request)
	{
		request.setAttribute("mode","MODE_HOME");
		return "index";
	}
	
	@GetMapping("/all-ptos")
	public String allPTOs(HttpServletRequest request)
	{
		request.setAttribute("ptos", paidTimeOffService.findAll());
		request.setAttribute("mode","MODE_TASK");
		return "index";
	}
	
	@GetMapping("/new-pto")
	public String newPTO(HttpServletRequest request)
	{
		request.setAttribute("mode","MODE_NEW");
		return "index";
	}
	
	@PostMapping("/save-pto")
	public String savePTO(@ModelAttribute PaidTimeOff paidTimeOff,BindingResult bindingresult, HttpServletRequest request)
	{
		
		paidTimeOffService.save(paidTimeOff);
		request.setAttribute("ptos", paidTimeOffService.findAll());
		request.setAttribute("mode","MODE_TASK");
		return "index";
	}
	
	@GetMapping("/update-pto")
	public String updateTask(@RequestParam int id,HttpServletRequest request)
	{
		request.setAttribute("pto",paidTimeOffService.findTask(id));
		request.setAttribute("mode","MODE_UPDATE");
		return "index";
	}
	
	@GetMapping("/delete-pto")
	public String deleteTask(@RequestParam int id,HttpServletRequest request)
	{
		paidTimeOffService.delete(id);
		request.setAttribute("ptos", paidTimeOffService.findAll());
		request.setAttribute("mode","MODE_TASK");
		return "index";
	}
}
