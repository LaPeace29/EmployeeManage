package com.handler;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.domain.Region;
import com.persistance.RegionDAO;

public class EmployeeHandler {

	RegionDAO rDAO = new RegionDAO();
	// command.properties 파일에 등록된 메소드 선언
	public String employee_list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 주의) SELECT 액션 처리 후에는
		// 포워딩 액션을 위한 정보 반환
		// 주의) 상대경로로 지정
		return "/WEB-INF/views/employees/employeelist.jsp";
	}
	
	// command.properties 파일에 등록된 메소드 선언
	public String region_list(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Region> list = this.rDAO.list1();
		
		for(Region r : list) {
			System.out.println(r.print1());
		}
		return "/WEB-INF/views/region/regionlist.jsp";
	}
}
